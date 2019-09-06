import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { StatementSyntax } from './statement-syntax';

export class DefaultStatement extends StatementSyntax {
  kind = SyntaxKind.DefaultStatement;
  children = [this.defaultToken, this.colon];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly defaultToken: SyntaxToken,
    readonly colon: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
