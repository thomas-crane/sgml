import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxNode } from '../syntax/syntax-node';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';

export class ArrayIndexExpression extends ExpressionSyntax {
  kind = SyntaxKind.ArrayIndexExpression;
  children = [
    this.array,
    this.leftBracket,
    ...this.indices,
    this.rightBracket,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly array: ExpressionSyntax,
    readonly leftBracket: SyntaxToken,
    readonly indices: SyntaxNode[],
    readonly rightBracket: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
