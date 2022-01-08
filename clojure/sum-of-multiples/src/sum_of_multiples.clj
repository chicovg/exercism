(ns sum-of-multiples)

(defn- multiples
  [limit]
  (fn [n]
    (take-while #(< % limit)
                (iterate #(+ % n) n))))

(defn sum-of-multiples
  [nums limit]
  (->> nums
       (mapcat (multiples limit))
       distinct
       (reduce +)))
