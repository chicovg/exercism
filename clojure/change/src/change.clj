(ns change)

(defn- next-change
  [{:keys [value change coins]}]
  (for [c (reverse (sort coins))
        :when (and c (<= c value))
        :let  [n (int (Math/floor (/ value c)))
               a (* n c)]]
    {:value  (- value a)
     :change (concat (repeat n c) change)
     :coins  (disj coins c)}))

(defn- change-seq
  [xs]
  (when (not-empty xs)
    (lazy-cat xs (change-seq (mapcat next-change xs)))))

(defn issue
  [value coins]
  (or
   (->> (change-seq [{:value  value
                      :change []
                      :coins  coins}])
        (filter (comp zero? :value))
        (sort-by (comp count :change))
        first
        :change)
   (throw (IllegalArgumentException. "cannot change"))))
