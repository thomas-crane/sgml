import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';

export class ParenthesisedExpression extends ExpressionSyntax {
  kind = SyntaxKind.ParenthesisedExpression;
  children = [
    this.leftParen,
    this.expression,
    this.rightParen,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly leftParen: SyntaxToken,
    readonly expression: ExpressionSyntax,
    readonly rightParen: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
