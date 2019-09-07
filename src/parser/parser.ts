import { ArrayAccessExpression } from '../ast/array-access-expression';
import { ArrayIndexExpression } from '../ast/array-index-expression';
import { BinaryExpression } from '../ast/binary-expression';
import { BlockStatement } from '../ast/block-statement';
import { BoolLiteralExpression } from '../ast/bool-literal-expression';
import { BreakStatement } from '../ast/break-statement';
import { CallExpression } from '../ast/call-expression';
import { CaseStatement } from '../ast/case-statement';
import { ContinueStatement } from '../ast/continue-statement';
import { DefaultStatement } from '../ast/default-statement';
import { DoStatement } from '../ast/do-statement';
import { ExitStatement } from '../ast/exit-statement';
import { ExpressionStatement } from '../ast/expression-statement';
import { ExpressionSyntax } from '../ast/expression-syntax';
import { ForStatement } from '../ast/for-statement';
import { GridAccessExpression } from '../ast/grid-access-expression';
import { HexLiteralExpression } from '../ast/hex-literal-expression';
import { IdentifierExpression } from '../ast/identifier-expression';
import { IfStatement } from '../ast/if-statement';
import { IntLiteralExpression } from '../ast/int-literal-expression';
import { ListAccessExpression } from '../ast/list-access-expression';
import { LocalDeclarationListStatement } from '../ast/local-declaration-list-statement';
import { LocalDeclarationStatement } from '../ast/local-declaration-statement';
import { MapAccessExpression } from '../ast/map-access-expression';
import { ParenthesisedExpression } from '../ast/parenthesised-expression';
import { PostfixExpression } from '../ast/postfix-expression';
import { PrefixExpression } from '../ast/prefix-expression';
import { PropertyAccessExpression } from '../ast/property-access-expression';
import { RealLiteralExpression } from '../ast/real-literal-expression';
import { RepeatStatement } from '../ast/repeat-statement';
import { StatementSyntax } from '../ast/statement-syntax';
import { StringLiteralExpression } from '../ast/string-literal-expression';
import { SwitchStatement } from '../ast/switch-statement';
import { UnaryExpression } from '../ast/unary-expression';
import { WhileStatement } from '../ast/while-statement';
import { WithStatement } from '../ast/with-statement';
import { DiagnosticBag } from '../diagnostics/diagnostic-bag';
import { Lexer } from '../syntax/lexer';
import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxNode } from '../syntax/syntax-node';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { SyntaxRoot } from './syntax-root';

/**
 * Whether or not the operator is a valid unary operator.
 * Unary operators all have the same precedence, so simply
 * checking whether a token is a valid one or not is sufficient.
 * @param op The operator to check.
 */
function isUnaryOperator(op: SyntaxKind): boolean {
  switch (op) {
    case SyntaxKind.Bang:
    case SyntaxKind.Minus:
    case SyntaxKind.Tilde:
      return true;
    default:
      return false;
  }
}

/**
 * Gets the precedence of the given binary operator where a
 * higher number represents a higher precedence.
 * Returns `0` if the operator has no precedence.
 * @param op The operator to get the precedence of.
 */
function getBinaryOperatorPrecedence(op: SyntaxKind): number {
  switch (op) {
    case SyntaxKind.Div:
    case SyntaxKind.Mod:
    case SyntaxKind.Percent:
      return 7;
    case SyntaxKind.Slash:
    case SyntaxKind.Star:
      return 6;
    case SyntaxKind.Plus:
    case SyntaxKind.Minus:
      return 5;
    case SyntaxKind.Pipe:
    case SyntaxKind.Ampersand:
    case SyntaxKind.Caret:
    case SyntaxKind.LessThanLessThan:
    case SyntaxKind.GreaterThanGreaterThan:
      return 4;
    case SyntaxKind.LessThan:
    case SyntaxKind.LessThanEquals:
    case SyntaxKind.GreaterThan:
    case SyntaxKind.GreaterThanEquals:
    case SyntaxKind.BangEquals:
    case SyntaxKind.EqualsEquals:
      return 3;
    case SyntaxKind.AmpersandAmpersand:
    case SyntaxKind.AmpersandAmpersand:
    case SyntaxKind.CaretCaret:
      return 2;
    case SyntaxKind.Equals:
    case SyntaxKind.PlusEquals:
    case SyntaxKind.MinusEquals:
      return 1;
    default:
      return 0;
  }
}

