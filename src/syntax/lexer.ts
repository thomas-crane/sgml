import { DiagnosticBag } from '../diagnostics/diagnostic-bag';
import { match } from './match';
import { SyntaxKind } from './syntax-kind';
import { SyntaxNode } from './syntax-node';
import { SyntaxToken } from './syntax-token';
import { SyntaxTrivia } from './syntax-trivia';
import { TextSpan } from './text-span';

const whitespace = match(/[\r\n\t ]/);
const digit = match(/[0-9]/);
const hex = match(/[A-Fa-f0-9]/);
const identifierHead = match(/[A-Za-z_]/);
const identifierBody = match(/[A-Za-z_0-9]/);

export class Lexer {
  private idx: number;
  private readonly src: string;
  private readonly diagnostics: DiagnosticBag;
  private get atEnd(): boolean {
    return this.idx === this.src.length;
  }

  private get current(): string {
    return this.src[this.idx];
  }
  constructor(src: string, diagnostics: DiagnosticBag) {
    this.idx = 0;
    this.src = src;
    this.diagnostics = diagnostics;
  }

  tokens(): SyntaxToken[] {
    const tokens: SyntaxToken[] = [];
    let lastToken: SyntaxToken | undefined;
    let awaitingTrivia: SyntaxTrivia[] = [];
    let node: SyntaxNode;
    do {
      node = this.nextToken();
      if (node.kind > SyntaxKind.FirstTrivia && node.kind < SyntaxKind.LastTrivia) {
        const trivia = node as SyntaxTrivia;
        // if there is a current token, attach it to the trailing trivia.
        if (lastToken !== undefined) {
          lastToken.trailingTrivia.push(trivia);
          // if this trivia terminates the line, it should go into the
          // leading trivia of the next token.
          if (trivia.value.includes('\n')) {
            awaitingTrivia = [];
            lastToken = undefined;
          }
        } else {
          // otherwise wait for now.
          awaitingTrivia.push(node as SyntaxToken);
        }
      } else {
        const token = node as SyntaxToken;
        tokens.push(token);
        lastToken = token;
        // if there are any awaiting trivias, attach them to this token.
        for (const trivia of awaitingTrivia) {
          token.leadingTrivia.push(trivia);
        }
        awaitingTrivia = [];
      }
    } while (node.kind !== SyntaxKind.EOF);
    return tokens;
  }

