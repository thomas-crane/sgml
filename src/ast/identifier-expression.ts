import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { ExpressionSyntax } from './expression-syntax';

export class IdentifierExpression extends ExpressionSyntax {
  kind = SyntaxKind.IdentifierExpression;
  children = [this.identifier];
  span = this.identifier.span;
  constructor(
    readonly identifier: SyntaxToken,
  ) {
    super();
    this.identifier.parent = this;
  }
}
