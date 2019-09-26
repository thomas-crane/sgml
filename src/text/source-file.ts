import { basename } from 'path';
import { Diagnostic } from '../diagnostics/diagnostic';
import { readFile } from '../util/fs';
import { Source } from './source';

export class SourceFile implements Source {

  readonly diagnostics: Diagnostic[];
  readonly name: string;
  readonly filePath: string;
  private fileContents: string | undefined;
  constructor(filePath: string) {
    this.filePath = filePath;
    this.name = basename(filePath);
    this.diagnostics = [];
  }

  async contents(): Promise<string> {
    if (!this.fileContents) {
      this.fileContents = await readFile(this.filePath);
    }
    return this.fileContents;
  }
}
