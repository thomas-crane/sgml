import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';

export class BinaryExpression extends ExpressionSyntax {
  kind = SyntaxKind.BinaryExpression;
  children = [
    this.left,
    this.opToken,
    this.right,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly left: ExpressionSyntax,
    readonly opToken: SyntaxToken,
    readonly right: ExpressionSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
