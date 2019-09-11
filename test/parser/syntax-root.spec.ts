import { expect } from 'chai';
import 'mocha';
import { Parser } from '../../src/parser/parser';
import { SyntaxKind } from '../../src/syntax/syntax-kind';
import { SyntaxToken } from '../../src/syntax/syntax-token';
import { source } from '../util';

const SCRIPT_CONTENTS = `with (instance_create(x, y, obj_Ball))
{
  speed = other.speed;
  direction = other.direction;
}
`;

describe('SyntaxRoot', () => {
  describe('#forEachChild()', () => {
    it('should visit every child of every subtree.', async () => {
      const parser = new Parser(source(SCRIPT_CONTENTS));
      const root = await parser.parseRoot();
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
      expect(result).to.equal(SCRIPT_CONTENTS);
    });
  });
});
