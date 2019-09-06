import { assert, expect } from 'chai';
import 'mocha';
import { DiagnosticBag } from '../../src/diagnostics/diagnostic-bag';
import { Lexer } from '../../src/syntax/lexer';
import { SyntaxKind } from '../../src/syntax/syntax-kind';

const TEST_SCRIPT = `ds = ds_grid_create();
ds_grid_clear(ds, 0);
var gw = ds_grid_width(ds) - 1;
var gh = ds_grid_height(ds) - 1;
/*
 * repeat 10 times
 */
repeat(10)
  {
  var xx = irandom(gw);
  var yy = irandom(gh);
  if ds[# xx, yy] == 0 ds[# xx, yy] = 1;
  }

var a = argument0; var i = 0; repeat(25)
{
i = irandom(99);
while (a[i] != 0)
  {
  i = irandom(99);
  }
a[@ i] = 100;
}
`;

const diagnosticBag = new DiagnosticBag();

describe('Lexer', () => {
  describe('#tokens()', () => {
    it('should fully represent the source code.', () => {
      const lexer = new Lexer(TEST_SCRIPT, diagnosticBag);
      const tokens = lexer.tokens();
      const result = tokens.reduce((str, token) => {
        str += token.leadingTrivia.map((trivia) => trivia.value).join('');
        str += token.value;
        str += token.trailingTrivia.map((trivia) => trivia.value).join('');
        return str;
      }, '');
      expect(result).to.equal(TEST_SCRIPT);
    });
    it('should return EOF if the input is empty.', () => {
      const lexer = new Lexer('', diagnosticBag);
      expect(lexer.tokens().length).to.equal(1);
    });
    it('should not care about whitespace.', () => {
      const lexer = new Lexer('    ', diagnosticBag);
      expect(lexer.tokens().length).to.equal(1);
    });
    it('should attach trivia on the same line as a token to the trailing trivia of that token.', () => {
      const whitespace = '   ';
      const lexer = new Lexer(`a${whitespace}`, diagnosticBag);
      const [firstToken] = lexer.tokens();
      expect(firstToken.trailingTrivia[0].kind).to.equal(SyntaxKind.Whitespace);
      expect(firstToken.trailingTrivia[0].value).to.equal(whitespace);
    });
    it('should attach any trivia after a line break to the leading trivia of the next token.', () => {
      const firstComment = '// test comment\n';
      const secondComment = '// another test comment\n';
      const lexer = new Lexer(`a${firstComment}${secondComment}b`, diagnosticBag);
      const [firstToken, secondToken] = lexer.tokens();
      expect(firstToken.trailingTrivia.length).to.equal(1);
      expect(secondToken.leadingTrivia.length).to.equal(1);
    });
    it('should recognise integer literals', () => {
      const lexer = new Lexer('12 43 155 0 123897', diagnosticBag);
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === SyntaxKind.IntLiteral));
    });
    it('should recognise real literals.', () => {
      const lexer = new Lexer('0.123 0.0 1.2 12343.4234', diagnosticBag);
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === SyntaxKind.RealLiteral));
    });
    it('should recognise hex literals.', () => {
      const lexer = new Lexer('$0fff $deadbeef $c0ffee', diagnosticBag);
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === SyntaxKind.HexLiteral));
    });
    it('should recognise string literals.', () => {
      const lexer = new Lexer(`"hello" 'world'`, diagnosticBag);
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === SyntaxKind.StringLiteral));
    });
    it('should recognise valid identifiers.', () => {
      const lexer = new Lexer('hello _world _123 hEllo WORLD _TEST _213ASD', diagnosticBag);
      assert.isTrue(lexer.tokens().slice(0, -1).every((token) => token.kind === SyntaxKind.Identifier));
    });
    it('should recognise boolean literals.', () => {
      const lexer = new Lexer('true false', diagnosticBag);
      const [trueToken, falseToken] = lexer.tokens();
      expect(trueToken.kind).to.equal(SyntaxKind.TrueLiteral);
      expect(falseToken.kind).to.equal(SyntaxKind.FalseLiteral);
    });
    it('should recognise misc symbols', () => {
      const lexer = new Lexer('. ; : , ! ? # @ = += -=', diagnosticBag);
      assert.isTrue(lexer.tokens().every((token) => token.kind !== SyntaxKind.Unknown));
    });
    it('should recognise arithmetic operators', () => {
      const lexer = new Lexer('+ ++ - -- * / %', diagnosticBag);
      assert.isTrue(lexer.tokens().every((token) => token.kind !== SyntaxKind.Unknown));
    });
    it('should recognise comparison operators.', () => {
      const lexer = new Lexer('> < >= <= == !=', diagnosticBag);
      assert.isTrue(lexer.tokens().every((token) => token.kind !== SyntaxKind.Unknown));
    });
    it('should recognise bitwise operators.', () => {
      const lexer = new Lexer('& | && || ^ ^^ << >> ~', diagnosticBag);
      assert.isTrue(lexer.tokens().every((token) => token.kind !== SyntaxKind.Unknown));
    });
    it('should recognise parentheses.', () => {
      const lexer = new Lexer('( ) { } [ ]', diagnosticBag);
      assert.isTrue(lexer.tokens().every((token) => token.kind !== SyntaxKind.Unknown));
    });
    it('should recognise keywords.', () => {
      const lexer = new Lexer('var mod div if else repeat while do until for continue switch case break default exit with enum', diagnosticBag);
      assert.isTrue(
        lexer.tokens().every((token) => token.kind !== SyntaxKind.Unknown && token.kind !== SyntaxKind.Identifier),
      );
    });
    it('should recognise unknown tokens.', () => {
      const lexer = new Lexer('💡', diagnosticBag);
      const [firstToken] = lexer.tokens();
      expect(firstToken.kind).to.equal(SyntaxKind.Unknown);
    });
    it('should report a diagnostic for unknown tokens.', () => {
      const lexer = new Lexer('💡', diagnosticBag);
      const before = diagnosticBag.reports.length;
      lexer.tokens();
      const after = diagnosticBag.reports.length;
      expect(after).to.be.greaterThan(before);
    });
  });
});
