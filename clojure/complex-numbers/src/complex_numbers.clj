(ns complex-numbers)

(defn real [[a b]]
  a)

(defn imaginary [[a b]]
  b)

(defn abs [[a b]]
  (Math/sqrt (+ (Math/pow a 2) (Math/pow b 2))))

(defn conjugate [[a b]]
  [a (* -1 b)])

(defn add [[a b] [c d]]
  [(+ a c) (+ b d)])

(defn sub [[a b] [c d]]
  [(- a c) (- b d)])

(defn mul [[a b] [c d]]
  [(- (* a c) (* b d))
   (+ (* b c) (* a d))])

(defn div [[a b] [c d]] ;; <- arglist goes here
  [(/ (+ (* a c) (* b d))
      (+ (Math/pow c 2) (Math/pow d 2)))
   (/ (- (* b c) (* a d))
      (+ (Math/pow c 2) (Math/pow d 2)))])
