(ns armstrong-numbers)

(defn pow [x n]
  (loop [acc 1
         n n]
    (if (zero? n)
      acc
      (recur (* x acc) (dec n)))))

(defn armstrong? [num]
  (let [num-str (str num)
        digits (count num-str)]
    (->> num-str
         (map #(Character/digit % 10))
         (map #(pow % digits))
         (reduce +)
         (= num))))
