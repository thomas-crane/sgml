import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxNode } from '../syntax/syntax-node';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { IdentifierExpression } from './identifier-expression';

export class CallExpression extends ExpressionSyntax {
  kind = SyntaxKind.CallExpression;
  children = [
    this.callee,
    this.leftParen,
    ...this.args,
    this.rightParen,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly callee: IdentifierExpression,
    readonly leftParen: SyntaxToken,
    readonly args: SyntaxNode[],
    readonly rightParen: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
