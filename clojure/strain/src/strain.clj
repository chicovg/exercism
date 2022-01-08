(ns strain)

(defn- filtered
  [pred coll]
  (loop [[h & rest] coll
         out        '[]]
    (cond
      (nil? h) out
      (pred h) (recur rest (conj out h))
      :else (recur rest out))))

(defn retain [pred coll]
  (filtered pred coll))

(defn discard [pred coll]
  (filtered (comp not pred) coll))