export class Parser {

  private idx: number;

  private readonly tokens: SyntaxToken[];
  private readonly diagnostics: DiagnosticBag;

  private get current(): SyntaxToken {
    return this.tokens[this.idx];
  }

  private get atEnd(): boolean {
    return this.current.kind === SyntaxKind.EOF;
  }

  constructor(source: string, diagnostics: DiagnosticBag) {
    const lexer = new Lexer(source, diagnostics);
    this.tokens = lexer.tokens();
    this.idx = 0;
    this.diagnostics = diagnostics;
  }

  parseRoot(): SyntaxRoot {
    const statements: StatementSyntax[] = [];
    while (this.current.kind !== SyntaxKind.EOF) {
      const start = this.idx;
      const statement = this.parseStatement();
      statements.push(statement);
      if (this.idx === start) {
        this.nextToken();
      }
    }
    const eof = this.consume(SyntaxKind.EOF);
    return new SyntaxRoot(statements, eof);
  }

  private parseStatement(): StatementSyntax {
    switch (this.current.kind) {
      case SyntaxKind.LeftCurlyBracket:
        return this.parseBlockStatement();
      case SyntaxKind.Var:
        if (this.peek(2) !== undefined && this.peek(2)!.kind === SyntaxKind.Equals) {
          return this.parseLocalDeclarationStatement();
        }
        return this.parseLocalDeclarationListStatement();
      case SyntaxKind.If:
        return this.parseIfStatement();
      case SyntaxKind.Repeat:
        return this.parseRepeatStatement();
      case SyntaxKind.While:
        return this.parseWhileStatement();
      case SyntaxKind.Break:
        return this.parseBreakStatement();
      case SyntaxKind.Continue:
        return this.parseContinueStatement();
      case SyntaxKind.Exit:
        return this.parseExitStatement();
      case SyntaxKind.Do:
        return this.parseDoStatement();
      case SyntaxKind.For:
        return this.parseForStatement();
      case SyntaxKind.Switch:
        return this.parseSwitchStatement();
      case SyntaxKind.Case:
        return this.parseCaseStatement();
      case SyntaxKind.Default:
        return this.parseDefaultStatement();
      case SyntaxKind.With:
        return this.parseWithStatement();
      default:
        return this.parseExpressionStatement();
    }
  }

  private parseBlockStatement(): BlockStatement {
    const leftCurlyBracket = this.consume(SyntaxKind.LeftCurlyBracket);
    const statements: StatementSyntax[] = [];
    while (this.current.kind !== SyntaxKind.RightCurlyBracket && !this.atEnd) {
      const start = this.idx;
      const statement = this.parseStatement();
      statements.push(statement);
      if (this.idx === start) {
        this.nextToken();
      }
    }
    const rightCurlyBracket = this.consume(SyntaxKind.RightCurlyBracket);
    return new BlockStatement(leftCurlyBracket, statements, rightCurlyBracket);
  }

  private parseLocalDeclarationStatement(): LocalDeclarationStatement {
    const varToken = this.consume(SyntaxKind.Var);
    const identifier = this.parseIdentifierExpression();
    const equals = this.consume(SyntaxKind.Equals);
    const initialiser = this.parseExpression();
    const semicolon = this.consume(SyntaxKind.Semicolon);
    return new LocalDeclarationStatement(
      varToken,
      identifier,
      equals,
      initialiser,
      semicolon,
    );
  }

  private parseLocalDeclarationListStatement(): LocalDeclarationListStatement {
    const varToken = this.consume(SyntaxKind.Var);
    const declarations: SyntaxNode[] = [];
    while (this.current.kind !== SyntaxKind.Semicolon && !this.atEnd) {
      const start = this.idx;
      const identifier = this.parseIdentifierExpression();
      declarations.push(identifier);
      // if we haven't reached the semicolon, there must
      // be a comma before we can parse the next identifier.
      if (this.peek(0)!.kind !== SyntaxKind.Semicolon) {
        declarations.push(this.consume(SyntaxKind.Comma));
      }
      if (this.idx === start) {
        this.nextToken();
      }
    }
    const semicolon = this.consume(SyntaxKind.Semicolon);
    return new LocalDeclarationListStatement(
      varToken,
      declarations,
      semicolon,
    );
  }

