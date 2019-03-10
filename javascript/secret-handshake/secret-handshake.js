const keywords = ['wink', 'double blink', 'close your eyes', 'jump'];

export const secretHandshake = (num) => {
    if (typeof num != 'number') {
        throw 'Handshake must be a number';
    }

    let n = num;
    let matchingKeywords = keywords.filter((word, idx) => {
        return n & (1 << idx);
    });

    if (n & (1 << 4)) {
        matchingKeywords = matchingKeywords.reverse();
    }

    return matchingKeywords;
};

