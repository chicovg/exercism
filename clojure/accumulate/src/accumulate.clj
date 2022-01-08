(ns accumulate)

(defn accumulate [operation coll]
  (loop [[h & rest] coll
         new        []]
    (if-not h
      new
      (recur rest (conj new (operation h))))))
