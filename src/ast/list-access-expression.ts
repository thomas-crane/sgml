import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';

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
    readonly array: ExpressionSyntax,
    readonly leftBracket: SyntaxToken,
    readonly pipe: SyntaxToken,
    readonly index: ExpressionSyntax,
    readonly rightBracket: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
