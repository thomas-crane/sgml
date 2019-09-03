import { TextSpan } from './text-span';
import { TokenKind } from './token-kind';

export class Token {
  constructor(
    /**
     * The type of this token.
     */
    readonly kind: TokenKind,
    /**
     * The span of this token.
     */
    readonly span: TextSpan,
    /**
     * The value of this token.
     */
    readonly value: string,
  ) { }
}
