import { BaseApi } from './Base';
export interface BufferSetLines {
    start?: number;
    end?: number;
    strictIndexing?: boolean;
}
export interface BufferHighlight {
    hlGroup?: string;
    line?: number;
    colStart?: number;
    colEnd?: number;
    srcId?: number;
}
export interface BufferClearHighlight {
    srcId?: number;
    lineStart?: number;
    lineEnd?: number;
}
export interface BufferClearNamespace {
    nsId?: number;
    lineStart?: number;
    lineEnd?: number;
}
export declare type VirtualTextChunk = [string, string];
export declare const DETACH: unique symbol;
export declare const ATTACH: unique symbol;
export declare class Buffer extends BaseApi {
    prefix: string;
    get isAttached(): boolean;
    /**
     * Attach to buffer to listen to buffer events
     * @param sendBuffer Set to true if the initial notification should contain
     *        the whole buffer. If so, the first notification will be a
     *        `nvim_buf_lines_event`. Otherwise, the first notification will be
     *        a `nvim_buf_changedtick_event`
     */
    [ATTACH]: (sendBuffer?: boolean, options?: {}) => Promise<boolean>;
    /**
     * Detach from buffer to stop listening to buffer events
     */
    [DETACH]: () => Promise<any>;
    /**
     * Get the bufnr of Buffer
     */
    get id(): number;
    /** Total number of lines in buffer */
    get length(): Promise<number>;
    /** Get lines in buffer */
    get lines(): Promise<string[]>;
    /** Gets a changed tick of a buffer */
    get changedtick(): Promise<number>;
    get commands(): Promise<Record<string, any>>;
    getCommands(options?: {}): Promise<Record<string, any>>;
    /** Get specific lines of buffer */
    getLines({ start, end, strictIndexing }?: {
        start: number;
        end: number;
        strictIndexing: boolean;
    }): Promise<string[]>;
    /** Set lines of buffer given indeces */
    setLines(_lines: string | string[], { start: _start, end: _end, strictIndexing }?: BufferSetLines): Promise<any>;
    /** Insert lines at `start` index */
    insert(lines: string[] | string, start: number): Promise<any>;
    /** Replace lines starting at `start` index */
    replace(_lines: string[] | string, start: number): Promise<any>;
    /** Remove lines at index */
    remove(start: number, end: number, strictIndexing: boolean): Promise<any>;
    /** Append a string or list of lines to end of buffer */
    append(lines: string[] | string): Promise<any>;
    /** Get buffer name */
    get name(): string | Promise<string>;
    /** Set current buffer name */
    set name(value: string | Promise<string>);
    /** Is current buffer valid */
    get valid(): Promise<boolean>;
    /** Get mark position given mark name */
    mark(name: string): Promise<[number, number]>;
    /**
     * Gets a list of buffer-local |mapping| definitions.
     */
    getKeymap(mode: string): Promise<object[]>;
    /**
     * Checks if a buffer is valid and loaded. See |api-buffer| for
     * more info about unloaded buffers.
     */
    get loaded(): Promise<boolean>;
    /**
     * Returns the byte offset for a line.
     *
     * Line 1 (index=0) has offset 0. UTF-8 bytes are counted. EOL is
     * one byte. 'fileformat' and 'fileencoding' are ignored. The
     * line index just after the last line gives the total byte-count
     * of the buffer. A final EOL byte is counted if it would be
     * written, see 'eol'.
     *
     * Unlike |line2byte()|, throws error for out-of-bounds indexing.
     * Returns -1 for unloaded buffer.
     *
     * @return {Number} Integer byte offset, or -1 for unloaded buffer.
     */
    getOffset(index: number): Promise<number>;
    /**
     * Adds a highlight to buffer.
     *
     * Useful for plugins that dynamically generate highlights to a
     * buffer (like a semantic highlighter or linter). The function
     * adds a single highlight to a buffer. Unlike |matchaddpos()|
     * highlights follow changes to line numbering (as lines are
     * inserted/removed above the highlighted line), like signs and
     * marks do.
     *
     * Namespaces are used for batch deletion/updating of a set of
     * highlights. To create a namespace, use |nvim_create_namespace|
     * which returns a namespace id. Pass it in to this function as
     * `ns_id` to add highlights to the namespace. All highlights in
     * the same namespace can then be cleared with single call to
     * |nvim_buf_clear_namespace|. If the highlight never will be
     * deleted by an API call, pass `ns_id = -1`.
     *
     * As a shorthand, `ns_id = 0` can be used to create a new
     * namespace for the highlight, the allocated id is then
     * returned. If `hl_group` is the empty string no highlight is
     * added, but a new `ns_id` is still returned. This is supported
     * for backwards compatibility, new code should use
     * |nvim_create_namespace| to create a new empty namespace.
     */
    addHighlight({ hlGroup: _hlGroup, line, colStart: _start, colEnd: _end, srcId: _srcId, }: BufferHighlight): Promise<number>;
    /**
     * Deprecated
     */
    clearHighlight(args?: BufferClearHighlight): Promise<any>;
    /**
     * Clears namespaced objects, highlights and virtual text, from a line range
     *
     * To clear the namespace in the entire buffer, pass in 0 and -1 to line_start and line_end respectively.
     *
     * @param {Number} nsId Namespace to clear, or -1 to clear all namespaces
     * @param {Number} lineStart Start of range of lines to clear
     * @param {Number} lineEnd End of range of lines to clear (exclusive) or -1 to clear to end of buffer
     */
    clearNamespace(args: BufferClearNamespace): void;
    /**
     * Set the virtual text (annotation) for a buffer line.
     *
     * By default (and currently the only option) the text will be
     * placed after the buffer text. Virtual text will never cause
     * reflow, rather virtual text will be truncated at the end of
     * the screen line. The virtual text will begin one cell
     * (|lcs-eol| or space) after the ordinary text.
     *
     * Namespaces are used to support batch deletion/updating of
     * virtual text. To create a namespace, use
     * |nvim_create_namespace|. Virtual text is cleared using
     * |nvim_buf_clear_namespace|. The same `ns_id` can be used for
     * both virtual text and highlights added by
     * |nvim_buf_add_highlight|, both can then be cleared with a
     * single call to |nvim_buf_clear_namespace|. If the virtual text
     * never will be cleared by an API call, pass `ns_id = -1`.
     *
     * As a shorthand, `ns_id = 0` can be used to create a new
     * namespace for the virtual text, the allocated id is then
     * returned.
     *
     * @param
     * @param {Number} nsId Namespace to use or 0 to create a namespace, or -1 for a ungrouped annotation
     * @param {Number} line Line to annotate with virtual text (zero-indexed)
     * @param {VirtualTextChunk[]} chunks  A list of [text, hl_group] arrays, each
                                representing a text chunk with specified
                                highlight. `hl_group` element can be omitted for
                                no highlight.
     * @param {Object} opts Optional parameters. Currently not used.
     */
    setVirtualText(nsId: number, line: number, chunks: VirtualTextChunk[], opts?: {}): Promise<number>;
    /**
     * Listens to buffer for events
     */
    listen(eventName: string, cb: Function): Function;
    unlisten(eventName: string, cb: Function): void;
}
export interface AsyncBuffer extends Buffer, Promise<Buffer> {
}
