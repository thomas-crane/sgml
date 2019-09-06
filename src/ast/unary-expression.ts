import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';

export class UnaryExpression extends ExpressionSyntax {
  kind = SyntaxKind.UnaryExpression;
  children = [this.opToken, this.operand];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly opToken: SyntaxToken,
    readonly operand: ExpressionSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
