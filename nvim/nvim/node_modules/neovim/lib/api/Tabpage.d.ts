import { BaseApi } from './Base';
import { Window, AsyncWindow } from './Window';
export declare class Tabpage extends BaseApi {
    prefix: string;
    /** Returns all windows of tabpage */
    get windows(): Promise<Window[]>;
    /** Gets the current window of tabpage */
    get window(): AsyncWindow;
    /** Is current tabpage valid */
    get valid(): Promise<boolean>;
    /** Tabpage number */
    get number(): Promise<number>;
    /** Invalid */
    getOption(): void;
    /** Invalid */
    setOption(): void;
}
export interface AsyncTabpage extends Tabpage, Promise<Tabpage> {
}
