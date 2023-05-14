import ballerina/io;
# Returns the acronym of the given phrase.
#
# + phrase - a string
# + return - the acronym
function abbreviate(string phrase) returns string {
    string[] words = re `[\s-_]`.split(phrase);
    string acronym = "";

    foreach string word in words {
        if word.length() > 0 {
            acronym += word[0];
        }
    }

    io:println(acronym);
    return acronym.toUpperAscii();
}
