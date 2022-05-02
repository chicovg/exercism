(ns sieve)

(defn sieve [n]
  (let [non-prime (set
                   (for [i (range 2 (inc n))
                         j (range (+ i i) (inc n) i)]
                     j))]
    (remove non-prime (range 2 (inc n)))))
