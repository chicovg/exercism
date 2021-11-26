(ns bird-watcher)

(def last-week [0 2 5 3 7 8 4])

(def today last)

(defn inc-bird [birds]
  (conj (pop birds) (inc (last birds))))

(defn day-without-birds? [birds]
  (boolean (some zero? birds)))

(defn n-days-count [birds n]
  (apply + (take n birds)))

(defn busy-days [birds]
  (count (filter #(>= % 5) birds)))

(defn odd-week? [birds]
  (and (= 1 (last birds))
       (every? (fn [[a b]]
                 (and (= 1 a) (zero? b)))
               (partition 2 birds))))
