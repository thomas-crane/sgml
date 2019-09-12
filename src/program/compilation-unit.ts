import { DiagnosticBag } from '../diagnostics/diagnostic-bag';
import { Parser } from '../parser/parser';
import { SyntaxRoot } from '../parser/syntax-root';
import { Source } from '../text/source';

export class CompilationUnit {

  readonly source: Source;

  readonly diagnostics: DiagnosticBag;
  private root: SyntaxRoot | undefined;

  constructor(source: Source) {
    this.source = source;
    this.diagnostics = new DiagnosticBag(source);
  }

  async syntaxRoot(): Promise<Readonly<SyntaxRoot>> {
    if (!this.root) {
      const parser = new Parser(this.source);
      this.root = await parser.parseRoot();
    }
    return this.root;
  }
}
