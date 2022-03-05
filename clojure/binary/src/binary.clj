(ns binary)

(defn to-decimal
  [binary-string]
  (->> binary-string
       reverse
       (map-indexed #(if (= %2 \1)
                       (int (Math/pow 2 %1))
                       0))
       (apply +)))
