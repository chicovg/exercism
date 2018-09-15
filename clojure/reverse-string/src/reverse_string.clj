(ns reverse-string)

(defn swap
      ([] "")
      ([a] (str a))
      ([a b] (str b a)))

(defn reverse-string
      [s]
      (reduce swap s))

