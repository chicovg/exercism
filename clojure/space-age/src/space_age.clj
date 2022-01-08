(ns space-age)

(defn on-earth
  [seconds]
  (/ seconds 31557600))

(defn on-planet
  [period seconds]
  (/ (on-earth seconds)
     period))

(def on-mercury
  (partial on-planet 0.2408467))

(def on-venus
  (partial on-planet 0.61519726))

(def on-mars
  (partial on-planet 1.8808158))

(def on-jupiter
  (partial on-planet 11.862615))

(def on-saturn
  (partial on-planet 29.447498))

(def on-uranus
  (partial on-planet 84.016846))

(def on-neptune
  (partial on-planet 164.79132))
