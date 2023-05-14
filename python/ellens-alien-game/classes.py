"""Solution to Ellen's Alien Game exercise."""


class Alien:
    """Create an Alien object with location x_coordinate and y_coordinate.

    Attributes
    ----------
    (class)total_aliens_created: int
    x_coordinate: int - Position on the x-axis.
    y_coordinate: int - Position on the y-axis.
    health: int - Amount of health points.

    Methods
    -------
    hit(): Decrement Alien health by one point.
    is_alive(): Return a boolean for if Alien is alive (if health is > 0).
    teleport(new_x_coordinate, new_y_coordinate): Move Alien object to new coordinates.
    collision_detection(other): Implementation TBD.
    """
    total_aliens_created = 0

    def __init__(self, x_coordinate, y_coordinate):
        """Initialize a new Alien with the given coordinates and 3 health."""
        self.x_coordinate = x_coordinate
        self.y_coordinate = y_coordinate
        self.health = 3
        Alien.total_aliens_created += 1

    def hit(self):
        """Decrement the alien's by one."""
        self.health -= 1

    def is_alive(self):
        """Return true is the aliens health is greater than zero."""
        return self.health > 0

    def teleport(self, x_coordinate, y_coordinate):
        """Update the alien's coordinates to the given values."""
        self.x_coordinate = x_coordinate
        self.y_coordinate = y_coordinate

    def collision_detection(self, _other):
        """Detect if this alien has collided with another."""
        pass


def new_aliens_collection(coordinates):
    """Given a list of coordinates returns a list of aliens."""
    return [Alien(coord[0], coord[1]) for coord in coordinates]
