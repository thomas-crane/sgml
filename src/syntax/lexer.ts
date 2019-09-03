import { match } from './match';
import { TextSpan } from './text-span';
import { Token } from './token';
import { TokenKind } from './token-kind';

const whitespace = match(/[\r\n\t ]/);
const digit = match(/[0-9]/);
const hex = match(/[A-Fa-f0-9]/);
const identifierHead = match(/[A-Za-z_]/);
const identifierBody = match(/[A-Za-z_0-9]/);

export class Lexer {
  private idx: number;
  private src: string;
  private get atEnd(): boolean {
    return this.idx === this.src.length;
  }

  private get current(): string {
    return this.src[this.idx];
  }
  constructor(src: string) {
    this.idx = 0;
    this.src = src;
  }

  tokens(): Token[] {
    const tokens: Token[] = [];
    let token: Token;
    do {
      token = this.nextToken();
      tokens.push(token);
    } while (token.kind !== TokenKind.EOF);
    return tokens;
  }

  private nextToken(): Token {
    // whitespace
    if (whitespace(this.current)) {
      do {
        this.advance();
      } while (!this.atEnd && whitespace(this.current));
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
      return new Token(
        TokenKind.LineComment,
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
      return new Token(
        TokenKind.BlockComment,
        new TextSpan(start, buf.length),
        buf,
      );
    }

    // eof
    if (this.atEnd) {
      return new Token(
        TokenKind.EOF,
        new TextSpan(this.idx, 0),
        '',
      );
    }

    // number literals
    if (digit(this.current)) {
      const start = this.idx;
      let buf = '';
      let type = TokenKind.IntLiteral;
      do {
        buf += this.current;
        this.advance();
      } while (!this.atEnd && digit(this.current));
      // check for real literals
      if (this.current === '.' && digit(this.peek(1))) {
        type = TokenKind.RealLiteral;
        do {
          buf += this.current;
          this.advance();
        } while (!this.atEnd && digit(this.current));
      }
      return new Token(
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
      return new Token(
        TokenKind.HexLiteral,
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
      return new Token(
        TokenKind.StringLiteral,
        new TextSpan(start, buf.length),
        buf,
      );
    }

    // misc
    let kind: TokenKind;
    const start = this.idx;
    let buf = this.current;
    this.advance();

    switch (buf) {
      case '.':
        kind = TokenKind.Dot;
        break;
      case ';':
        kind = TokenKind.Semicolon;
        break;
      case ',':
        kind = TokenKind.Semicolon;
        break;
      case '!':
        kind = TokenKind.Bang;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = TokenKind.BangEquals;
        }
        break;
      case '?':
        kind = TokenKind.QuestionMark;
        break;
      case '#':
        kind = TokenKind.Hash;
        break;
      case '+':
        kind = TokenKind.Plus;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = TokenKind.PlusEquals;
        }
        if (this.current === '+') {
          buf += this.current;
          this.advance();
          kind = TokenKind.PlusPlus;
        }
        break;
      case '-':
        kind = TokenKind.Minus;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = TokenKind.MinusEquals;
        }
        if (this.current === '-') {
          buf += this.current;
          this.advance();
          kind = TokenKind.MinusMinus;
        }
        break;
      case '*':
        kind = TokenKind.Star;
        break;
      case '/':
        kind = TokenKind.Slash;
        break;
      case '=':
        kind = TokenKind.Equals;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = TokenKind.EqualsEquals;
        }
        break;
      case '<':
        kind = TokenKind.LessThan;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = TokenKind.LessThanEquals;
        }
        if (this.current === '<') {
          buf += this.current;
          this.advance();
          kind = TokenKind.LessThanLessThan;
        }
        break;
      case '>':
        kind = TokenKind.GreaterThan;
        if (this.current === '=') {
          buf += this.current;
          this.advance();
          kind = TokenKind.GreaterThanEquals;
        }
        if (this.current === '>') {
          buf += this.current;
          this.advance();
          kind = TokenKind.GreaterThanGreaterThan;
        }
        break;
      case '&':
        kind = TokenKind.Ampersand;
        if (this.current === '&') {
          buf += this.current;
          this.advance();
          kind = TokenKind.AmpersandAmpersand;
        }
        break;
      case '|':
        kind = TokenKind.Pipe;
        if (this.current === '|') {
          buf += this.current;
          this.advance();
          kind = TokenKind.PipePipe;
        }
        break;
      case '^':
        kind = TokenKind.Caret;
        break;
      case '~':
        kind = TokenKind.Tilde;
        break;

      case '(':
        kind = TokenKind.LeftParenthesis;
        break;
      case ')':
        kind = TokenKind.RightParenthesis;
        break;
      case '{':
        kind = TokenKind.LeftCurlyBracket;
        break;
      case '}':
        kind = TokenKind.RightCurlyBracket;
        break;
      case '[':
        kind = TokenKind.LeftBracket;
        break;
      case ']':
        kind = TokenKind.RightBracket;
        break;
      default:
        kind = TokenKind.Unknown;
        break;
    }

    if (identifierHead(buf)) {
      while (!this.atEnd && identifierBody(this.current)) {
        buf += this.current;
        this.advance();
      }
      switch (buf) {
        case 'true':
          kind = TokenKind.TrueLiteral;
          break;
        case 'false':
          kind = TokenKind.FalseLiteral;
          break;
        case 'var':
          kind = TokenKind.Var;
          break;
        case 'mod':
          kind = TokenKind.Mod;
          break;
        case 'div':
          kind = TokenKind.Div;
          break;
        case 'if':
          kind = TokenKind.If;
          break;
        case 'else':
          kind = TokenKind.Else;
          break;
        case 'repeat':
          kind = TokenKind.Repeat;
          break;
        case 'while':
          kind = TokenKind.While;
          break;
        case 'do':
          kind = TokenKind.Do;
          break;
        case 'until':
          kind = TokenKind.Until;
          break;
        case 'for':
          kind = TokenKind.For;
          break;
        case 'continue':
          kind = TokenKind.Continue;
          break;
        case 'switch':
          kind = TokenKind.Switch;
          break;
        case 'case':
          kind = TokenKind.Case;
          break;
        case 'break':
          kind = TokenKind.Break;
          break;
        case 'default':
          kind = TokenKind.Default;
          break;
        case 'exit':
          kind = TokenKind.Exit;
          break;
        case 'with':
          kind = TokenKind.With;
          break;
        default:
          kind = TokenKind.Identifier;
          break;
      }
    }

    return new Token(
      kind,
      new TextSpan(start, buf.length),
      buf,
    );
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
