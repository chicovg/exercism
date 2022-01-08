(ns triangle)

(defn is-valid? [a b c]
  (and (every? pos? [a b c])
       (>= (+ a b) c)
       (>= (+ a c) b)
       (>= (+ b c) a)))

(defn equilateral? [a b c]
  (and (is-valid? a b c)
       (= a b c)))

(defn isosceles? [a b c]
  (and (is-valid? a b c)
       (or (= a b)
           (= a c)
           (= b c))))

(defn scalene? [a b c]
  (and (is-valid? a b c)
       (not (isosceles? a b c))))
