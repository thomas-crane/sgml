import { SyntaxKind } from '../syntax/syntax-kind';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class ExpressionStatement extends StatementSyntax {
  kind = SyntaxKind.ExpressionStatement;
  children = [
    this.expression,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly expression: ExpressionSyntax,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
