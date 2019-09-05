import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { IntLiteralExpression } from './int-literal-expression';
import { StatementSyntax } from './statement-syntax';

export class RepeatStatement extends StatementSyntax {
  kind = SyntaxKind.RepeatStatement;
  children = [
    this.repeat,
    this.leftParen,
    this.amount,
    this.rightParen,
    this.statement,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly repeat: SyntaxToken,
    readonly leftParen: SyntaxToken,
    readonly amount: IntLiteralExpression,
    readonly rightParen: SyntaxToken,
    readonly statement: StatementSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
