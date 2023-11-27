/// <reference types="node" />
import { EventEmitter } from 'events';
import { Transport } from '../utils/transport';
import { Logger } from '../utils/logger';
import { VimValue } from '../types/VimValue';
export interface BaseConstructorOptions {
    transport?: Transport;
    logger?: Logger;
    data?: Buffer;
    metadata?: any;
    client?: any;
}
declare const DO_REQUEST: unique symbol;
export declare class BaseApi extends EventEmitter {
    protected transport: Transport;
    protected _isReady: Promise<boolean>;
    protected prefix: string;
    logger: Logger;
    data: Buffer | number;
    protected client: any;
    constructor({ transport, data, logger, metadata, client, }: BaseConstructorOptions);
    protected setTransport(transport: Transport): void;
    equals(other: BaseApi): boolean;
    [DO_REQUEST]: (name: string, args?: any[]) => Promise<any>;
    asyncRequest(name: string, args: any[], stack: string): Promise<any>;
    request(name: string, args?: any[]): Promise<any>;
    _getArgsByPrefix(...args: any[]): any[];
    /** Retrieves a scoped variable depending on type (using `this.prefix`) */
    getVar(name: string): Promise<VimValue>;
    /** Set a scoped variable */
    setVar(name: string, value: VimValue): Promise<void>;
    /** Delete a scoped variable */
    deleteVar(name: string): Promise<void>;
    /** Retrieves a scoped option depending on type of `this` */
    getOption(name: string): Promise<VimValue> | void;
    /** Set scoped option */
    setOption(name: string, value: VimValue): Promise<void> | void;
    /** `request` is basically the same except you can choose to wait forpromise to be resolved */
    notify(name: string, args: any[]): void;
}
export {};
