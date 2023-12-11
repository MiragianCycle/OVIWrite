/**
 * Some code borrowed from https://github.com/tarruda/node-msgpack5rpc
 */
/// <reference types="node" />
import { EventEmitter } from 'events';
declare class Transport extends EventEmitter {
    private pending;
    private nextRequestId;
    private reader;
    private writer;
    private readonly extensionCodec;
    private client;
    private initializeExtensionCodec;
    private encodeToBuffer;
    attach(writer: NodeJS.WritableStream, reader: NodeJS.ReadableStream, client: any): void;
    request(method: string, args: any[], cb: Function): void;
    notify(method: string, args: any[]): void;
    parseMessage(msg: any[]): void;
}
export { Transport };
