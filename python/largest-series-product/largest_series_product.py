def largest_product(series, size):
    """
    Given a sequence of digits, looks at sequences of adjacent digits contained
    within the input sequence and returns the largest product from those sequences.
    """
    if len(series) < size:
        raise ValueError("span must be smaller than string length")

    if not series.isdigit():
        raise ValueError("digits input must only contain digits")

    if not size > 0:
        raise ValueError("span must not be negative")

    max_product = 0

    for start in range(0, len(series) - size + 1):
        product = 1
        end = start + size
        for n in list(map(int, series[start:end])):
            product *= n

        max_product = max(product, max_product)

    return max_product
