import { BaseApi } from './Base';
import { Buffer, AsyncBuffer } from './Buffer';
import { Tabpage, AsyncTabpage } from './Tabpage';
import { Window, AsyncWindow } from './Window';
import { VimValue } from '../types/VimValue';
import { ApiInfo } from '../types/ApiInfo';
export interface UiAttachOptions {
    rgb?: boolean;
    override?: boolean;
    ext_cmdline?: boolean;
    ext_hlstate?: boolean;
    ext_linegrid?: boolean;
    ext_messages?: boolean;
    ext_multigrid?: boolean;
    ext_popupmenu?: boolean;
    ext_tabline?: boolean;
    ext_wildmenu?: boolean;
    ext_termcolors?: boolean;
}
export declare type Ui = UiAttachOptions & {
    height: number;
    width: number;
    chan?: number;
};
export interface Proc {
    ppid: number;
    name: string;
    pid: number;
}
export interface Channel {
    id: number;
    stream: string;
    stdio?: object;
    stderr?: object;
    socket?: object;
    job?: any;
    mode?: string;
}
export interface Command {
    bang: boolean;
    nargs: string;
    range: string;
    name: string;
    script_id: number;
    bar: boolean;
    register: boolean;
    definition: string;
    complete?: null;
    addr?: any;
    count?: any;
    complete_arg?: any;
}
export interface OpenWindowOptions {
    relative?: 'editor' | 'win' | 'cursor';
    anchor?: 'NW' | 'NE' | 'SW' | 'SE';
    focusable?: boolean;
    row?: number;
    col?: number;
    win?: number;
    external?: boolean;
    width: number;
    height: number;
    bufpos?: [number, number];
    zindex?: number;
    style?: 'minimal';
    border?: 'none' | 'single' | 'double' | 'rounded' | 'solid' | 'shadow' | string[];
    noautocmd?: boolean;
}
/**
 * Neovim API
 */
