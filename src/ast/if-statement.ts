import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { ExpressionSyntax } from './expression-syntax';
import { StatementSyntax } from './statement-syntax';

export class IfStatement extends StatementSyntax {
  kind = SyntaxKind.IfStatement;
  children = [
    this.ifToken,
    this.condition,
    this.thenBlock,
    this.elseToken!,
    this.elseBlock!,
  ].filter((child) => child !== undefined);
  span = TextSpan.flattenNodes(this.children);

  constructor(
    readonly ifToken: SyntaxToken,
    readonly condition: ExpressionSyntax,
    readonly thenBlock: StatementSyntax,
    readonly elseToken: SyntaxToken | undefined,
    readonly elseBlock: StatementSyntax | undefined,
  ) {
    super();
    this.children.forEach((child) => {
      child.parent = this;
    });
  }
}
