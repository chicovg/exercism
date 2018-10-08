(ns bob)

(defn response-for
      "Returns the appropriate responses from Bob the lackadaisical teenager."
      [s]
      (cond
        (re-find #"^[\s]*$" s) "Fine. Be that way!"
        (re-find #"^(?=.*[A-Z])[^a-z]*\?$" s) "Calm down, I know what I'm doing!"
        (re-find #"^(?=.*[A-Z])[^a-z]*$" s) "Whoa, chill out!"
        (re-find #"\?$" s) "Sure."
        :default "Whatever."))
