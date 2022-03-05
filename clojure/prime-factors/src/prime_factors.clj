(ns prime-factors)

(defn- is-prime
  [n]
  (cond
    (zero? (mod n 2))
    (= n 2)
    (zero? (mod n 3))
    (= n 3)
    :else
    (loop [i    5
           step 4
           m    (inc (int (Math/sqrt n)))]
      (cond
        (>= i m) true
        (zero? (mod n i)) false
        :else
        (let [s (- 6 step)]
          (recur (+ i s) s m))))))

(defn of
  [num]
  (loop [n       num
         factors []
         factor  2]
    (cond
      (= n 1)
      factors

      (and
       (zero? (mod n factor))
       (is-prime factor))
      (recur (/ n factor)
             (conj factors factor)
             factor)

      :else
      (recur n
             factors
             (inc factor)))))
