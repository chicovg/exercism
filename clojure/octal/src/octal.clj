(ns octal)

(defn- char->int
  [c]
  (- (int c) (int \0)))

(defn to-decimal [octal]
  (if (some #(> (int %) (int \7)) octal)
    0
    (->> octal
         (map char->int)
         reverse
         (zipmap (iterate (partial * 8) 1))
         (map (partial apply *))
         (reduce +))))
