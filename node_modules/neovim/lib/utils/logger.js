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
exports.logger = void 0;
const winston = __importStar(require("winston"));
const level = process.env.NVIM_NODE_LOG_LEVEL || 'debug';
function setupWinstonLogger() {
    const logger = winston.createLogger({
        level,
    });
    if (process.env.NVIM_NODE_LOG_FILE) {
        logger.add(new winston.transports.File({
            filename: process.env.NVIM_NODE_LOG_FILE,
            level,
        }));
    }
    if (process.env.ALLOW_CONSOLE) {
        logger.add(new winston.transports.Console({
            format: winston.format.simple(),
        }));
    }
    if (!process.env.NVIM_NODE_LOG_FILE && !process.env.ALLOW_CONSOLE) {
        // Silent logger is necessary to avoid 'Attempt to write logs with no transports' error
        logger.add(new winston.transports.Console({ silent: true }));
    }
    return logger;
}
exports.logger = setupWinstonLogger();
