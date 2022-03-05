(ns pascals-triangle)

(defn next-row
  [row]
  (vec
   (for [i (range -1 (count row))
         :let [j (inc i)]]
     (+ (get row i 0)
        (get row j 0)))))

(def triangle (iterate next-row [1N]))

(defn row [num]
  (first (drop (dec num) triangle)))
