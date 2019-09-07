import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class DoStatement extends StatementSyntax {
  kind = SyntaxKind.DoStatement;
  children = [
    this.doToken,
    this.block,
    this.until,
    this.condition,
    this.semicolon!,
  ].filter((child) => child !== undefined);
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly doToken: SyntaxToken,
    readonly block: StatementSyntax,
    readonly until: SyntaxToken,
    readonly condition: ExpressionSyntax,
    readonly semicolon: SyntaxToken | undefined,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
