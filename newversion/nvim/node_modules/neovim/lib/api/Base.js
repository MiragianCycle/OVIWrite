"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var _a;
Object.defineProperty(exports, "__esModule", { value: true });
exports.BaseApi = void 0;
const events_1 = require("events");
const DO_REQUEST = Symbol('DO_REQUEST');
// TODO:
// APIs that should not be allowed to be called directly
// attach/detach should be handled by the API client instead of the
// user directly.
//
// i.e. a plugin that detaches will affect all plugins registered on host
// const EXCLUDED = ['nvim_buf_attach', 'nvim_buf_detach'];
// Instead of dealing with multiple inheritance (or lackof), just extend EE
// Only the Neovim API class should use EE though
class BaseApi extends events_1.EventEmitter {
    constructor({ transport, data, logger, metadata, client, }) {
        super();
        this[_a] = (name, args = []) => new Promise((resolve, reject) => {
            this.transport.request(name, args, (err, res) => {
                this.logger.debug(`response -> neovim.api.${name}: ${res}`);
                if (err) {
                    reject(new Error(`${name}: ${err[1]}`));
                }
                else {
                    resolve(res);
                }
            });
        });
        this.setTransport(transport);
        this.data = data;
        // eslint-disable-next-line global-require, @typescript-eslint/no-var-requires
        this.logger = logger || require('../utils/logger').logger;
        this.client = client;
        if (metadata) {
            Object.defineProperty(this, 'metadata', { value: metadata });
        }
    }
    setTransport(transport) {
        this.transport = transport;
    }
    equals(other) {
        try {
            return String(this.data) === String(other.data);
        }
        catch (e) {
            return false;
        }
    }
    asyncRequest(name, args = [], stack) {
        return __awaiter(this, void 0, void 0, function* () {
            // `this._isReady` is undefined in ExtType classes (i.e. Buffer, Window, Tabpage)
            // But this is just for Neovim API, since it's possible to call this method from Neovim class
            // before transport is ready.
            // Not possible for ExtType classes since they are only created after transport is ready
            yield this._isReady;
            this.logger.debug(`request -> neovim.api.${name}`);
            return this[DO_REQUEST](name, args).catch(err => {
                const newError = new Error(err.message);
                newError.stack = stack;
                this.logger.error(`Error making request to ${name}`, newError);
                throw newError;
            });
        });
    }
    request(name, args = []) {
        const error = new Error(`Error making request to ${name}`);
        return this.asyncRequest(name, args, error.stack);
    }
    _getArgsByPrefix(...args) {
        const _args = [];
        // Check if class is Neovim and if so, should not send `this` as first arg
        if (this.prefix !== 'nvim_') {
            _args.push(this);
        }
        return _args.concat(args);
    }
    /** Retrieves a scoped variable depending on type (using `this.prefix`) */
    getVar(name) {
        return __awaiter(this, void 0, void 0, function* () {
            const args = this._getArgsByPrefix(name);
            return this.request(`${this.prefix}get_var`, args).then(res => res, err => {
                if (err && err.message && err.message.includes('not found')) {
                    return null;
                }
                throw err;
            });
        });
    }
    /** Set a scoped variable */
    setVar(name, value) {
        const args = this._getArgsByPrefix(name, value);
        return this.request(`${this.prefix}set_var`, args);
    }
    /** Delete a scoped variable */
    deleteVar(name) {
        const args = this._getArgsByPrefix(name);
        return this.request(`${this.prefix}del_var`, args);
    }
    /** Retrieves a scoped option depending on type of `this` */
    getOption(name) {
        const args = this._getArgsByPrefix(name);
        return this.request(`${this.prefix}get_option`, args);
    }
    /** Set scoped option */
    setOption(name, value) {
        const args = this._getArgsByPrefix(name, value);
        return this.request(`${this.prefix}set_option`, args);
    }
    // TODO: Is this necessary?
    /** `request` is basically the same except you can choose to wait forpromise to be resolved */
    notify(name, args) {
        this.logger.debug(`notify -> neovim.api.${name}`);
        this.transport.notify(name, args);
    }
}
exports.BaseApi = BaseApi;
_a = DO_REQUEST;
