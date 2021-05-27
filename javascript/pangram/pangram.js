export const isPangram = (string) => {
    const isLetter = /[A-Za-z]/;

    let set = new Set();

    for (let char of string) {
        if (set.size === 26) {
            break;
        }

        if (!isLetter.test(char)) {
            continue;
        }

        set.add(char.toLowerCase());
    }

    return set.size === 26;
};
