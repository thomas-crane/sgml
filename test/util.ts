import { PassConstructor } from '../src/pass/pass';
import { PassRunner } from '../src/pass/pass-runner';
import { CompilationUnit } from '../src/program/compilation-unit';
import { Source } from '../src/text/source';
import { SourceText } from '../src/text/source-text';

export function createSource(src: string): Source {
  return new SourceText('test-script', src);
}

type ReportCounterFn = (src: string) => Promise<number>;
export function getReportCounter(...passes: PassConstructor[]): ReportCounterFn {
  return async (src: string) => {
    const unit = new CompilationUnit(createSource(src));
    // parse the AST now to avoid counting parse diagnostics later
    await unit.syntaxRoot();
    const before = unit.source.diagnostics.length;
    const runner = new PassRunner(passes);
    await runner.run([unit]);
    // console.log(unit.diagnostics.reports);
    return unit.source.diagnostics.length - before;
  };
}
