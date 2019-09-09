import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxNode } from '../syntax/syntax-node';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { StatementSyntax } from './statement-syntax';

export class LocalDeclarationListStatement extends StatementSyntax {
  kind = SyntaxKind.LocalDeclarationListStatement;
  children = [
    this.varToken,
    ...this.declarations,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly varToken: SyntaxToken,
    readonly declarations: SyntaxNode[],
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
