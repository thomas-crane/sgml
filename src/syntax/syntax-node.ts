import { SyntaxKind } from './syntax-kind';
import { TextSpan } from './text-span';

export abstract class SyntaxNode {
  /**
   * Children of this node.
   */
  abstract readonly children: SyntaxNode[];
  /**
   * The parent of this node.
   */
  abstract parent: SyntaxNode | undefined;
  constructor(
    /**
     * The type of this syntax node.
     */
    readonly kind: SyntaxKind,
    /**
     * The span of this syntax node.
     */
    readonly span: TextSpan,
  ) { }
}
