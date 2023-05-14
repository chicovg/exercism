string[] numerals = ["M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"];
int[] values = [1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1];

# Convert an integer to a Roman number.
#
# + number - the integer to convert
# + return - the Roman number as a string
function roman(int number) returns string {
    int n = number;
    int num_idx = 0;
    string output = "";

    while num_idx < numerals.length() {
        if n >= values[num_idx] {
            n = n - values[num_idx];
            output = output + numerals[num_idx];
         } else {
            num_idx = num_idx + 1;
         }
    }

    return output;
}
