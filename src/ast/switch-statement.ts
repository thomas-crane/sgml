import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class SwitchStatement extends StatementSyntax {
  kind = SyntaxKind.SwitchStatement;
  children = [
    this.switchToken,
    this.leftParen,
    this.expression,
    this.rightParen,
    this.leftCurlyBracket,
    ...this.statements,
    this.rightCurlyBracket,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly switchToken: SyntaxToken,
    readonly leftParen: SyntaxToken,
    readonly expression: ExpressionSyntax,
    readonly rightParen: SyntaxToken,
    readonly leftCurlyBracket: SyntaxToken,
    readonly statements: StatementSyntax[],
    readonly rightCurlyBracket: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
