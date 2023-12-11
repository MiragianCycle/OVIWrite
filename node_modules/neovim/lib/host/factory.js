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
Object.defineProperty(exports, "__esModule", { value: true });
exports.loadPlugin = void 0;
const path = __importStar(require("path"));
const Module = require("module");
const logger_1 = require("../utils/logger");
const NvimPlugin_1 = require("./NvimPlugin");
// inspiration drawn from Module
function createPlugin(filename, nvim, options = {}) {
    try {
        logger_1.logger.debug(`createPlugin.${filename}.clearCache: ${options && !options.cache}`);
        // Clear module from cache
        if (options && !options.cache) {
            try {
                // `as any` to access hidden API
                delete Module._cache[require.resolve(filename)];
            }
            catch (err) {
                // possible this doesn't exist in cache, ignore
            }
        }
        // attempt to import plugin
        // Require plugin to export a class
        // eslint-disable-next-line global-require, @typescript-eslint/no-var-requires, import/no-dynamic-require
        const defaultImport = require(filename);
        const plugin = (defaultImport && defaultImport.default) || defaultImport;
        if (typeof plugin === 'function') {
            return new NvimPlugin_1.NvimPlugin(filename, plugin, nvim);
        }
    }
    catch (err) {
        const file = path.basename(filename);
        logger_1.logger.error(`[${file}] ${err.stack}`);
        logger_1.logger.error(`[${file}] Error loading child ChildPlugin ${filename}`);
    }
    // There may have been an error, but maybe not
    return null;
}
function loadPlugin(filename, nvim, options = {}) {
    try {
        return createPlugin(filename, nvim, options);
    }
    catch (err) {
        // logger.error(`Could not load plugin "${filename}":`, err, err.stack);
        return null;
    }
}
exports.loadPlugin = loadPlugin;