  private nextToken(): SyntaxNode {
    // whitespace
    if (whitespace(this.current)) {
      const start = this.idx;
      let buf = '';
      do {
        buf += this.current;
        this.advance();
      } while (!this.atEnd && whitespace(this.current));
      return new SyntaxTrivia(
        SyntaxKind.Whitespace,
        new TextSpan(start, buf.length),
        buf,
      );
    }

    // line comments
    if (this.current === '/' && this.peek(1) === '/') {
      const start = this.idx;
      let buf = '';
      do {
        buf += this.current;
        this.advance();
      } while (!this.atEnd && this.peek(0) !== '\n');
      // also consume the final newline
      buf += this.current;
      this.advance();
      return new SyntaxTrivia(
        SyntaxKind.LineComment,
        new TextSpan(start, buf.length),
        buf,
      );
    }
    // block comments
    if (this.current === '/' && this.peek(1) === '*') {
      const start = this.idx;
      let buf = '';
      do {
        buf += this.current;
        this.advance();
      } while (!this.atEnd && !(this.peek(0) === '*' && this.peek(1) === '/'));
      // also consume the comment close
      buf += '*/';
      this.idx += 2;
      return new SyntaxTrivia(
        SyntaxKind.BlockComment,
        new TextSpan(start, buf.length),
        buf,
      );
    }

    // eof
    if (this.atEnd) {
      return new SyntaxToken(
        SyntaxKind.EOF,
        new TextSpan(this.idx, 0),
        '',
      );
    }

    // number literals
    if (digit(this.current)) {
      const start = this.idx;
      let buf = '';
      let type = SyntaxKind.IntLiteral;
      do {
        buf += this.current;
        this.advance();
      } while (!this.atEnd && digit(this.current));
      // check for real literals
      if (this.current === '.' && digit(this.peek(1))) {
        type = SyntaxKind.RealLiteral;
        do {
          buf += this.current;
          this.advance();
        } while (!this.atEnd && digit(this.current));
      }
      return new SyntaxToken(
        type,
        new TextSpan(start, buf.length),
        buf,
      );
    }
    // hex literals.
    if (this.current === '$') {
      const start = this.idx;
      let buf = '';
      do {
        buf += this.current;
        this.advance();
      } while (!this.atEnd && hex(this.current));
      return new SyntaxToken(
        SyntaxKind.HexLiteral,
        new TextSpan(start, buf.length),
        buf,
      );
    }

    // string literals
    if (this.current === '"' || this.current === `'`) {
      const EOS = this.current;
      const start = this.idx;
      let buf = '';
      do {
        buf += this.current;
        this.advance();
        // TODO: check for escaped quotes.
      } while (!this.atEnd && this.current !== EOS);
      return new SyntaxToken(
        SyntaxKind.StringLiteral,
        new TextSpan(start, buf.length),
        buf,
      );
    }

    // misc
    let kind: SyntaxKind;
    const start = this.idx;
    let buf = this.current;
    this.advance();

    switch (buf) {
      case '.':
        kind = SyntaxKind.Dot;
        break;
      case ';':
        kind = SyntaxKind.Semicolon;
        break;
      case ':':
        kind = SyntaxKind.Colon;
        break;
      case ',':
        kind = SyntaxKind.Comma;
        break;
      case '!':
        kind = SyntaxKind.Bang;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.BangEquals;
        }
        break;
      case '?':
        kind = SyntaxKind.QuestionMark;
        break;
      case '#':
        kind = SyntaxKind.Hash;
        break;
      case '@':
        kind = SyntaxKind.At;
        break;
      case '+':
        kind = SyntaxKind.Plus;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.PlusEquals;
        }
        if (this.current === '+') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.PlusPlus;
        }
        break;
      case '-':
        kind = SyntaxKind.Minus;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.MinusEquals;
        }
        if (this.current === '-') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.MinusMinus;
        }
        break;
      case '*':
        kind = SyntaxKind.Star;
        break;
      case '/':
        kind = SyntaxKind.Slash;
        break;
      case '%':
        kind = SyntaxKind.Percent;
        break;
      case '=':
        kind = SyntaxKind.Equals;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.EqualsEquals;
        }
        break;
      case '<':
        kind = SyntaxKind.LessThan;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.LessThanEquals;
        }
        if (this.current === '<') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.LessThanLessThan;
        }
        break;
      case '>':
        kind = SyntaxKind.GreaterThan;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.GreaterThanEquals;
        }
        if (this.current === '>') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.GreaterThanGreaterThan;
        }
        break;
      case '&':
        kind = SyntaxKind.Ampersand;
        if (this.current === '&') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.AmpersandAmpersand;
        }
        break;
      case '|':
        kind = SyntaxKind.Pipe;
        if (this.current === '|') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.PipePipe;
        }
        break;
      case '^':
        kind = SyntaxKind.Caret;
        if (this.current === '^') {
          buf += this.current;
          this.advance();
          kind = SyntaxKind.CaretCaret;
        }
        break;
      case '~':
        kind = SyntaxKind.Tilde;
        break;

      case '(':
        kind = SyntaxKind.LeftParenthesis;
        break;
      case ')':
        kind = SyntaxKind.RightParenthesis;
        break;
      case '{':
        kind = SyntaxKind.LeftCurlyBracket;
        break;
      case '}':
        kind = SyntaxKind.RightCurlyBracket;
        break;
      case '[':
        kind = SyntaxKind.LeftBracket;
        break;
      case ']':
        kind = SyntaxKind.RightBracket;
        break;
      default:
        kind = SyntaxKind.Unknown;
        break;
    }

    if (identifierHead(buf)) {
      while (!this.atEnd && identifierBody(this.current)) {
        buf += this.current;
        this.advance();
      }
      switch (buf) {
        case 'true':
          kind = SyntaxKind.TrueLiteral;
          break;
        case 'false':
          kind = SyntaxKind.FalseLiteral;
          break;
        case 'var':
          kind = SyntaxKind.Var;
          break;
        case 'mod':
          kind = SyntaxKind.Mod;
          break;
        case 'div':
          kind = SyntaxKind.Div;
          break;
        case 'if':
          kind = SyntaxKind.If;
          break;
        case 'else':
          kind = SyntaxKind.Else;
          break;
        case 'repeat':
          kind = SyntaxKind.Repeat;
          break;
        case 'while':
          kind = SyntaxKind.While;
          break;
        case 'do':
          kind = SyntaxKind.Do;
          break;
        case 'until':
          kind = SyntaxKind.Until;
          break;
        case 'for':
          kind = SyntaxKind.For;
          break;
        case 'continue':
          kind = SyntaxKind.Continue;
          break;
        case 'switch':
          kind = SyntaxKind.Switch;
          break;
        case 'case':
          kind = SyntaxKind.Case;
          break;
        case 'break':
          kind = SyntaxKind.Break;
          break;
        case 'default':
          kind = SyntaxKind.Default;
          break;
        case 'exit':
          kind = SyntaxKind.Exit;
          break;
        case 'with':
          kind = SyntaxKind.With;
          break;
        case 'enum':
          kind = SyntaxKind.Enum;
          break;
        default:
          kind = SyntaxKind.Identifier;
          break;
      }
    }

    const token = new SyntaxToken(
      kind,
      new TextSpan(start, buf.length),
      buf,
    );
    if (kind === SyntaxKind.Unknown) {
      this.diagnostics.reportUnknownCharacter(token);
    }
    return token;
  }

  private peek(n: number): string | undefined {
    if (this.idx + n < this.src.length) {
      return this.src[this.idx + n];
    } else {
      return undefined;
    }
  }

  private advance(): void {
    if (this.idx < this.src.length) {
      this.idx++;
    }
  }
}
