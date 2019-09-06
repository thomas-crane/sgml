import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { ExpressionSyntax } from './expression-syntax';

export class IntLiteralExpression extends ExpressionSyntax {
  kind = SyntaxKind.IntLiteralExpression;
  children = [this.value];
  span = this.value.span;
  constructor(
    readonly value: SyntaxToken,
  ) {
    super();
    this.value.parent = this;
  }
}
