import * as path from 'path';
import { SourceFile } from '../text/source-file';
import * as fsUtil from '../util/fs';
import { CompilationUnit } from './compilation-unit';

export class Program {
  readonly basePath: string;

  private files: Set<SourceFile>;

  constructor(basePath: string) {
    this.basePath = basePath;
    this.files = new Set();
  }

  async getSourceFiles(): Promise<void> {
    async function scanDir(dir: string): Promise<string[]> {
      const files = await fsUtil.readdir(dir);
      const results: string[] = [];
      for (const file of files) {
        try {
          const innerFiles = await scanDir(file);
          results.push(...innerFiles);
        } catch {
          if (path.extname(file) === '.gml') {
            results.push(path.join(dir, file));
          }
        }
      }
      return results;
    }
    const paths = await scanDir(this.basePath);
    this.files = new Set(paths.map((filePath) => new SourceFile(filePath)));
  }

  emit(): Promise<CompilationUnit[]> {
    return Promise.all([...this.files].map(async (file) => {
      const compilation = new CompilationUnit(file);
      await compilation.syntaxRoot();
      return compilation;
    }));
  }
}
