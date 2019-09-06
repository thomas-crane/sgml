import { SyntaxNode } from './syntax-node';

export class TextSpan {
  /**
   * "Flattens" the array of syntax nodes into a single text span
   * which represents the same span all of the syntax nodes.
   * @param spans The spans to flatten.
   */
  static flattenNodes(spans: SyntaxNode[]) {
    if (spans.length === 0) {
      return new TextSpan(0, 0);
    }
    const first = spans[0];
    const last = spans[spans.length - 1];
    return new TextSpan(
      first.span.start,
      first.span.start + last.span.start + last.span.length,
    );
  }
  constructor(
    /**
     * The start index of this text span.
     */
    readonly start: number,
    /**
     * The length of this text span.
     */
    readonly length: number,
  ) { }
}
