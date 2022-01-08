(ns trinary)

(defn char->int
  [c]
  (- (int c)
     48))

(defn to-decimal
  [trinary]
  (if (not-every? #{\0 \1 \2} trinary)
    0
    (loop [[c & rest] (reverse trinary)
           sum        0
           mtpl       1]
      (if (nil? c)
        sum
        (recur rest
               (-> c char->int (* mtpl) (+ sum))
               (* mtpl 3))))))
