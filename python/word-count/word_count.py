"""A module with functions for word counting."""
import re


def count_words(sentence):
    """Count the words in a the given sentence."""
    words = map(
        lambda s: s.strip("'"),
        re.split(
            r'[\s,_]',
            re.sub(r'[!&@$%^.:"]', '', sentence).lower()
        )
    )
    counts = {}

    for w in words:
        if w:
            counts[w] = counts.get(w, 0) + 1

    return counts
