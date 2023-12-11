"use strict";
/**
 * Some code borrowed from https://github.com/tarruda/node-msgpack5rpc
 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.Transport = void 0;
const events_1 = require("events");
const msgpack_1 = require("@msgpack/msgpack");
const types_1 = require("../api/types");
class Response {
    constructor(encoder, requestId) {
        this.encoder = encoder;
        this.requestId = requestId;
    }
    send(resp, isError) {
        if (this.sent) {
            throw new Error(`Response to id ${this.requestId} already sent`);
        }
        const encoded = (0, msgpack_1.encode)([
            1,
            this.requestId,
            isError ? resp : null,
            !isError ? resp : null,
        ]);
        this.encoder.write(Buffer.from(encoded.buffer, encoded.byteOffset, encoded.byteLength));
        this.sent = true;
    }
}
class Transport extends events_1.EventEmitter {
    constructor() {
        super(...arguments);
        this.pending = new Map();
        this.nextRequestId = 1;
        this.extensionCodec = this.initializeExtensionCodec();
    }
    initializeExtensionCodec() {
        const codec = new msgpack_1.ExtensionCodec();
        types_1.Metadata.forEach(({ constructor }, id) => {
            codec.register({
                type: id,
                encode: (input) => {
                    if (input instanceof constructor) {
                        return (0, msgpack_1.encode)(input.data);
                    }
                    return null;
                },
                decode: data => new constructor({
                    transport: this,
                    client: this.client,
                    data: (0, msgpack_1.decode)(data),
                }),
            });
        });
        return codec;
    }
    encodeToBuffer(value) {
        const encoded = (0, msgpack_1.encode)(value, { extensionCodec: this.extensionCodec });
        return Buffer.from(encoded.buffer, encoded.byteOffset, encoded.byteLength);
    }
    attach(writer, reader, client) {
        this.writer = writer;
        this.reader = reader;
        this.client = client;
        this.reader.on('end', () => {
            this.emit('detach');
        });
        const asyncDecodeGenerator = (0, msgpack_1.decodeMultiStream)(this.reader, {
            extensionCodec: this.extensionCodec,
        });
        // naively iterate async generator created via decodeMultiStream.
        // when runtime / polyfill allows replace to `for await (const val of asyncDecodeGenerator)`
        // syntax instead.
        const resolveGeneratorRecursively = (iter) => {
            iter.next().then(resolved => {
                if (!resolved.done) {
                    this.parseMessage(resolved.value);
                    return resolveGeneratorRecursively(iter);
                }
                return Promise.resolve();
            });
        };
        resolveGeneratorRecursively(asyncDecodeGenerator);
    }
    request(method, args, cb) {
        this.nextRequestId = this.nextRequestId + 1;
        this.writer.write(this.encodeToBuffer([0, this.nextRequestId, method, args]));
        this.pending.set(this.nextRequestId, cb);
    }
    notify(method, args) {
        this.writer.write(this.encodeToBuffer([2, method, args]));
    }
    parseMessage(msg) {
        const msgType = msg[0];
        if (msgType === 0) {
            // request
            //   - msg[1]: id
            //   - msg[2]: method name
            //   - msg[3]: arguments
            this.emit('request', msg[2].toString(), msg[3], new Response(this.writer, msg[1]));
        }
        else if (msgType === 1) {
            // response to a previous request:
            //   - msg[1]: the id
            //   - msg[2]: error(if any)
            //   - msg[3]: result(if not errored)
            const id = msg[1];
            const handler = this.pending.get(id);
            this.pending.delete(id);
            handler(msg[2], msg[3]);
        }
        else if (msgType === 2) {
            // notification/event
            //   - msg[1]: event name
            //   - msg[2]: arguments
            this.emit('notification', msg[1].toString(), msg[2]);
        }
        else {
            this.writer.write(this.encodeToBuffer([1, 0, 'Invalid message type', null]));
        }
    }
}
exports.Transport = Transport;
