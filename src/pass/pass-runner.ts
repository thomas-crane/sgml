import { CompilationUnit } from '../program/compilation-unit';
import { PassConstructor } from './pass';

export class PassRunner {

  constructor(
    private readonly passes: PassConstructor[],
  ) {

  }

  run(units: CompilationUnit[]) {
    return Promise.all(units.map((unit) => {
      return Promise.all(this.passes.map((pass) => {
        const passInstance = new pass(unit);
        return passInstance.run();
      }));
    }));
  }
}
