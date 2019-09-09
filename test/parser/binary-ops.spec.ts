import { expect } from 'chai';
import 'mocha';
import { BinaryExpression } from '../../src/ast/binary-expression';
import { ExpressionStatement } from '../../src/ast/expression-statement';
import { TerminatedStatement } from '../../src/ast/terminated-statement';
import { DiagnosticBag } from '../../src/diagnostics/diagnostic-bag';
import { Parser } from '../../src/parser/parser';
import { SyntaxRoot } from '../../src/parser/syntax-root';
import { SyntaxKind } from '../../src/syntax/syntax-kind';

const diagnosticBag = new DiagnosticBag();

function unwrap(root: SyntaxRoot): BinaryExpression {
  return ((root.statements[0] as TerminatedStatement)
    .statement as ExpressionStatement)
    .expression as BinaryExpression;
}

describe('Parser', () => {
  describe('binary operations.', () => {
    it('should be able to parse binary operation expressions.', () => {
      const parser = new Parser('1 + 2;', diagnosticBag);
      const root = parser.parseRoot();
      expect(unwrap(root).kind).to.equal(SyntaxKind.BinaryExpression);
    });
    it('should have the correct order of operations.', () => {
      const parser = new Parser('1 + 2 - 3 * 5;', diagnosticBag);
      const root = parser.parseRoot();
      // the higher precedence operators should be lower down in the tree.
      const rightOp = (unwrap(root).right as BinaryExpression).opToken.kind;
      const leftOp = (unwrap(root).left as BinaryExpression).opToken.kind;
      expect(rightOp).to.equal(SyntaxKind.Star);
      expect(leftOp).to.equal(SyntaxKind.Plus);
      expect(unwrap(root).opToken.kind).to.equal(SyntaxKind.Minus);
    });
    it('should not bind as tightly as unary operations.', () => {
      const parser = new Parser('-1 + ~2;', diagnosticBag);
      const root = parser.parseRoot();
      expect(unwrap(root).kind).to.equal(SyntaxKind.BinaryExpression);
    });
    it('should not bind as tightly as function calls.', () => {
      const parser = new Parser('a() - b();', diagnosticBag);
      const root = parser.parseRoot();
      expect(unwrap(root).kind).to.equal(SyntaxKind.BinaryExpression);
    });
    it('should not bind as tightly as accessors.', () => {
      const parser = new Parser('a[| 1] - b[3, 5] * c[? "test"]', diagnosticBag);
      const root = parser.parseRoot();
      expect(unwrap(root).kind).to.equal(SyntaxKind.BinaryExpression);
    });
    it('should not bind as tightly as parenthesised expressions.', () => {
      const parser = new Parser('(1 + 2) * 3;', diagnosticBag);
      const root = parser.parseRoot();
      expect(unwrap(root).opToken.kind).to.equal(SyntaxKind.Star);
    });
    it('should not bind as tightly as prefix or postfix operations.', () => {
      const parser = new Parser('--a + b++;', diagnosticBag);
      const root = parser.parseRoot();
      expect(unwrap(root).kind).to.equal(SyntaxKind.BinaryExpression);
    });
  });
});
