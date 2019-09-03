import { assert, expect } from 'chai';
import 'mocha';
import { Lexer } from '../../src/syntax/lexer';
import { TokenKind } from '../../src/syntax/token-kind';

describe('Lexer', () => {
  describe('#allTokens()', () => {
    it('should return EOF if the input is empty.', () => {
      const lexer = new Lexer('');
      expect(lexer.tokens().length).to.equal(1);
    });
    it('should not care about whitespace.', () => {
      const lexer = new Lexer('    ');
      expect(lexer.tokens().length).to.equal(1);
    });
    it('should recognise line comments.', () => {
      const commentText = '// this is a test\n';
      const lexer = new Lexer(`${commentText} this is not included.`);
      const comment = lexer.tokens()[0];
      expect(comment.kind).to.equal(TokenKind.LineComment);
      expect(comment.value).to.equal(commentText);
    });
    it('should recognise block comments.', () => {
      const commentText = '/* this is another test */';
      const lexer = new Lexer(`${commentText} this is not included.`);
      const comment = lexer.tokens()[0];
      expect(comment.kind).to.equal(TokenKind.BlockComment);
      expect(comment.value).to.equal(commentText);
    });
    it('should recognise integer literals', () => {
      const lexer = new Lexer('12 43 155 0 123897');
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === TokenKind.IntLiteral));
    });
    it('should recognise real literals.', () => {
      const lexer = new Lexer('0.123 0.0 1.2 12343.4234');
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === TokenKind.RealLiteral));
    });
    it('should recognise hex literals.', () => {
      const lexer = new Lexer('$0fff $deadbeef $c0ffee');
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === TokenKind.HexLiteral));
    });
    it('should recognise string literals.', () => {
      const lexer = new Lexer(`"hello" 'world'`);
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === TokenKind.StringLiteral));
    });
    it('should recognise valid identifiers.', () => {
      const lexer = new Lexer('hello _world _123 hEllo WORLD _TEST _213ASD');
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === TokenKind.Identifier));
    });
    it('should recognise boolean literals.', () => {
      const lexer = new Lexer('true false');
      const [trueToken, falseToken] = lexer.tokens();
      expect(trueToken.kind).to.equal(TokenKind.TrueLiteral);
      expect(falseToken.kind).to.equal(TokenKind.FalseLiteral);
    });
    it('should recognise misc symbols', () => {
      const lexer = new Lexer('. ; , ! ? # = += -=');
      assert.isTrue(lexer.tokens().every((token) => token.kind !== TokenKind.Unknown));
    });
    it('should recognise arithmetic operators', () => {
      const lexer = new Lexer('+ ++ - -- * /');
      assert.isTrue(lexer.tokens().every((token) => token.kind !== TokenKind.Unknown));
    });
    it('should recognise comparison operators.', () => {
      const lexer = new Lexer('> < >= <= == !=');
      assert.isTrue(lexer.tokens().every((token) => token.kind !== TokenKind.Unknown));
    });
    it('should recognise bitwise operators.', () => {
      const lexer = new Lexer('& | && || ^ << >> ~');
      assert.isTrue(lexer.tokens().every((token) => token.kind !== TokenKind.Unknown));
    });
    it('should recognise parentheses.', () => {
      const lexer = new Lexer('( ) { } [ ]');
      assert.isTrue(lexer.tokens().every((token) => token.kind !== TokenKind.Unknown));
    });
    it('should recognise keywords.', () => {
      const lexer = new Lexer('var mod div if else repeat while do until for continue switch case break default exit with');
      assert.isTrue(
        lexer.tokens().every((token) => token.kind !== TokenKind.Unknown && token.kind !== TokenKind.Identifier),
      );
    });
    it('should recognise unknown tokens.', () => {
      const lexer = new Lexer('💡');
      const token = lexer.tokens()[0];
      expect(token.kind).to.equal(TokenKind.Unknown);
    });
  });
});
