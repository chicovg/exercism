(ns hamming)

(defn distance [strand1 strand2]
  (if (not= (count strand1) (count strand2))
    nil
    (->> (interleave strand1 strand2)
         (partition 2)
         (filter #(let [[a b] %] (not= a b)))
         count)))