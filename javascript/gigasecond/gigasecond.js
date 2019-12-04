export const gigasecond = date => new Date(date.valueOf() + GIGASECOND_IN_MILLIS);

const GIGASECOND_IN_MILLIS = 10 ** 12;
