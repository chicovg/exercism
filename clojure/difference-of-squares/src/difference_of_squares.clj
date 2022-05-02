(ns difference-of-squares)

(defn- square
  [n]
  (* n n))

(defn sum-of-squares [n]
  (->> (range 1 (inc n))
       (map square)
       (reduce +)))

(defn square-of-sum [n]
  (->> (range 1 (inc n))
       (reduce +)
       square))

(defn difference [n]
  (Math/abs (- (square-of-sum n)
               (sum-of-squares n))))

