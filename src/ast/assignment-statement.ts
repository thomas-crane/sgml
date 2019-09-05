import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { IdentifierExpression } from './identifier-expression';
import { StatementSyntax } from './statement-syntax';

export class AssignmentStatement extends StatementSyntax {
  kind = SyntaxKind.AssignmentStatement;
  children = [this.identifier, this.equals, this.expression, this.semicolon];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly identifier: IdentifierExpression,
    readonly equals: SyntaxToken,
    readonly expression: ExpressionSyntax,
    readonly semicolon: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
