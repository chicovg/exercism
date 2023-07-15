public function convert(int n) returns string {
    string result = "";

    if n % 3 == 0 {
        result = result + "Pling";
    }
    if n % 5 == 0 {
        result = result + "Plang";
    } 
    if n % 7 == 0 {
        result = result + "Plong";
    }

    return result.length() > 0 ? result : string `${n}`;
}
