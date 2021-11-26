/**
 * 'Two-fer' is short for 'two for one'.
 * Given an optional name this funstion returns the message:
 * One for (name), one for me.
 */

export function twoFer(name = 'you'): string {
  return `One for ${name}, one for me.`;
}
