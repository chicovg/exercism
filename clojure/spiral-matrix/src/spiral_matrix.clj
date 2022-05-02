(ns spiral-matrix)

(defn spiral [n]
  (let [m (volatile! (vec (repeat n (vec (repeat n 0)))))
        i (volatile! 0)]
    (loop [sr 0
           sc 0
           er (dec n)
           ec (dec n)]
      (cond
        (< er sr)
        @m

        (= er sr)
        (vswap! m assoc-in [sr sc] (vswap! i inc))

        :else
        (do
          (doseq [c (range sc ec)]
            (vswap! m assoc-in [sr c] (vswap! i inc)))
          (doseq [r (range sr er)]
            (vswap! m assoc-in [r ec] (vswap! i inc)))
          (doseq [c (range ec sc -1)]
            (vswap! m assoc-in [er c] (vswap! i inc)))
          (doseq [r (range er sr -1)]
            (vswap! m assoc-in [r sc] (vswap! i inc)))
          (recur (inc sr)
                 (inc sc)
                 (dec er)
                 (dec ec)))))))
