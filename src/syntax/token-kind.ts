export enum TokenKind {
  EOF,
  Unknown,

  LineComment,
  BlockComment,

  // literals
  IntLiteral,
  RealLiteral,
  HexLiteral,

  StringLiteral,

  Identifier,

  TrueLiteral,
  FalseLiteral,

  // misc
  Dot,
  Semicolon,
  Comma,
  Bang,
  QuestionMark,
  Hash,

  // variables
  Equals,
  PlusEquals,
  MinusEquals,

  // arithmetic
  Plus,
  PlusPlus,
  Minus,
  MinusMinus,
  Star,
  Slash,

  // comparison
  LessThan,
  LessThanEquals,
  EqualsEquals,
  BangEquals,
  GreaterThan,
  GreaterThanEquals,

  // bitwise
  Ampersand,
  Pipe,
  AmpersandAmpersand,
  PipePipe,
  Caret,
  LessThanLessThan,
  GreaterThanGreaterThan,
  Tilde,

  // parens
  LeftParenthesis,
  RightParenthesis,
  LeftCurlyBracket,
  RightCurlyBracket,
  LeftBracket,
  RightBracket,

  // keywords
  Var,
  Mod,
  Div,

  If,
  Else,

  Repeat,

  While,

  Do,
  Until,

  For,
  Continue,

  Switch,
  Case,
  Break,
  Default,

  Exit,

  With,
}
