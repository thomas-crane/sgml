import { ExpressionSyntax } from '../ast/expression-syntax';
import { StatementSyntax } from '../ast/statement-syntax';
import { SyntaxKind } from '../syntax/syntax-kind';
import { SyntaxToken } from '../syntax/syntax-token';
import { TextSpan } from '../syntax/text-span';
import { Source } from '../text/source';
import { Diagnostic } from './diagnostic';
import { DiagnosticLevel } from './diagnostic-level';

export class DiagnosticBag {
  readonly reports: Diagnostic[];
  readonly source: Source;
  constructor(source: Source) {
    this.source = source;
    this.reports = [];
  }

  /**
   * Reports the presence of an unknown character which was
   * encountered when lexing some source code.
   * @param char The unknown character.
   */
  reportUnknownCharacter(char: SyntaxToken) {
    this.report(
      'Unknown character in source code.',
      char.span,
    );
  }

  /**
   * Reports the presence of an unexpected token which was
   * encountered when parsing some abstract syntax tree.
   * @param expected The expected type.
   * @param actual The actual token.
   */
  reportUnexpectedToken(expected: SyntaxKind, actual: SyntaxToken) {
    this.report(
      `Unexpected ${SyntaxKind[actual.kind]}. Expected ${SyntaxKind[expected]}`,
      actual.span,
    );
  }

  /**
   * Reports the presence of a statement which is not valid
   * in the context in which the statement appeared.
   * @param statement The statement which is out of context.
   */
  reportStatementOutOfContext(statement: StatementSyntax) {
    this.report(
      'This statement cannot appear in this context.',
      statement.span,
    );
  }

  /**
   * Reports the presence of an expression in a local declaration
   * list statement which is not supposed to appear in a local
   * declaration list statement.
   * @param expression The expression which is wrong.
   */
  reportWrongExprInDeclList(expression: ExpressionSyntax) {
    this.report(
      'A declaration list can only contain assignment expressions.',
      expression.span,
    );
  }

  private report(message: string, span: TextSpan, level: DiagnosticLevel = DiagnosticLevel.Error) {
    this.reports.push({
      source: this.source,
      message,
      span,
      level,
    });
  }
}
