import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { StatementSyntax } from './statement-syntax';

export class BreakStatement extends StatementSyntax {
  kind = SyntaxKind.BreakStatement;
  children = [
    this.breakToken,
    this.semicolon!,
  ].filter((child) => child !== undefined);
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly breakToken: SyntaxToken,
    readonly semicolon: SyntaxToken | undefined,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
