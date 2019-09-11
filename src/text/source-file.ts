import { basename } from 'path';
import { readFile } from '../util/fs';
import { Source } from './source';

export class SourceFile implements Source {
  readonly name: string;
  readonly filePath: string;
  private fileContents: string | undefined;
  constructor(filePath: string) {
    this.filePath = filePath;
    this.name = basename(filePath);
  }

  async contents(): Promise<string> {
    if (!this.fileContents) {
      this.fileContents = await readFile(this.filePath);
    }
    return this.fileContents;
  }
}
