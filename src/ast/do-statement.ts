import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { BlockStatement } from './block-statement';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class DoStatement extends StatementSyntax {
  kind = SyntaxKind.DoStatement;
  children = [
    this.doToken,
    this.block,
    this.until,
    this.leftParen,
    this.condition,
    this.rightParen,
    this.semicolon,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly doToken: SyntaxToken,
    readonly block: BlockStatement,
    readonly until: SyntaxToken,
    readonly leftParen: SyntaxToken,
    readonly condition: ExpressionSyntax,
    readonly rightParen: SyntaxToken,
    readonly semicolon: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
