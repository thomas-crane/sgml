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
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly returnToken: SyntaxToken,
    readonly expression: ExpressionSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
