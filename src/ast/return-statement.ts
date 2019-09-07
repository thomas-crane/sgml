import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class ReturnStatement extends StatementSyntax {
  kind = SyntaxKind.ReturnStatement;
  children = [
    this.returnToken,
    this.expression,
    this.semicolon,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly returnToken: SyntaxToken,
    readonly expression: ExpressionSyntax,
    readonly semicolon: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