export declare class Neovim extends BaseApi {
    protected prefix: string;
    Buffer: typeof Buffer;
    Window: typeof Window;
    Tabpage: typeof Tabpage;
    /**
     * Retrieves nvim API information
     */
    get apiInfo(): Promise<[number, ApiInfo]>;
    /**
     * Gets the current list of buffer handles
     *
     * Includes unlisted (unloaded/deleted) buffers, like `ls!`. Use `buffer.loaded`
     * to check if a buffer is loaded
     *
     * @return {Buffer[]} List of buffer handles
     */
    get buffers(): Promise<Buffer[]>;
    /**
     * Gets the current buffer
     *
     * @return {Buffer} Buffer handle
     */
    get buffer(): AsyncBuffer;
    /**
     * Sets the current buffer
     */
    set buffer(buffer: AsyncBuffer);
    /**
     * Get information about all open channels
     *
     * @return {Channel[]} Array of channels
     */
    get chans(): Promise<Channel[]>;
    /**
     * Gets information about a channel
     *
     * @param {Number} chan The channel number
     * @return {Channel} A channel
     */
    getChanInfo(chan: number): Promise<Channel>;
    /**
     * Gets a map of buffer-local |user-commands|.
     */
    get commands(): Promise<Command>;
    /**
     * Gets a map of buffer-local |user-commands|.
     *
     * @param {Object} options Optional parameters (currently not used)
     * @return {Object} Map of maps describing commands
     */
    getCommands(options?: {}): Promise<Command>;
    /**
     * Gets the current list of tabpage handles
     *
     * @return {Tabpage[]} List of tagpage handles
     */
    get tabpages(): Promise<Tabpage[]>;
    /**
     * Gets the window tabpage
     *
     * @return {Tabpage} Tagpage that contains the window
     */
    get tabpage(): AsyncTabpage;
    /**
     * Sets the current tabpage
     */
    set tabpage(tabpage: AsyncTabpage);
    /**
     * Gets the current list of window handles
     *
     * @return {Window[]} List of window handles
     */
    get windows(): Promise<Window[]>;
    /**
     * Gets the current window
     *
     * @return {Window} Window handle
     */
    get window(): AsyncWindow;
    /**
     * Sets the current window
     *
     * @param {Window} Window handle
     */
    set window(win: AsyncWindow);
    /**
     * Gets the current list of window handles
     *
     * @return {Window[]} List of window handles
     */
    getWindows(): Promise<Window[]>;
    /**
     * Gets the current window
     *
     * @return {Window} Window handle
     */
    getWindow(): AsyncWindow;
    /**
     * Sets the current window
     *
     * @param {Window} Window handle
     */
    setWindow(win: Window): Promise<any>;
    /**
     * Gets the paths contained in "runtimepath"
     *
     * @return {String[]} List of paths
     */
    get runtimePaths(): Promise<string[]>;
    /**
     * Changes the global working directory
     *
     * @param {String} Directory path
     *
     */
    set dir(dir: string);
    /**
     * Gets the current line
     *
     * @return {String} Current line string
     */
    get line(): string | Promise<string>;
    /**
     * Sets current line
     *
     * @param {String} line Line contents
     */
    set line(line: string | Promise<string>);
    /**
     * Gets the current line
     *
     * @return {String} Current line string
     */
    getLine(): Promise<string>;
    /**
     * Sets current line
     *
     * @param {String} line Line contents
     */
    setLine(line: string): Promise<any>;
    /**
     * Gets a list of global (non-buffer-local) |mapping| definitions.
     *
     * @param {String} mode Mode short-name ("n", "i", "v", ...)
     * @return {Object[]}  Array of maparg()-like dictionaries describing mappings. The "buffer" key is always zero.
     */
    getKeymap(mode: string): Promise<object[]>;
    /**
     * Gets the current mode. |mode()| "blocking" is true if Nvim is waiting for input.
     *
     * @return {Object} Dictionary { "mode": String, "blocking": Boolean }
     */
    get mode(): Promise<{
        mode: string;
        blocking: boolean;
    }>;
    /**
     * Gets map of defined colors
     *
     * @return {Object} Color map
     */
    get colorMap(): Promise<{
        [name: string]: number;
    }>;
    /**
     * Get color by name
     *
     * @param {String} name Color name
     * @return {Number} Color value
     */
    getColorByName(name: string): Promise<number>;
    /**
     * Get highlight by name or id
     *
     * @param {String|Number} nameOrId Name or ID
     * @param {Boolean} isRgb Should export RGB colors
     * @return {Object} Highlight definition map
     */
    getHighlight(nameOrId: string | number, isRgb?: boolean): Promise<object> | void;
    /**
     * Get highlight definition by name
     *
     * @param {String} name Highlight group name
     * @param {Boolean} isRgb Should export RGB colors
     * @return {Object} Highlight definition map
     */
    getHighlightByName(name: string, isRgb?: boolean): Promise<object>;
    /**
     * Get highlight definition by id |hlID()|
     *
     * @param {Number} id Highlight id as returned by |hlID()|
     * @param {Boolean} isRgb Should export RGB colors
     * @return {Object} Highlight definition map
     */
    getHighlightById(id: number, isRgb?: boolean): Promise<object>;
    /**
     * Deletes the current line
     */
    deleteCurrentLine(): Promise<any>;
    /**
     * Evaluates a VimL expression (:help expression). Dictionaries
     * and Lists are recursively expanded. On VimL error: Returns a
     * generic error; v:errmsg is not updated.
     *
     */
    eval(expr: string): Promise<VimValue>;
    /**
     * Executes lua, it's possible neovim client does not support this
     */
    lua(code: string, args?: VimValue[]): Promise<object>;
    /**
     * Alias for `lua()` to be consistent with neovim API
     */
    executeLua(code: string, args?: VimValue[]): Promise<object>;
    /**
     * Calls a VimL |Dictionary-function| with the given arguments.
     *
     * On execution error: fails with VimL error, does not update v:errmsg.
     */
    callDictFunction(dict: object, fname: string, args?: VimValue | VimValue[]): object;
    /**
     * Calls a VimL function with the given arguments.
     *
     * On execution error: fails with VimL error, does not update v:errmsg.
     */
    call(fname: string, args?: VimValue | VimValue[]): Promise<any>;
    /**
     * Alias for `call`
     */
    callFunction(fname: string, args?: VimValue | VimValue[]): Promise<any>;
    /**
     * Calls many API methods atomically.
     *
     * This has two main usages:
     *  - To perform several requests from an async context atomically, i.e. without
     * interleaving redraws, RPC requests from other clients, or user interactions
     * (however API methods may trigger autocommands or event processing which have
     * such side-effects, e.g. |:sleep| may wake timers)
     *
     *  - To minimize RPC overhead (roundtrips) of a sequence of many requests.
     */
    callAtomic(calls: VimValue[]): Promise<[any[], boolean]>;
    /**
     * Executes an ex-command.
     *
     * On execution error: fails with VimL error, does not update v:errmsg.
     *
     * @param {String} arg Ex-command string
     */
    command(arg: string): Promise<any>;
    /**
     * Executes an ex-command and returns its (non-error) output.
     * Shell |:!| output is not captured.
     *
     * On execution error: fails with VimL error, does not update v:errmsg.
     */
    commandOutput(arg: string): Promise<string>;
    /**
     * Gets a v: variable
     *
     * @param {String} name Variable name
     * @return {VimValue} Variable value
     */
    getVvar(name: string): Promise<VimValue>;
    /**
     * Sets a v: variable, if it is not readonly.
     *
     * @param {String} name Variable name
     * @param {VimValue} value Variable value
     */
    setVvar(name: string, value: VimValue): Promise<any>;
    /**
     * Sends input-keys to Nvim, subject to various quirks controlled
     * by `mode` flags. This is a blocking call, unlike |nvim_input()|.
     *
     * On execution error: does not fail, but updates v:errmsg.
     *
     * @param {String} keys To be typed
     * @param {String} mode Behavior flags, see |feedkeys()|
     * @param {Boolean} escapeCsi If true, escape K_SPECIAL/CSI bytes in `keys`
     */
    feedKeys(keys: string, mode: string, escapeCsi: boolean): Promise<any>;
    /**
     * Queues raw user-input. Unlike |nvim_feedkeys()|, this uses a
     * low-level input buffer and the call is non-blocking (input is
     * processed asynchronously by the eventloop).
     *
     * On execution error: does not fail, but updates v:errmsg.
     *
     * Note:
     * |keycodes| like <CR> are translated, so "<" is special. To
     * input a literal "<", send <LT>.
     *
     * Note:
     * For mouse events use |nvim_input_mouse()|. The pseudokey
     * form "<LeftMouse><col,row>" is deprecated since
     * |api-level| 6.
     *
     * @param {String} keys To be typed
     */
    input(keys: string): Promise<number>;
    /**
     * Send mouse event from GUI.
     *
     * The call is non-blocking. It doesn't wait on any resulting
     * action, but queues the event to be processed soon by the event
     * loop.
     *
     * Note:
     * Currently this doesn't support "scripting" multiple mouse
     * events by calling it multiple times in a loop: the
     * intermediate mouse positions will be ignored. It should be
     * used to implement real-time mouse input in a GUI. The
     * deprecated pseudokey form ("<LeftMouse><col,row>") of
     * |nvim_input()| has the same limitiation.
     *
     * @param {String} button    Mouse button: one of "left", "right", "middle", "wheel".
     * @param {String} action    For ordinary buttons, one of "press", "drag", "release".
     *                           For the wheel, one of "up", "down", "left", "right".
     * @param {String} modifier  String of modifiers each represented by a
     *                           single char. The same specifiers are used as
     *                           for a key press, except that the "-" separator
     *                           is optional, so "C-A-", "c-a" and "CA" can all
     *                           be used to specify Ctrl+Alt+click.
     * @param {Number} grid      Grid number if the client uses |ui-multigrid|, else 0.
     * @param {Number} row       Mouse row-position (zero-based, like redraw events)
     * @param {Number} col       Mouse column-position (zero-based, like redraw events)
     */
    inputMouse(button: string, action: string, modifier: string, grid: number, row: number, col: number): Promise<any>;
    /**
     * Parse a VimL Expression
     *
     * TODO: return type, see :help
     */
    parseExpression(expr: string, flags: string, highlight: boolean): Promise<object>;
    /**
     * Gets info describing process `pid`.
     *
     * @param {Number} pid pid
     * @return {Proc} Map of process properties, or null if process not found
     */
    getProc(pid: number): Promise<Proc>;
    /**
     * Gets the immediate children of process `pid`
     *
     * @return {Proc[]} Array of child process ids, empty if process not found
     */
    getProcChildren(pid: number): Promise<Proc[]>;
    /**
     * Replaces terminal codes and |keycodes| (<CR>, <Esc>, ...) in a
     * string with the internal representation.
     *
     * @param {String} str String to be converted.
     * @param {Boolean} fromPart Legacy Vim parameter. Usually true.
     * @param {Boolean} doIt Also translate <lt>. Ignored if `special` is false.
     * @param {Boolean} special Replace |keycodes|, e.g. <CR> becomes a "\n" char.
     */
    replaceTermcodes(str: string, fromPart: boolean, doIt: boolean, special: boolean): Promise<string>;
    /**
     * Calculates the number of display cells occupied by `text`.
     * <Tab> counts as one cell.
     *
     * @param {String} str Some text
     * @return {Number} Number of cells
     */
    strWidth(str: string): Promise<number>;
    /** Write to output buffer */
    outWrite(str: string): Promise<any>;
    outWriteLine(str: string): Promise<any>;
    /** Write to error buffer */
    errWrite(str: string): Promise<any>;
    /** Write to error buffer */
    errWriteLine(str: string): Promise<any>;
    /**
     * Gets a list of dictionaries representing attached UIs.
     *
     * @return {Ui[]} Array of UI dictionaries
     * Each dictionary has the following keys:
     * "height" requested height of the UI
     * "width" requested width of the UI
     * "rgb" whether the UI uses rgb colors (false implies cterm colors)
     * "ext_..." Requested UI extensions, see |ui-options|
     * "chan" Channel id of remote UI (not present for TUI)
     */
    get uis(): Promise<Ui[]>;
    uiAttach(width: number, height: number, options: UiAttachOptions): Promise<void>;
    uiDetach(): Promise<void>;
    /**
     * TODO: Documentation
     *
     * @param {Number} width The new requested width
     * @param {Number} height The new requested height
     */
    uiTryResize(width: number, height: number): Promise<void>;
    /**
     * Tell Nvim to resize a grid. Triggers a grid_resize event with
     * the requested grid size or the maximum size if it exceeds size
     * limits.
     *
     * On invalid grid handle, fails with error.
     *
     * @param {Number} grid The handle of the grid to be changed
     * @param {Number} width The new requested width
     * @param {Number} height The new requested height
     */
    uiTryResizeGrid(grid: number, width: number, height: number): Promise<void>;
    /**
     * Set UI Option
     */
    uiSetOption(name: string, value: any): Promise<void>;
    /**
     * Subscribe to nvim event broadcasts
     *
     * @param {String} event Event type string
     */
    subscribe(event: string): Promise<void>;
    /**
     * Unsubscribe to nvim event broadcasts
     *
     * @param {String} event Event type string
     */
    unsubscribe(event: string): Promise<void>;
    /**
     * Identify the client for nvim. Can be called more than once,
     * but subsequent calls will remove earlier info, which should be
     * resent if it is still valid. (This could happen if a library
     * first identifies the channel, and a plugin using that library
     * later overrides that info)
     *
     */
    setClientInfo(name: string, version: object, type: string, methods: object, attributes: object): void;
    /**
     * Creates a new namespace, or gets an existing one.
     *
     * Namespaces are used for buffer highlights and virtual text,
     * see |nvim_buf_add_highlight()| and |nvim_buf_set_virtual_text()|.
     *
     * Namespaces can be named or anonymous. If `name` matches an
     * existing namespace, the associated id is returned. If `name`
     * is an empty string a new, anonymous namespace is created.
     *
     * @param {String} name Namespace name or empty string
     * @return {Number} Namespace id
     */
    createNamespace(name?: string): Promise<number>;
    /**
     * Alias for `getNamespaces()`
     */
    get namespaces(): Promise<{
        [name: string]: number;
    }>;
    /**
     * Gets existing, non-anonymous namespaces.
     *
     * @return {Object} dict that maps from names to namespace ids.
     */
    getNamespaces(): Promise<{
        [name: string]: number;
    }>;
    /**
     * Selects an item in the completion popupmenu.
     *
     * If |ins-completion| is not active this API call is silently
     * ignored. Useful for an external UI using |ui-popupmenu| to
     * control the popupmenu with the mouse. Can also be used in a
     * mapping; use <cmd> |:map-cmd| to ensure the mapping doesn't
     * end completion mode.
     *
     * @param {Number}  item     Index (zero-based) of the item to select.
     *                           Value of -1 selects nothing and restores the original text.
     * @param {Boolean} insert   Whether the selection should be inserted in the buffer.
     * @param {Boolean} finish   Finish the completion and dismiss the popupmenu.
     *                           Implies `insert`.
     * @param {Object}  opts     Optional parameters. Reserved for future use.
     */
    selectPopupmenuItem(item: number, insert: boolean, finish: boolean, opts?: object): Promise<any>;
    /**
     * Creates a new, empty, unnamed buffer.
     *
     * @param {Boolean} listed  Controls 'buflisted'
     * @param {Boolean} scratch Creates a "throwaway" |scratch-buffer| for temporary work (always 'nomodified')
     * @return {Buffer|Number} Buffer handle, or 0 on error
     */
    private createBuf;
    /**
     * Public alias for `createBuf`
     */
    createBuffer(listed: boolean, scratch: boolean): Promise<Buffer | number>;
    /**
     * Open a new window.
     * Currently this is used to open floating and external windows.
     * Floats are windows that are drawn above the split layout, at
     * some anchor position in some other window. Floats can be draw
     * internally or by external GUI with the |ui-multigrid|
     * extension. External windows are only supported with multigrid
     * GUIs, and are displayed as separate top-level windows.
     *
     * Exactly one of `external` and `relative` must be specified.
     *
     * @param {Buffer}  buffer Handle of buffer to be displayed in the window
     * @param {Boolean} enter  Whether the window should be entered (made the current window)
     * @Param {Object}  options Options object
     * @return {Window|Number} The Window handle or 0 when error
     */
    private openWin;
    /**
     * Public alias for `openWin`
     */
    openWindow(buffer: Buffer, enter: boolean, options: OpenWindowOptions): Promise<Window | number>;
    /**
     * Configure window position. Currently this is only used to
     * configure floating and external windows (including changing a
     * split window to these types).
     *
     * See documentation at |nvim_open_win()|, for the meaning of
     * parameters. Pass in -1 for 'witdh' and 'height' to keep
     * exiting size.
     *
     * When reconfiguring a floating window, absent option keys will
     * not be changed. The following restriction apply: `row`, `col`
     * and `relative` must be reconfigured together. Only changing a
     * subset of these is an error.
     *
     * @param {Window}  window Window handle
     * @param {Number}  width  Width of window (in character cells)
     * @param {Number}  height Height of window (in character cells)
     * @Param {Object}  options Options object
     */
    private winConfig;
    /**
     * Public Alias for `winConfig`
     */
    windowConfig(window: Window, options?: object): Promise<any>;
    /**
     * Closes window
     *
     * @param {Boolean} force Force close window
     */
    private winClose;
    /**
     * Public alias for `winClose`
     */
    windowClose(window: Window, force: boolean): Promise<any>;
    /**
     * Quit nvim
     */
    quit(): void;
}
