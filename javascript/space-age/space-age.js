export const age = (planet, seconds) => {
    const yearValue = seconds / secondsInYear / earthYears[planet];

    return Number(yearValue.toFixed(2));
};

const secondsInYear = 3.15576e7;

const earthYears = {
    mercury: 0.2408467,
    venus: 0.61519726,
    earth: 1.0,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
};
