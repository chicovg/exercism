(ns isbn-verifier)

(defn isbn? [isbn]
  (let [digits (map #(if (= "X" %)
                           10
                           (Integer/parseInt %))
                        (re-seq #"[\dX]" isbn))
        digit-count (count digits)]
    (if (or (= 10 digit-count) (= 13 digit-count))
      (loop [[head & rest] digits
             sum 0
             multiplier digit-count]
        (cond
            (nil? head) (= (mod sum (inc digit-count)) 0)
            (and (= 10 head) (> multiplier 1)) false
            :else (recur rest (+ sum (* head multiplier)) (dec multiplier))))
      false)))
