import { SyntaxKind } from './syntax-kind';
import { SyntaxNode } from './syntax-node';
import { TextSpan } from './text-span';

export class SyntaxTrivia extends SyntaxNode {
  readonly children = [];

  constructor(
    readonly kind: SyntaxKind,
    readonly span: TextSpan,
    /**
     * The value of this trivia.
     */
    readonly value: string,
  ) {
    super();
  }
}
