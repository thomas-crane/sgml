import { Source } from '../src/text/source';
import { SourceText } from '../src/text/source-text';

export function source(src: string): Source {
  return new SourceText('test-script', src);
}
