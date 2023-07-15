def sum_of_multiples(limit, multiples):
    all_multiples = set()

    for m in multiples:
        if m == 0:
            all_multiples.add(0)
        else:
            all_multiples.update(range(m, limit, m))

    return sum(all_multiples)
