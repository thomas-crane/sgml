import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionStatement } from './expression-statement';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class ForStatement extends StatementSyntax {
  kind = SyntaxKind.ForStatement;
  children = [
    this.forToken,
    this.leftParen!,
    this.initialiser,
    this.condition,
    this.step,
    this.rightParen!,
    this.statement,
  ].filter((child) => child !== undefined);
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly forToken: SyntaxToken,
    readonly leftParen: SyntaxToken | undefined,
    readonly initialiser: ExpressionStatement,
    readonly condition: ExpressionStatement,
    readonly step: ExpressionSyntax,
    readonly rightParen: SyntaxToken | undefined,
    readonly statement: StatementSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