  private parseIfStatement(): IfStatement {
    const ifToken = this.consume(SyntaxKind.If);
    const leftParen = this.consume(SyntaxKind.LeftParenthesis);
    const condition = this.parseExpression();
    const rightParen = this.consume(SyntaxKind.RightParenthesis);
    const thenBlock = this.parseStatement();
    let elseToken: SyntaxToken | undefined;
    let elseBlock: StatementSyntax | undefined;
    if (this.current.kind === SyntaxKind.Else) {
      elseToken = this.consume(SyntaxKind.Else);
      elseBlock = this.parseStatement();
    }
    return new IfStatement(
      ifToken,
      leftParen,
      condition,
      rightParen,
      thenBlock,
      elseToken,
      elseBlock,
    );
  }

  private parseRepeatStatement(): RepeatStatement {
    const repeat = this.consume(SyntaxKind.Repeat);
    const leftParen = this.consume(SyntaxKind.LeftParenthesis);
    const amount = this.parseExpression();
    const rightParen = this.consume(SyntaxKind.RightParenthesis);
    const statement = this.parseStatement();
    return new RepeatStatement(
      repeat,
      leftParen,
      amount,
      rightParen,
      statement,
    );
  }

  private parseWhileStatement(): WhileStatement {
    const whileToken = this.consume(SyntaxKind.While);
    const leftParen = this.consume(SyntaxKind.LeftParenthesis);
    const condition = this.parseExpression();
    const rightParen = this.consume(SyntaxKind.RightParenthesis);
    const statement = this.parseStatement();
    return new WhileStatement(
      whileToken,
      leftParen,
      condition,
      rightParen,
      statement,
    );
  }

  private parseBreakStatement(): BreakStatement {
    const breakToken = this.consume(SyntaxKind.Break);
    const semicolon = this.consume(SyntaxKind.Semicolon);
    return new BreakStatement(breakToken, semicolon);
  }

  private parseContinueStatement(): ContinueStatement {
    const continueToken = this.consume(SyntaxKind.Continue);
    const semicolon = this.consume(SyntaxKind.Semicolon);
    return new ContinueStatement(continueToken, semicolon);
  }

  private parseExitStatement(): ExitStatement {
    const exit = this.consume(SyntaxKind.Exit);
    const semicolon = this.consume(SyntaxKind.Semicolon);
    return new ExitStatement(exit, semicolon);
  }

  private parseDoStatement(): DoStatement {
    const doToken = this.consume(SyntaxKind.Do);
    const statement = this.parseStatement();
    const until = this.consume(SyntaxKind.Until);
    const leftParen = this.consume(SyntaxKind.LeftParenthesis);
    const condition = this.parseExpression();
    const rightParen = this.consume(SyntaxKind.RightParenthesis);
    const semicolon = this.consume(SyntaxKind.Semicolon);
    return new DoStatement(
      doToken,
      statement,
      until,
      leftParen,
      condition,
      rightParen,
      semicolon,
    );
  }

  private parseForStatement(): ForStatement {
    const forToken = this.consume(SyntaxKind.For);
    const leftParen = this.consume(SyntaxKind.LeftParenthesis);
    const initialiser = this.parseExpressionStatement();
    const condition = this.parseExpressionStatement();
    const step = this.parseExpression();
    const rightParen = this.consume(SyntaxKind.RightParenthesis);
    const statement = this.parseStatement();
    return new ForStatement(
      forToken,
      leftParen,
      initialiser,
      condition,
      step,
      rightParen,
      statement,
    );
  }

