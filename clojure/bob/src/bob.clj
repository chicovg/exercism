(ns bob)

(defn response-for
      "Returns the appropriate responses from Bob the lackadaisical teenager."
      [s]
      (condp re-find s
        #"^[\s]*$" "Fine. Be that way!"
        #"^(?=.*[A-Z])[^a-z]*\?$" "Calm down, I know what I'm doing!"
        #"^(?=.*[A-Z])[^a-z]*$" "Whoa, chill out!"
        #"\?$" "Sure."
        "Whatever."))