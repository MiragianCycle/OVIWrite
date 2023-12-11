import * as winston from 'winston';
export declare type Logger = Pick<winston.Logger, 'info' | 'warn' | 'error' | 'debug'>;
export declare const logger: Logger;
