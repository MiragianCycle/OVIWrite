import { Neovim } from '../api/Neovim';
import { NvimPlugin } from './NvimPlugin';
export interface LoadPluginOptions {
    cache?: boolean;
}
export declare function loadPlugin(filename: string, nvim: Neovim, options?: LoadPluginOptions): NvimPlugin | null;
