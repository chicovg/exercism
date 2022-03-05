(ns binary-search)

(defn middle
  ([v]
   (middle 0 (count v)))
  ([lo hi]
   (int (/ (+ lo hi) 2))))

(defn search-for
  ([n v]
   (search-for n (vec (sort v)) 0 (count v)))
  ([n v lo hi]
   (let [mi (middle lo hi)
         m  (and
             (>= mi lo)
             (< mi hi)
             (get v mi))]
     (cond
       (not m) (throw (Exception. "not found"))
       (< n m) (search-for n v lo mi)
       (> n m) (search-for n v (inc mi) hi)
       ;; n = m
       :else mi))))
