import { Diagnostic } from '../diagnostics/diagnostic';

export interface Source {
  name: string;
  diagnostics: Diagnostic[];
  contents(): Promise<string>;
}
