(ns nth-prime)

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

(defn nth-prime [n]
  (if (pos? n)
    (->> (iterate inc 2)
         (filter is-prime)
         (drop (dec n))
         first)
    (throw (IllegalArgumentException. "invalid value for n"))))
