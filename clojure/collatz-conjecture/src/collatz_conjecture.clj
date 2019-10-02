(ns collatz-conjecture)

(defn collatz [num]
  (if (< num 1)
    (throw (IllegalArgumentException. "Invalid number"))
    (->> num
       (iterate #(if (odd? %)
                   (+ (* 3 %) 1)
                   (/ % 2)))
       (take-while #(> % 1))
       count)))
