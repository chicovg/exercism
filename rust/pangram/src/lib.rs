use std::collections::HashSet;

/// Determine whether a sentence is a pangram.
pub fn is_pangram(sentence: &str) -> bool {
    if sentence.len() == 0 {
        return false
    }

    let mut letters = HashSet::new();

    for c in sentence.to_lowercase().chars() {
        if c.is_ascii_alphabetic() {
            letters.insert(c);
        }
    }

    return letters.len() == 26;
}
