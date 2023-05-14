public function isIsogram(string sentence) returns boolean { 
    boolean[26] letters = [];
    int[] codePoints = sentence.toLowerAscii().toCodePointInts();

    foreach int point in codePoints {
        if point >= 97 && point <= 122 {
            int letterIndx = point - 97;
            if letters[letterIndx] {
                return false;
            } else {
                letters[letterIndx] = true;
            }
        }
    }

    return true;
}
