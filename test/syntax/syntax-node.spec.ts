import { expect } from 'chai';
import 'mocha';
import { Parser } from '../../src/parser/parser';
import { SyntaxKind } from '../../src/syntax/syntax-kind';
import { source } from '../util';

describe('SyntaxNode', () => {
  describe('#isChildOf()', () => {
    it('should return true if the syntax node is a child of the specified node kind.', async () => {
      const parser = new Parser(source('while (true) { if (false) { exit; } }'));
      const root = await parser.parseRoot();
      root.forEachChild((child) => {
        if (child.kind === SyntaxKind.Exit) {
          expect(child.isChildOf(SyntaxKind.WhileStatement)).to.equal(true);
          expect(child.isChildOf(SyntaxKind.IfStatement)).to.equal(true);
        }
      });
    });
    it('should return false if the syntax node is not a child of the specified node kind.', async () => {
      const parser = new Parser(source('while (true) { if (false) { exit; } }'));
      const root = await parser.parseRoot();
      root.forEachChild((child) => {
        if (child.kind === SyntaxKind.Exit) {
          expect(child.isChildOf(SyntaxKind.DoStatement)).to.equal(false);
        }
      });
    });
  });
});