  private parseSwitchStatement(): SwitchStatement {
    const switchToken = this.consume(SyntaxKind.Switch);
    const leftParen = this.consume(SyntaxKind.LeftParenthesis);
    const condition = this.parseExpression();
    const rightParen = this.consume(SyntaxKind.RightParenthesis);
    const leftCurlyBracket = this.consume(SyntaxKind.LeftCurlyBracket);
    const statements: StatementSyntax[] = [];
    while (this.current.kind !== SyntaxKind.RightCurlyBracket && !this.atEnd) {
      const start = this.idx;
      const statement = this.parseStatement();
      statements.push(statement);
      if (this.idx === start) {
        this.nextToken();
      }
    }
    const rightCurlyBracket = this.consume(SyntaxKind.RightCurlyBracket);
    return new SwitchStatement(
      switchToken,
      leftParen,
      condition,
      rightParen,
      leftCurlyBracket,
      statements,
      rightCurlyBracket,
    );
  }

  private parseCaseStatement(): CaseStatement {
    const caseToken = this.consume(SyntaxKind.Case);
    const expression = this.parseExpression();
    const colon = this.consume(SyntaxKind.Colon);
    return new CaseStatement(caseToken, expression, colon);
  }

  private parseDefaultStatement(): DefaultStatement {
    const defaultToken = this.consume(SyntaxKind.Default);
    const colon = this.consume(SyntaxKind.Colon);
    return new DefaultStatement(defaultToken, colon);
  }

  private parseWithStatement(): WithStatement {
    const withToken = this.consume(SyntaxKind.With);
    const leftParen = this.consume(SyntaxKind.LeftParenthesis);
    const condition = this.parseExpression();
    const rightParen = this.consume(SyntaxKind.RightParenthesis);
    const statement = this.parseStatement();
    return new WithStatement(
      withToken,
      leftParen,
      condition,
      rightParen,
      statement,
    );
  }

  private parseExpressionStatement(): ExpressionStatement {
    const expression = this.parseExpression();
    const semicolon = this.consume(SyntaxKind.Semicolon);
    return new ExpressionStatement(expression, semicolon);
  }

  private parseExpression(): ExpressionSyntax {
    return this.parseBinaryExpression();
  }

  private parseBinaryExpression(parentPrecedence: number = 0): ExpressionSyntax {
    let left = this.parseUnaryExpression();
    while (!this.atEnd) {
      const precedence = getBinaryOperatorPrecedence(this.current.kind);
      if (precedence === 0 || precedence <= parentPrecedence) {
        break;
      } else {
        const operatorToken = this.nextToken();
        const right = this.parseBinaryExpression(precedence);
        left = new BinaryExpression(left, operatorToken, right);
      }
    }
    return left;
  }

  private parseUnaryExpression(): ExpressionSyntax {
    if (isUnaryOperator(this.current.kind)) {
      const operatorToken = this.nextToken();
      const operand = this.parseUnaryExpression();
      return new UnaryExpression(operatorToken, operand);
    } else {
      return this.parsePostfixExpression();
    }
  }

  private parsePostfixExpression(): ExpressionSyntax {
    const expression = this.parsePrimaryExpression();
    switch (this.current.kind) {
      case SyntaxKind.PlusPlus:
      case SyntaxKind.MinusMinus:
        const opToken = this.nextToken();
        return new PostfixExpression(expression, opToken);
    }
    return expression;
  }

  private parsePrimaryExpression(): ExpressionSyntax {
    switch (this.current.kind) {
      case SyntaxKind.LeftParenthesis:
        return this.parseParenthesisedExpression();
      case SyntaxKind.TrueLiteral:
      case SyntaxKind.FalseLiteral:
        return this.parseBoolLiteralExpression();
      case SyntaxKind.StringLiteral:
        return this.parseStringLiteral();
      case SyntaxKind.IntLiteral:
        return this.parseIntLiteralExpression();
      case SyntaxKind.RealLiteral:
        return this.parseRealLiteralExpression();
      case SyntaxKind.HexLiteral:
        return this.parseHexLiteralExpression();
      case SyntaxKind.PlusPlus:
      case SyntaxKind.MinusMinus:
        return this.parsePrefixExpression();
      case SyntaxKind.Identifier:
        if (this.peek(1) !== undefined) {
          switch (this.peek(1)!.kind) {
            case SyntaxKind.Dot:
              return this.parsePropertyAccessExpression();
            case SyntaxKind.LeftParenthesis:
              return this.parseCallExpression();
            case SyntaxKind.LeftBracket:
              if (this.peek(2) !== undefined) {
                switch (this.peek(2)!.kind) {
                  case SyntaxKind.Pipe:
                    return this.parseListAccessExpression();
                  case SyntaxKind.QuestionMark:
                    return this.parseMapAccessExpression();
                  case SyntaxKind.Hash:
                    return this.parseGridAccessExpression();
                  case SyntaxKind.At:
                    return this.parseArrayAccessExpression();
                }
              }
              return this.parseArrayIndexExpression();
          }
        }
        return this.parseIdentifierExpression();
      default:
        return this.parseIdentifierExpression();
    }
  }

