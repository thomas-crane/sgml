import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxNode } from '../syntax/syntax-node';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { IdentifierExpression } from './identifier-expression';

export class ArrayAccessExpression extends ExpressionSyntax {
  kind = SyntaxKind.ArrayAccessExpression;
  children = [
    this.array,
    this.leftBracket,
    this.at,
    ...this.indices,
    this.rightBracket,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly array: IdentifierExpression,
    readonly leftBracket: SyntaxToken,
    readonly at: SyntaxToken,
    readonly indices: SyntaxNode[],
    readonly rightBracket: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
