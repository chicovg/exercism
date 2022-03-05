(ns perfect-numbers)

(defn- factors
  [num]
  (for [n (range 1 num)
        :when (zero? (mod num n))]
    n))

(defn classify [num]
  (when (neg? num)
    (throw (IllegalArgumentException. "negative numbers are not allowed")))
  (let [aliquot-sum (apply + (factors num))]
    (cond
      (< aliquot-sum num) :deficient
      (> aliquot-sum num) :abundant
      :else :perfect)))
