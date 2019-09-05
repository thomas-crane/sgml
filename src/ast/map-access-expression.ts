import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { IdentifierExpression } from './identifier-expression';
import { StringLiteralExpression } from './string-literal-expression';

export class MapAccessExpression extends ExpressionSyntax {
  kind = SyntaxKind.MapAccessExpression;
  children = [
    this.array,
    this.leftBracket,
    this.questionMark,
    this.key,
    this.rightBracket,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly array: IdentifierExpression,
    readonly leftBracket: SyntaxToken,
    readonly questionMark: SyntaxToken,
    readonly key: StringLiteralExpression,
    readonly rightBracket: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
