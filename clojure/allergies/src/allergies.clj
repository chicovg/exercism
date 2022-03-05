(ns allergies)

(def foods
  {:eggs         1
   :peanuts      2
   :shellfish    4
   :strawberries 8
   :tomatoes     16
   :chocolate    32
   :pollen       64
   :cats         128})

(defn allergic-to? [score food]
  (pos? (bit-and (get foods food 0) score)))

(defn allergies [score]
  (for [food  (keys foods)
        :when (allergic-to? score food)]
    food))
