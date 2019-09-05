import { HexLiteralExpression } from './hex-literal-expression';
import { IntLiteralExpression } from './int-literal-expression';
import { RealLiteralExpression } from './real-literal-expression';

export type NumberLiteralExpression
  = IntLiteralExpression
  | HexLiteralExpression
  | RealLiteralExpression
  ;
