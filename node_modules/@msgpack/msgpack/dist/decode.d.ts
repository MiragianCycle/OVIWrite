import type { ExtensionCodecType } from "./ExtensionCodec";
import type { ContextOf, SplitUndefined } from "./context";
export declare type DecodeOptions<ContextType = undefined> = Readonly<Partial<{
    extensionCodec: ExtensionCodecType<ContextType>;
    /**
     * Maximum string length.
     *
     * Defaults to 4_294_967_295 (UINT32_MAX).
     */
    maxStrLength: number;
    /**
     * Maximum binary length.
     *
     * Defaults to 4_294_967_295 (UINT32_MAX).
     */
    maxBinLength: number;
    /**
     * Maximum array length.
     *
     * Defaults to 4_294_967_295 (UINT32_MAX).
     */
    maxArrayLength: number;
    /**
     * Maximum map length.
     *
     * Defaults to 4_294_967_295 (UINT32_MAX).
     */
    maxMapLength: number;
    /**
     * Maximum extension length.
     *
     * Defaults to 4_294_967_295 (UINT32_MAX).
     */
    maxExtLength: number;
}>> & ContextOf<ContextType>;
export declare const defaultDecodeOptions: DecodeOptions;
/**
 * It decodes a single MessagePack object in a buffer.
 *
 * This is a synchronous decoding function.
 * See other variants for asynchronous decoding: {@link decodeAsync()}, {@link decodeStream()}, or {@link decodeArrayStream()}.
 *
 * @throws {@link RangeError} if the buffer is incomplete, including the case where the buffer is empty.
 * @throws {@link DecodeError} if the buffer contains invalid data.
 */
export declare function decode<ContextType = undefined>(buffer: ArrayLike<number> | BufferSource, options?: DecodeOptions<SplitUndefined<ContextType>>): unknown;
/**
 * It decodes multiple MessagePack objects in a buffer.
 * This is corresponding to {@link decodeMultiStream()}.
 *
 * @throws {@link RangeError} if the buffer is incomplete, including the case where the buffer is empty.
 * @throws {@link DecodeError} if the buffer contains invalid data.
 */
export declare function decodeMulti<ContextType = undefined>(buffer: ArrayLike<number> | BufferSource, options?: DecodeOptions<SplitUndefined<ContextType>>): Generator<unknown, void, unknown>;
