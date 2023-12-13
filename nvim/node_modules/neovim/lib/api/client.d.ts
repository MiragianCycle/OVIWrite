/// <reference types="node" />
/**
 * Handles attaching transport
 */
import { logger } from '../utils/logger';
import { Transport } from '../utils/transport';
import { VimValue } from '../types/VimValue';
import { Neovim } from './Neovim';
import { Buffer } from './Buffer';
export declare class NeovimClient extends Neovim {
    protected requestQueue: any[];
    private transportAttached;
    private _channelId;
    private attachedBuffers;
    constructor(options?: {
        transport?: Transport;
        logger?: typeof logger;
    });
    /** Attaches msgpack to read/write streams * */
    attach({ reader, writer, }: {
        reader: NodeJS.ReadableStream;
        writer: NodeJS.WritableStream;
    }): void;
    get isApiReady(): boolean;
    get channelId(): Promise<number>;
    isAttached(buffer: Buffer): boolean;
    handleRequest(method: string, args: VimValue[], resp: any, ...restArgs: any[]): void;
    emitNotification(method: string, args: any[]): void;
    handleNotification(method: string, args: VimValue[], ...restArgs: any[]): void;
    setupTransport(): void;
    requestApi(): Promise<any[]>;
    generateApi(): Promise<null | boolean>;
    attachBuffer(buffer: Buffer, eventName: string, cb: Function): Function;
    /**
     * Returns `true` if buffer should be detached
     */
    detachBuffer(buffer: Buffer, eventName: string, cb: Function): boolean;
}
