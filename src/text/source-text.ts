import { Diagnostic } from '../diagnostics/diagnostic';
import { Source } from './source';

export class SourceText implements Source {
  readonly diagnostics: Diagnostic[];
  constructor(
    readonly name: string,
    private readonly source: string,
  ) {
    this.diagnostics = [];
  }

  contents(): Promise<string> {
    return Promise.resolve(this.source);
  }
}
