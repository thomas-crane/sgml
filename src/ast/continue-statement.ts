import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { StatementSyntax } from './statement-syntax';

export class ContinueStatement extends StatementSyntax {
  kind = SyntaxKind.ContinueStatement;
  children = [
    this.continueToken,
    this.semicolon!,
  ].filter((child) => child !== undefined);
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly continueToken: SyntaxToken,
    readonly semicolon: SyntaxToken | undefined,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
