import { expect } from 'chai';
import 'mocha';
import { DiagnosticBag } from '../../src/diagnostics/diagnostic-bag';
import { Parser } from '../../src/parser/parser';
import { SyntaxKind } from '../../src/syntax/syntax-kind';
import { SyntaxToken } from '../../src/syntax/syntax-token';

const TEST_SCRIPT =
  `with (instance_create(x, y, obj_Ball))
{
  speed = other.speed;
  direction = other.direction;
}
`;

describe('SyntaxRoot', () => {
  describe('#forEachChild()', () => {
    it('should visit every child of every subtree.', () => {
      const parser = new Parser(TEST_SCRIPT, new DiagnosticBag());
      const root = parser.parseRoot();
      let result = '';
      root.forEachChild((child) => {
        // if the child is a token.
        if (child.kind > SyntaxKind.FirstToken && child.kind < SyntaxKind.LastToken) {
          const leadingTrivia = (child as SyntaxToken).leadingTrivia.map((trivia) => trivia.value);
          const trailingTrivia = (child as SyntaxToken).trailingTrivia.map((trivia) => trivia.value);

          result += leadingTrivia.join('');
          result += (child as SyntaxToken).value;
          result += trailingTrivia.join('');
        }
      });
      expect(result).to.equal(TEST_SCRIPT);
    });
  });
});
