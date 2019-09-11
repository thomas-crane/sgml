import { Source } from './source';

export class SourceText implements Source {
  constructor(
    readonly name: string,
    private readonly source: string,
  ) { }

  contents(): Promise<string> {
    return Promise.resolve(this.source);
  }
}
