(ns grade-school)

(defn grade [s g]
  (get s g []))

(defn add [s n g]
  (let [names (grade s g)]
    (assoc s g (conj names n))))

(defn sorted [s]
  (into (sorted-map)
        (map (fn [[key value]] [key (sort value)]) s)))
