import { SyntaxKind } from './syntax-kind';
import { SyntaxNode } from './syntax-node';
import { TextSpan } from './text-span';

export class SyntaxTrivia extends SyntaxNode {
  readonly children = [];
  parent = undefined;

  constructor(
    kind: SyntaxKind,
    span: TextSpan,
    /**
     * The value of this trivia.
     */
    readonly value: string,
  ) {
    super(kind, span);
  }
}
