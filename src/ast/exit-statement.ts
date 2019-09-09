import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { StatementSyntax } from './statement-syntax';

export class ExitStatement extends StatementSyntax {
  kind = SyntaxKind.ExitStatement;
  children = [
    this.exit,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly exit: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
