import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class SwitchStatement extends StatementSyntax {
  kind = SyntaxKind.SwitchStatement;
  children = [
    this.switchToken,
    this.expression,
    this.leftCurlyBracket,
    ...this.statements,
    this.rightCurlyBracket,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly switchToken: SyntaxToken,
    readonly expression: ExpressionSyntax,
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
