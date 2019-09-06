import { StatementSyntax } from '../ast/statement-syntax';
import { SyntaxNode } from '../syntax/syntax-node';
import { SyntaxToken } from '../syntax/syntax-token';

export class SyntaxRoot {
  constructor(
    readonly statements: StatementSyntax[],
    readonly endOfFile: SyntaxToken,
  ) { }

  forEachChild(fn: (child: SyntaxNode) => void): void {
    this.statements.forEach((statement) => {
      visitNodeChildren(statement, fn);
    });
    fn(this.endOfFile);

    function visitNodeChildren(syntaxNode: SyntaxNode, fn: (child: SyntaxNode) => void): void {
      syntaxNode.children.forEach((child) => {
        fn(child);
        visitNodeChildren(child, fn);
      });
    }
  }
}
