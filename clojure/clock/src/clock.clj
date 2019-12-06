(ns clock)

(defn clock->string
  [clock]
  (format "%02d:%02d" (quot clock 60) (mod clock 60)))

(defn within-day
  [minutes]
  (mod minutes 1440))

(defn clock [hours minutes]
  (-> hours
      (* 60)
      (+ minutes)
      (within-day)))

(defn add-time
  [clock time]
  (-> clock
      (+ time)
      (within-day)))
