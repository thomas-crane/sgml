import { BinaryExpression } from '../ast/binary-expression';
import { LocalDeclarationListStatement } from '../ast/local-declaration-list-statement';
import { Pass } from '../pass/pass';
import { CompilationUnit } from '../program/compilation-unit';
import { SyntaxKind } from '../syntax/syntax-kind';

export class CheckDeclarationList implements Pass {

  constructor(
    readonly unit: CompilationUnit,
  ) { }

  async run(): Promise<void> {
    const root = await this.unit.syntaxRoot();
    root.forEachChild((child) => {
      if (child.kind === SyntaxKind.LocalDeclarationListStatement) {
        const declList = child as LocalDeclarationListStatement;
        for (const decl of declList.declarations) {
          if (decl.kind < SyntaxKind.LastToken) {
            continue;
          }
          switch (decl.kind) {
            case SyntaxKind.IdentifierExpression:
              continue;
            case SyntaxKind.BinaryExpression:
              const binOp = decl as BinaryExpression;
              if (binOp.opToken.kind !== SyntaxKind.Equals) {
                this.unit.diagnostics.reportLocalDeclarationListWrongExpression(decl);
              }
              break;
            default:
              this.unit.diagnostics.reportLocalDeclarationListWrongExpression(decl);
          }
        }
      }
    });
  }
}
