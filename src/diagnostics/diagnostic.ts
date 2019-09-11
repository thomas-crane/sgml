import { TextSpan } from '../syntax/text-span';
import { Source } from '../text/source';
import { DiagnosticLevel } from './diagnostic-level';

export interface Diagnostic {
  source: Source;
  level: DiagnosticLevel;
  span: TextSpan;
  message: string;
}
