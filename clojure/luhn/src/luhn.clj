(ns luhn
  (:require [clojure.string :as str]))

(defn valid? [txt]
  (cond
    (re-find #"[^0-9\s]" txt)
    false

    (= "0" (str/trim txt))
    false

    :else
    (let [sum (->> txt
                   (re-seq #"[0-9]")
                   (map #(Integer/parseInt %))
                   reverse
                   (map-indexed #(if (odd? %1)
                                   (* 2 %2)
                                   %2))
                   (map #(if (> % 9)
                           (- % 9)
                           %))
                   (apply +))]
      (zero? (mod sum 10)))))
