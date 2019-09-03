import { TextSpan } from '../syntax/text-span';
import { DiagnosticLevel } from './diagnostic-level';

export interface Diagnostic {
  level: DiagnosticLevel;
  span: TextSpan;
  message: string;
}
