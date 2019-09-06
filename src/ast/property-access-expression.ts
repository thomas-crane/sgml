import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { IdentifierExpression } from './identifier-expression';

export class PropertyAccessExpression extends ExpressionSyntax {
  kind = SyntaxKind.PropertyAccessExpression;
  children = [
    this.target,
    this.dot,
    this.property,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly target: ExpressionSyntax,
    readonly dot: SyntaxToken,
    readonly property: IdentifierExpression,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
