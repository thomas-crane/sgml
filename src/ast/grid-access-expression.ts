import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { IdentifierExpression } from './identifier-expression';

export class GridAccessExpression extends ExpressionSyntax {
  kind = SyntaxKind.GridAccessExpression;
  children = [
    this.array,
    this.leftBracket,
    this.hash,
    this.firstIndex,
    this.rightBracket,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly array: IdentifierExpression,
    readonly leftBracket: SyntaxToken,
    readonly hash: SyntaxToken,
    readonly firstIndex: ExpressionSyntax,
    readonly comma: SyntaxToken,
    readonly secondIndex: ExpressionSyntax,
    readonly rightBracket: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
