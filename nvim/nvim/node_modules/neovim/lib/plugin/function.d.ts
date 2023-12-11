export interface NvimFunctionOptions {
    sync?: boolean;
    range?: [number, number];
    eval?: string;
}
export declare function nvimFunction(name: string, options?: NvimFunctionOptions): (cls: any, methodName: string | null) => any;
