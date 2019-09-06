import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { IdentifierExpression } from './identifier-expression';
import { StatementSyntax } from './statement-syntax';

export class LocalDeclarationStatement extends StatementSyntax {
  kind = SyntaxKind.LocalDeclarationStatement;
  children = [
    this.varToken,
    this.identifier,
    this.equals!,
    this.initialiser!,
    this.semicolon,
  ].filter((child) => child !== undefined);
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly varToken: SyntaxToken,
    readonly identifier: IdentifierExpression,
    readonly equals: SyntaxToken | undefined,
    readonly initialiser: ExpressionSyntax | undefined,
    readonly semicolon: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
