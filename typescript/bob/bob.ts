export function hey(message: string): string {
  let trimmed = message.trim();

  if (trimmed.match(/.*\?$/) && trimmed.match(/[A-Z]+/) && trimmed.match(/^[^a-z]+$/)) {
    return 'Calm down, I know what I\'m doing!';
  } else if (trimmed.match(/.*\?$/)) {
    return 'Sure.';
  } else if (trimmed.match(/[A-Z]+/) && trimmed.match(/^[^a-z]+$/)) {
    return 'Whoa, chill out!'
  } else if (trimmed.match(/^[^\w]*$/)) {
    return 'Fine. Be that way!';
  } else {
    return 'Whatever.';
  }
}
