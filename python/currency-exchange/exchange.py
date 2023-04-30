"""Functions for calculating currency exchange values."""

def exchange_money(budget, exchange_rate):
    """ Given an amount and an exchange rate, returns exchanged amount.

    :param budget: float - amount of money you are planning to exchange.
    :param exchange_rate: float - unit value of the foreign currency.
    :return: float - exchanged value of the foreign currency you can receive.
    """

    return budget / exchange_rate


def get_change(budget, exchanging_value):
    """ Given a total amount and an exchanging value, returns the difference between the two.

    :param budget: float - amount of money you own.
    :param exchanging_value: float - amount of your money you want to exchange now.
    :return: float - amount left of your starting currency after exchanging.
    """

    return budget - exchanging_value


def get_value_of_bills(denomination, number_of_bills):
    """ Given a denomination and a count of bills, returns the total value of the bills.

    :param denomination: int - the value of a bill.
    :param number_of_bills: int - amount of bills you received.
    :return: int - total value of bills you now have.
    """

    return denomination * number_of_bills


def get_number_of_bills(budget, denomination):
    """ Given an amount and a denomination, returns the number of whole bills that fit into the amount.

    :param budget: float - the amount of money you are planning to exchange.
    :param denomination: int - the value of a single bill.
    :return: int - number of bills after exchanging all your money.
    """

    return budget // denomination


def get_leftover_of_bills(budget, denomination):
    """ Given an amount and a denomination, returns the left over money after converting to the given denomination.

    :param budget: float - the amount of money you are planning to exchange.
    :param denomination: int - the value of a single bill.
    :return: float - the leftover amount that cannot be exchanged given the current denomination.
    """

    return budget - get_number_of_bills(budget, denomination) * denomination


def exchangeable_value(budget, exchange_rate, spread, denomination):
    """ Calculates the maximum amount of money you can get in an exchange given a total amount,
    an exchange rate, and exchange fee value, and a denomination.

    :param budget: float - the amount of your money you are planning to exchange.
    :param exchange_rate: float - the unit value of the foreign currency.
    :param spread: int - percentage that is taken as an exchange fee.
    :param denomination: int - the value of a single bill.
    :return: int - maximum value you can get.
    """

    spread_amount = exchange_rate * (spread / 100)
    exchanged_budget = exchange_money(budget, exchange_rate + spread_amount)
    num_bills = get_number_of_bills(exchanged_budget, denomination)

    return num_bills * denomination
