import { SyntaxKind } from './syntax-kind';
import { TextSpan } from './text-span';

export abstract class SyntaxNode {
  /**
   * Children of this node.
   */
  abstract readonly children: SyntaxNode[];
  /**
   * The type of this syntax node.
   */
  abstract readonly kind: SyntaxKind;
  /**
   * The span of this syntax node.
   */
  abstract readonly span: TextSpan;
  /**
   * The parent of this node.
   */
  parent: SyntaxNode | undefined;
}
