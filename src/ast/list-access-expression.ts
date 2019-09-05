import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { IdentifierExpression } from './identifier-expression';
import { IntLiteralExpression } from './int-literal-expression';

export class ListAccessExpression extends ExpressionSyntax {
  kind = SyntaxKind.ListAccessExpression;
  children = [
    this.array,
    this.leftBracket,
    this.pipe,
    this.index,
    this.rightBracket,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly array: IdentifierExpression,
    readonly leftBracket: SyntaxToken,
    readonly pipe: SyntaxToken,
    readonly index: IntLiteralExpression,
    readonly rightBracket: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
