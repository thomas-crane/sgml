import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';

export class PostfixExpression extends ExpressionSyntax {
  kind = SyntaxKind.PostfixExpression;
  children = [this.operand, this.opToken];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly operand: ExpressionSyntax,
    readonly opToken: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
