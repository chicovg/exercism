(ns pangram
  (:require [clojure.string :as str]))

(defn pangram? [sentence]
  (->> sentence
       (str/lower-case)
       (re-seq #"[A-Za-z]")
       (set)
       (count)
       (= 26)))
