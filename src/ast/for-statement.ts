import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
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
    readonly initialiser: StatementSyntax,
    readonly condition: StatementSyntax,
    readonly step: StatementSyntax,
    readonly rightParen: SyntaxToken | undefined,
    readonly statement: StatementSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
