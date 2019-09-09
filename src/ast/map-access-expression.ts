import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';

export class MapAccessExpression extends ExpressionSyntax {
  kind = SyntaxKind.MapAccessExpression;
  children = [
    this.map,
    this.leftBracket,
    this.questionMark,
    this.key,
    this.rightBracket,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly map: ExpressionSyntax,
    readonly leftBracket: SyntaxToken,
    readonly questionMark: SyntaxToken,
    readonly key: ExpressionSyntax,
    readonly rightBracket: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
