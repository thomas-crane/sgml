type MatchFunction = (str: string | undefined) => boolean;
export function match(regex: RegExp): MatchFunction {
  return (str) => {
    if (str === undefined) {
      return false;
    } else {
      return regex.test(str);
    }
  };
}
