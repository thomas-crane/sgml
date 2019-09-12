import { Pass } from '../pass/pass';
import { CompilationUnit } from '../program/compilation-unit';
import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxNode } from '../syntax/syntax-node';

export class CheckContext implements Pass {

  constructor(
    readonly unit: CompilationUnit,
  ) { }

  async run(): Promise<void> {
    const root = await this.unit.syntaxRoot();
    root.forEachChild((child) => {
      switch (child.kind) {
        case SyntaxKind.BreakStatement:
          if (!this.isInLoop(child) && !child.isChildOf(SyntaxKind.SwitchStatement)) {
            this.unit.diagnostics.reportStatementOutOfContext(child);
          }
          break;
        case SyntaxKind.ContinueStatement:
          if (!this.isInLoop(child)) {
            this.unit.diagnostics.reportStatementOutOfContext(child);
          }
          break;
        case SyntaxKind.DefaultStatement:
        case SyntaxKind.CaseStatement:
          if (!child.isChildOf(SyntaxKind.SwitchStatement)) {
            this.unit.diagnostics.reportStatementOutOfContext(child);
          }
      }
    });
  }

  private isInLoop(node: SyntaxNode): boolean {
    const inForLoop = node.isChildOf(SyntaxKind.ForStatement);
    const inWhileLoop = node.isChildOf(SyntaxKind.WhileStatement);
    const inDoLoop = node.isChildOf(SyntaxKind.DoStatement);
    return inForLoop || inWhileLoop || inDoLoop;
  }
}
