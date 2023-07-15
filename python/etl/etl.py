"""Functions for transforming 'grading' data."""

def transform(legacy_data):
    """
    Given a dict with values consisting of arrays of strings,
    inverts the map so that each value points back to it's key,
    ensures that the resulting dict keys are lowercase strings.

    :param legacy_data: dict - values must be arrays of strings.
    :return dict - the inverted dict.

    For example,
       {1: ["A", "b"], 3: [], 5: ["C"]} becomes:
       {"a": 1, "b": 1, "c": 5}.
    """
    return {
        v.lower(): k
        for k in legacy_data
        for v in legacy_data[k]
    }
