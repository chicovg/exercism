(ns matching-brackets)

(defn- match? [open close]
  (case open
    \[ (= \] close)
    \( (= \) close)
    \{ (= \} close)
    true))

(defn valid? [s]
  (loop [[h & tail] s
         parens     []]
    (if (nil? h)
      (empty? parens)
      (case h
        (\[ \( \{)
        (recur tail (conj parens h))

        (\] \) \})
        (if-not (match? (last parens) h)
          false
          (recur tail (vec (butlast parens))))

        (recur tail parens)))))
