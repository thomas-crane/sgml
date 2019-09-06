import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class ExpressionStatement extends StatementSyntax {
  kind = SyntaxKind.ExpressionStatement;
  children = [this.expression, this.semicolon];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly expression: ExpressionSyntax,
    readonly semicolon: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
