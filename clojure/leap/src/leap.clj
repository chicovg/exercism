(ns leap)

(defn- divisble-by?
  [div num]
  (zero? (mod num div)))

(defn leap-year? [year]
  (condp divisble-by? year
    400 true
    100 false
    4 true
    false))
