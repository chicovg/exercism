(ns isogram
  (:require [clojure.string :as str]))

(defn isogram? [s]
  (loop [[c & rest] (str/lower-case s)
         seen       #{}]
    (cond
      (nil? c)
      true

      (seen c)
      false

      (Character/isAlphabetic (int c))
      (recur rest (conj seen c))

      :else
      (recur rest seen))))
