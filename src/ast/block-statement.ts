import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { StatementSyntax } from './statement-syntax';

export class BlockStatement extends StatementSyntax {
  kind = SyntaxKind.BlockStatement;
  children = [this.leftCurlyBracket, ...this.statements, this.rightCurlyBracket];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly leftCurlyBracket: SyntaxToken,
    readonly statements: StatementSyntax[],
    readonly rightCurlyBracket: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
