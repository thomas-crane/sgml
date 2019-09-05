import { SyntaxKind } from '../syntax/syntax-kind';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class ExpressionStatement extends StatementSyntax {
  kind = SyntaxKind.ExpressionStatement;
  children = [this.expression];
  span = this.expression.span;
  constructor(
    readonly expression: ExpressionSyntax,
  ) {
    super();
    this.expression.parent = this;
  }
}
