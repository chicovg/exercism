"""Functions for determining the optimal tree house location forest."""


def saddle_points(matrix):
    """
    Given a matrix, find all the points with the max row and min col value.

    :matrix - list(list(int)) - a two dimensional array representing a forest

    The potential tree house spots are points where the value is the greatest
    value in a particular row and the smallest value in a particular column.
    If no spots are found, an exception is raised.
    """
    if any(row for row in matrix if len(row) != len(matrix[0])):
        raise ValueError("irregular matrix")

    row_max = {}
    col_min = {}

    for r in range(len(matrix)):
        for c in range(len(matrix[r])):
            val = matrix[r][c]
            row_max[r] = max(val, row_max.get(r, val))
            col_min[c] = min(val, col_min.get(c, val))

    return [{"row": r + 1, "column": c + 1}
            for r in range(len(matrix))
            for c in range(len(matrix[r]))
            if matrix[r][c] == row_max[r] and matrix[r][c] == col_min[c]]
