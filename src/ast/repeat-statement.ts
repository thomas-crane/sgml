import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class RepeatStatement extends StatementSyntax {
  kind = SyntaxKind.RepeatStatement;
  children = [
    this.repeat,
    this.amount,
    this.statement,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly repeat: SyntaxToken,
    readonly amount: ExpressionSyntax,
    readonly statement: StatementSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
