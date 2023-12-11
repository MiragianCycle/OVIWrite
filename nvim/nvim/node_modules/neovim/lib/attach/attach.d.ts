/// <reference types="node" />
import * as child from 'child_process';
import { NeovimClient } from '../api/client';
import { Logger } from '../utils/logger';
export interface Attach {
    reader?: NodeJS.ReadableStream;
    writer?: NodeJS.WritableStream;
    proc?: NodeJS.Process | child.ChildProcess;
    socket?: string;
    options?: {
        logger?: Logger;
    };
}
export declare function attach({ reader: _reader, writer: _writer, proc, socket, options, }: Attach): NeovimClient;
