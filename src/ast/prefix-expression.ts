import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { IdentifierExpression } from './identifier-expression';

export class PrefixExpression extends ExpressionSyntax {
  kind = SyntaxKind.PrefixExpression;
  children = [this.opToken, this.operand];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly opToken: SyntaxToken,
    readonly operand: IdentifierExpression,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
