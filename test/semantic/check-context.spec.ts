import { expect } from 'chai';
import 'mocha';
import { PassRunner } from '../../src/pass/pass-runner';
import { CompilationUnit } from '../../src/program/compilation-unit';
import { CheckContext } from '../../src/semantic/check-context';
import { source } from '../util';

async function getReportCount(src: string): Promise<number> {
  const unit = new CompilationUnit(source(src));
  // parse the AST now to avoid counting parse diagnostics later
  await unit.syntaxRoot();
  const before = unit.diagnostics.reports.length;
  const runner = new PassRunner([CheckContext]);
  await runner.run([unit]);
  return unit.diagnostics.reports.length - before;
}

describe('CheckContext', () => {
  describe('break statement checks.', () => {
    it('should report a diagnostic if a break statement appears outside of a loop.', async () => {
      const count = await getReportCount('break;');
      expect(count).to.be.greaterThan(0);
    });
    it('should not report a diagnostic if a break statement appears in a switch statement.', async () => {
      const count = await getReportCount('switch (value) { default: break; }');
      expect(count).to.equal(0);
    });
    it('should not report a diagnostic if a break statement appears in a for loop.', async () => {
      const count = await getReportCount('for (var i = 0; i < 10; i++) { if (i > 2) { break; } }');
      expect(count).to.equal(0);
    });
    it('should not report a diagnostic if a break statement appears in a while loop.', async () => {
      const count = await getReportCount('while (true) { if (irandom(10) < 5) break; }');
      expect(count).to.equal(0);
    });
    it('should not report a diagnostic if a break statement appears in a do loop.', async () => {
      const count = await getReportCount('do { break; } until (false);');
      expect(count).to.equal(0);
    });
  });
  describe('continue statement checks.', () => {
    it('should report a diagnostic if a continue statement appears outside of a loop.', async () => {
      const count = await getReportCount('if true { continue; }');
      expect(count).to.be.greaterThan(0);
    });
    it('should not report a diagnostic if a continue statement appears in a for loop.', async () => {
      const count = await getReportCount('for (var i = 0; i < 10; i++) { if (i > 2) { continue; } }');
      expect(count).to.equal(0);
    });
    it('should not report a diagnostic if a continue statement appears in a while loop.', async () => {
      const count = await getReportCount('while (true) { if (irandom(10) < 5) continue; }');
      expect(count).to.equal(0);
    });
    it('should not report a diagnostic if a continue statement appears in a do loop.', async () => {
      const count = await getReportCount('do { continue; } until (false);');
      expect(count).to.equal(0);
    });
  });
  describe('switch statement checks.', () => {
    it('should report a diagnostic if a default statement appears outside of a switch statement.', async () => {
      const count = await getReportCount('if (true) { default: print("hello"); }');
      expect(count).to.be.greaterThan(0);
    });
    it('should report a diagnostic if a case statement appears outside of a switch statement.', async () => {
      const count = await getReportCount('case 10: return "world";');
      expect(count).to.be.greaterThan(0);
    });
  });
});
