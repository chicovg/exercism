"""
Functions for determining what to say when giving out an extra cookie from the two-fer one sale.
"""
def two_fer(name="you"):
    """Returns the phrase, 'one for you, one for me' customized with the given name.

    :param name: string - the name to use in the customized phrase, defaults to 'you' when not provided.
    :return: string - the customized phrase.
    """
    return f"One for {name}, one for me."
