import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { StatementSyntax } from './statement-syntax';

export class ExitStatement extends StatementSyntax {
  kind = SyntaxKind.ExitStatement;
  children = [this.exit, this.semicolon];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly exit: SyntaxToken,
    readonly semicolon: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
