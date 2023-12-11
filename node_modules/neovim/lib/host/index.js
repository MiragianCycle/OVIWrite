"use strict";
var __createBinding = (this && this.__createBinding) || (Object.create ? (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    Object.defineProperty(o, k2, { enumerable: true, get: function() { return m[k]; } });
}) : (function(o, m, k, k2) {
    if (k2 === undefined) k2 = k;
    o[k2] = m[k];
}));
var __setModuleDefault = (this && this.__setModuleDefault) || (Object.create ? (function(o, v) {
    Object.defineProperty(o, "default", { enumerable: true, value: v });
}) : function(o, v) {
    o["default"] = v;
});
var __importStar = (this && this.__importStar) || function (mod) {
    if (mod && mod.__esModule) return mod;
    var result = {};
    if (mod != null) for (var k in mod) if (k !== "default" && Object.prototype.hasOwnProperty.call(mod, k)) __createBinding(result, mod, k);
    __setModuleDefault(result, mod);
    return result;
};
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Host = void 0;
const util = __importStar(require("util"));
const attach_1 = require("../attach");
const logger_1 = require("../utils/logger");
const factory_1 = require("./factory");
class Host {
    constructor() {
        // Map for loaded plugins
        this.loaded = {};
        this.handler = this.handler.bind(this);
        this.handlePlugin = this.handlePlugin.bind(this);
    }
    getPlugin(filename, options = {}) {
        let plugin = this.loaded[filename];
        const shouldUseCachedPlugin = plugin && plugin.shouldCacheModule && !plugin.alwaysInit;
        if (shouldUseCachedPlugin) {
            logger_1.logger.debug('getPlugin.useCachedPlugin');
            return plugin;
        }
        plugin = (0, factory_1.loadPlugin)(filename, this.nvim, Object.assign(Object.assign({}, options), { cache: plugin && plugin.shouldCacheModule }));
        logger_1.logger.debug('getPlugin.alwaysInit', plugin && !plugin.alwaysInit);
        this.loaded[filename] = plugin;
        return plugin;
    }
    // Route incoming request to a plugin
    handlePlugin(method, args) {
        return __awaiter(this, void 0, void 0, function* () {
            // ignore methods that start with nvim_ prefix (e.g. when attaching to buffer and listening for notifications)
            if (method.startsWith('nvim_'))
                return null;
            logger_1.logger.debug('host.handlePlugin: ', method);
            // Parse method name
            const procInfo = method.split(':');
            if (process.platform === 'win32') {
                // Windows-style absolute paths is formatted as [A-Z]:\path\to\file.
                // Forward slash as path separator is ok
                // so Neovim uses it to avoid escaping backslashes.
                //
                // For absolute path of cmd.exe with forward slash as path separator,
                // method.split(':') returns ['C', '/Windows/System32/cmd.exe', ...].
                // procInfo should be ['C:/Windows/System32/cmd.exe', ...].
                const networkDrive = procInfo.shift();
                procInfo[0] = `${networkDrive}:${procInfo[0]}`;
            }
            const filename = procInfo[0];
            const type = procInfo[1];
            const procName = `${procInfo.slice(2).join(' ')}`;
            const plugin = this.getPlugin(filename);
            if (!plugin) {
                const msg = `Could not load plugin: ${filename}`;
                logger_1.logger.error(msg);
                throw new Error(msg);
            }
            return plugin.handleRequest(procName, type, args);
        });
    }
    handleRequestSpecs(method, args, res) {
        const filename = args[0];
        logger_1.logger.debug(`requested specs for ${filename}`);
        // Can return null if there is nothing defined in plugin
        const plugin = this.getPlugin(filename);
        const specs = (plugin && plugin.specs) || [];
        logger_1.logger.debug(JSON.stringify(specs));
        res.send(specs);
        logger_1.logger.debug(`specs: ${util.inspect(specs)}`);
    }
    handler(method, args, res) {
        return __awaiter(this, void 0, void 0, function* () {
            logger_1.logger.debug('request received: ', method);
            // 'poll' and 'specs' are requests by neovim,
            // otherwise it will
            if (method === 'poll') {
                // Handshake for neovim
                res.send('ok');
            }
            else if (method === 'specs') {
                // Return plugin specs
                this.handleRequestSpecs(method, args, res);
            }
            else {
                try {
                    const plugResult = yield this.handlePlugin(method, args);
                    res.send(!plugResult || typeof plugResult === 'undefined' ? null : plugResult);
                }
                catch (err) {
                    res.send(err.toString(), true);
                }
            }
        });
    }
    start({ proc }) {
        return __awaiter(this, void 0, void 0, function* () {
            logger_1.logger.debug('host.start');
            // stdio is reversed since it's from the perspective of Neovim
            const nvim = (0, attach_1.attach)({ reader: proc.stdin, writer: proc.stdout });
            this.nvim = nvim;
            if (nvim) {
                nvim.on('request', this.handler);
                nvim.on('notification', this.handlePlugin);
                nvim.on('disconnect', () => {
                    logger_1.logger.debug('host.disconnected');
                });
            }
        });
    }
}
exports.Host = Host;
