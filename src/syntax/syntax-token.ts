import { SyntaxKind } from './syntax-kind';
import { SyntaxNode } from './syntax-node';
import { SyntaxTrivia } from './syntax-trivia';
import { TextSpan } from './text-span';

export class SyntaxToken extends SyntaxNode {
  readonly children = [];
  parent = undefined;

  constructor(
    kind: SyntaxKind,
    span: TextSpan,
    /**
     * The value of this token.
     */
    readonly value: string,
    /**
     * Syntax trivia which appears before this token in the source.
     */
    readonly leadingTrivia: SyntaxTrivia[] = [],
    /**
     * Syntax trivia which appears after this token and on the
     * same line as this token in the source.
     */
    readonly trailingTrivia: SyntaxTrivia[] = [],
  ) {
    super(kind, span);
  }
}
