import { BaseApi } from './Base';
import { AsyncTabpage } from './Tabpage';
import { AsyncBuffer } from './Buffer';
export declare class Window extends BaseApi {
    prefix: string;
    /**
     * The windowid that not change within a Vim session
     */
    get id(): number;
    /** Get current buffer of window */
    get buffer(): AsyncBuffer;
    /** Get the Tabpage that contains the window */
    get tabpage(): AsyncTabpage;
    /** Get cursor position */
    get cursor(): [number, number] | Promise<[number, number]>;
    /** Set cursor position */
    set cursor(pos: [number, number] | Promise<[number, number]>);
    /** Get window height by number of rows */
    get height(): number | Promise<number>;
    /** Set window height by number of rows */
    set height(height: number | Promise<number>);
    /** Get window width by number of columns */
    get width(): number | Promise<number>;
    /** Set window width by number of columns  */
    set width(width: number | Promise<number>);
    /** Get window position */
    get position(): Promise<[number, number]>;
    /** 0-indexed, on-screen window position(row) in display cells. */
    get row(): Promise<number>;
    /** 0-indexed, on-screen window position(col) in display cells. */
    get col(): Promise<number>;
    /** Is window valid */
    get valid(): Promise<boolean>;
    /** Get window number */
    get number(): Promise<number>;
    /**
     * Closes window
     *
     * @param {Boolean} force Force close window
     */
    close(force?: boolean): Promise<any>;
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
     * @Param {Object}  options Options object
     */
    config(options?: object): Promise<any>;
}
export interface AsyncWindow extends Window, Promise<Window> {
}
