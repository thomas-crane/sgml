import { TextSpan } from '../syntax/text-span';
import { Diagnostic } from './diagnostic';
import { DiagnosticLevel } from './diagnostic-level';

export class DiagnosticBag {
  readonly reports: Diagnostic[];

  constructor() {
    this.reports = [];
  }

  private report(message: string, span: TextSpan, level: DiagnosticLevel = DiagnosticLevel.Error) {
    this.reports.push({
      message,
      span,
      level,
    });
  }
}
