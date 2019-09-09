import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class WithStatement extends StatementSyntax {
  kind = SyntaxKind.WithStatement;
  children = [
    this.withToken,
    this.expression,
    this.statement,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly withToken: SyntaxToken,
    readonly expression: ExpressionSyntax,
    readonly statement: StatementSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