  private parseParenthesisedExpression(): ExpressionSyntax {
    const leftParen = this.consume(SyntaxKind.LeftParenthesis);
    const expression = this.parseExpression();
    const rightParen = this.consume(SyntaxKind.RightParenthesis);
    const parenExpression = new ParenthesisedExpression(leftParen, expression, rightParen);
    // parenthesised expressions can be the target of a property access.
    if (this.current.kind === SyntaxKind.Dot) {
      const dot = this.nextToken();
      const property = this.parseIdentifierExpression();
      return new PropertyAccessExpression(parenExpression, dot, property);
    }
    return parenExpression;
  }

  private parseBoolLiteralExpression(): BoolLiteralExpression {
    const value = this.nextToken();
    return new BoolLiteralExpression(value);
  }

  private parseStringLiteral(): StringLiteralExpression {
    const value = this.consume(SyntaxKind.StringLiteral);
    return new StringLiteralExpression(value);
  }

  private parseIntLiteralExpression(): IntLiteralExpression {
    const value = this.consume(SyntaxKind.IntLiteral);
    return new IntLiteralExpression(value);
  }

  private parseRealLiteralExpression(): RealLiteralExpression {
    const value = this.consume(SyntaxKind.RealLiteral);
    return new RealLiteralExpression(value);
  }

  private parseHexLiteralExpression(): HexLiteralExpression {
    const value = this.consume(SyntaxKind.HexLiteral);
    return new HexLiteralExpression(value);
  }

  private parsePrefixExpression(): PrefixExpression {
    const opToken = this.nextToken();
    const operand = this.parseExpression();
    return new PrefixExpression(opToken, operand);
  }

  private parsePropertyAccessExpression(): PropertyAccessExpression {
    const target = this.parseIdentifierExpression();
    const dot = this.consume(SyntaxKind.Dot);
    const property = this.parseIdentifierExpression();
    return new PropertyAccessExpression(target, dot, property);
  }

  private parseCallExpression(): ExpressionSyntax {
    const callee = this.parseIdentifierExpression();
    const leftParen = this.consume(SyntaxKind.LeftParenthesis);
    const args: SyntaxNode[] = [];
    while (this.current.kind !== SyntaxKind.RightParenthesis && !this.atEnd) {
      const start = this.idx;
      const arg = this.parseExpression();
      args.push(arg);
      // if we haven't reached the right hand parenthesis,
      // there must be a comma before we can parse the next arg.
      if (this.peek(0)!.kind !== SyntaxKind.RightParenthesis) {
        args.push(this.consume(SyntaxKind.Comma));
      }
      if (this.idx === start) {
        this.nextToken();
      }
    }
    const rightParen = this.consume(SyntaxKind.RightParenthesis);
    // call expressions can be the target of a property access.
    const callExpr = new CallExpression(callee, leftParen, args, rightParen);
    if (this.current.kind === SyntaxKind.Dot) {
      const dot = this.nextToken();
      const property = this.parseIdentifierExpression();
      return new PropertyAccessExpression(callExpr, dot, property);
    }
    return callExpr;
  }

