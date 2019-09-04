import { TextSpan } from './text-span';
import { TriviaKind } from './trivia-kind';

export class Trivia {
  constructor(
    /**
     * The kind of this trivia.
     */
    readonly kind: TriviaKind,
    /**
     * The span of this trivia.
     */
    readonly span: TextSpan,
    /**
     * The value of this trivia.
     */
    readonly value: string,
  ) { }
}
