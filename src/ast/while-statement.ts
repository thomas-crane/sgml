import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class WhileStatement extends StatementSyntax {
  kind = SyntaxKind.WhileStatement;
  children = [
    this.whileToken,
    this.leftParen,
    this.condition,
    this.rightParen,
    this.statement,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly whileToken: SyntaxToken,
    readonly leftParen: SyntaxToken,
    readonly condition: ExpressionSyntax,
    readonly rightParen: SyntaxToken,
    readonly statement: StatementSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