  private parseListAccessExpression(): ListAccessExpression {
    const array = this.parseIdentifierExpression();
    const leftBracket = this.consume(SyntaxKind.LeftBracket);
    const pipe = this.consume(SyntaxKind.Pipe);
    const index = this.parseExpression();
    const rightBracket = this.consume(SyntaxKind.RightBracket);
    return new ListAccessExpression(
      array,
      leftBracket,
      pipe,
      index,
      rightBracket,
    );
  }

  private parseMapAccessExpression(): MapAccessExpression {
    const map = this.parseIdentifierExpression();
    const leftBracket = this.consume(SyntaxKind.LeftBracket);
    const questionMark = this.consume(SyntaxKind.QuestionMark);
    const key = this.parseStringLiteral();
    const rightBracket = this.consume(SyntaxKind.RightBracket);
    return new MapAccessExpression(
      map,
      leftBracket,
      questionMark,
      key,
      rightBracket,
    );
  }

  private parseGridAccessExpression(): GridAccessExpression {
    const grid = this.parseIdentifierExpression();
    const leftBracket = this.consume(SyntaxKind.LeftBracket);
    const hash = this.consume(SyntaxKind.Hash);
    const firstIndex = this.parseExpression();
    const comma = this.consume(SyntaxKind.Comma);
    const secondIndex = this.parseExpression();
    const rightBracket = this.consume(SyntaxKind.RightBracket);
    return new GridAccessExpression(
      grid,
      leftBracket,
      hash,
      firstIndex,
      comma,
      secondIndex,
      rightBracket,
    );
  }

  private parseArrayAccessExpression(): ArrayAccessExpression {
    const array = this.parseIdentifierExpression();
    const leftBracket = this.consume(SyntaxKind.LeftBracket);
    const at = this.consume(SyntaxKind.At);
    const indices: SyntaxNode[] = [];
    while (this.current.kind !== SyntaxKind.RightBracket && !this.atEnd) {
      const start = this.idx;
      const arg = this.parseExpression();
      indices.push(arg);
      // if we haven't reached the right hand bracket,
      // there must be a comma before we can parse the next arg.
      if (this.peek(0)!.kind !== SyntaxKind.RightBracket) {
        indices.push(this.consume(SyntaxKind.Comma));
      }
      if (this.idx === start) {
        this.nextToken();
      }
    }
    const rightBracket = this.consume(SyntaxKind.RightBracket);
    return new ArrayAccessExpression(
      array,
      leftBracket,
      at,
      indices,
      rightBracket,
    );
  }

  private parseArrayIndexExpression(): ArrayIndexExpression {
    const array = this.parseIdentifierExpression();
    const leftBracket = this.consume(SyntaxKind.LeftBracket);
    const indices: SyntaxNode[] = [];
    while (this.current.kind !== SyntaxKind.RightBracket && !this.atEnd) {
      const start = this.idx;
      const arg = this.parseExpression();
      indices.push(arg);
      // if we haven't reached the right hand bracket,
      // there must be a comma before we can parse the next arg.
      if (this.peek(0)!.kind !== SyntaxKind.RightBracket) {
        indices.push(this.consume(SyntaxKind.Comma));
      }
      if (this.idx === start) {
        this.nextToken();
      }
    }
    const rightBracket = this.consume(SyntaxKind.RightBracket);
    return new ArrayIndexExpression(
      array,
      leftBracket,
      indices,
      rightBracket,
    );
  }

  private parseIdentifierExpression(): IdentifierExpression {
    const identifier = this.consume(SyntaxKind.Identifier);
    return new IdentifierExpression(identifier);
  }

  private peek(n: number): SyntaxToken | undefined {
    if (this.idx + n < this.tokens.length) {
      return this.tokens[this.idx + n];
    } else {
      return undefined;
    }
  }

  private consume(kind: SyntaxKind): SyntaxToken {
    if (this.current.kind === kind) {
      return this.nextToken();
    } else {
      this.diagnostics.reportUnexpectedToken(kind, this.current);
      return new SyntaxToken(
        kind,
        new TextSpan(this.current.span.start, 0),
        '',
      );
    }
  }

  private nextToken(): SyntaxToken {
    if (this.idx < this.tokens.length) {
      return this.tokens[this.idx++];
    } else {
      return this.tokens[this.tokens.length - 1];
    }
  }
}
