"use strict";
/* eslint global-require:0 */
Object.defineProperty(exports, "__esModule", { value: true });
exports.Command = exports.Autocmd = exports.Function = exports.Plugin = void 0;
var plugin_1 = require("./plugin");
Object.defineProperty(exports, "Plugin", { enumerable: true, get: function () { return plugin_1.plugin; } });
var function_1 = require("./function");
Object.defineProperty(exports, "Function", { enumerable: true, get: function () { return function_1.nvimFunction; } });
var autocmd_1 = require("./autocmd");
Object.defineProperty(exports, "Autocmd", { enumerable: true, get: function () { return autocmd_1.autocmd; } });
var command_1 = require("./command");
Object.defineProperty(exports, "Command", { enumerable: true, get: function () { return command_1.command; } });
