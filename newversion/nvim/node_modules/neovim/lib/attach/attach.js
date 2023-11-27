"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.attach = void 0;
const net_1 = require("net");
const client_1 = require("../api/client");
function attach({ reader: _reader, writer: _writer, proc, socket, options = {}, }) {
    let writer;
    let reader;
    if (socket) {
        const client = (0, net_1.createConnection)(socket);
        writer = client;
        reader = client;
    }
    else if (_reader && _writer) {
        writer = _writer;
        reader = _reader;
    }
    else if (proc) {
        writer = proc.stdin;
        reader = proc.stdout;
    }
    if (writer && reader) {
        // eslint-disable-next-line global-require, @typescript-eslint/no-var-requires
        const loggerInstance = options.logger || require('../utils/logger').logger; // lazy load to winston only if needed
        const neovim = new client_1.NeovimClient({ logger: loggerInstance });
        neovim.attach({
            writer,
            reader,
        });
        return neovim;
    }
    throw new Error('Invalid arguments, could not attach');
}
exports.attach = attach;
