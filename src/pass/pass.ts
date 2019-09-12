import { CompilationUnit } from '../program/compilation-unit';

export type PassConstructor = new (unit: CompilationUnit) => Pass;

export interface Pass {
  run(): Promise<void>;
}
