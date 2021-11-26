(ns raindrops)

(defn convert [num]
  (cond-> nil
    (zero? (mod num 3))
    (str "Pling")

    (zero? (mod num 5))
    (str "Plang")

    (zero? (mod num 7))
    (str "Plong")

    true
    (or (str num))))
