import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class CaseStatement extends StatementSyntax {
  kind = SyntaxKind.CaseStatement;
  children = [
    this.caseToken,
    this.expression,
    this.colon,
  ];
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly caseToken: SyntaxToken,
    readonly expression: ExpressionSyntax,
    readonly colon: SyntaxToken,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
