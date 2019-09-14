import { expect } from 'chai';
import 'mocha';
import { CheckDeclarationList } from '../../src/semantic/check-declaration-list';
import { getReportCounter } from '../util';

const reportCounter = getReportCounter(CheckDeclarationList);

describe('CheckDeclarationList', () => {
  describe('local declaration checks.', () => {
    it('should report a diagnostic if an expression other than assignment or identifier is used.', async () => {
      const count = await reportCounter('var test = 10, 1 + 2, b;');
      expect(count).to.equal(1);
    });
    it('should not report a diagnostic if only identifiers are used.', async () => {
      const count = await reportCounter('var a, b, c;');
      expect(count).to.equal(0);
    });
    it('should not report a diagnostic if only assignment expressions are used.', async () => {
      const count = await reportCounter('var a = 10, b = 20, c = 30;');
      expect(count).to.equal(0);
    });
    it('should not report a diagnostic if only either are used.', async () => {
      const count = await reportCounter('var a, b = 10, c, d = 20;');
      expect(count).to.equal(0);
    });
    it('should report a diagnostic if neither are used.', async () => {
      const count = await reportCounter('var 1 + 2, test();');
      expect(count).to.be.equal(2);
    });
  });
});
