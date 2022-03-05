(ns atbash-cipher
  (:require [clojure.string :as str]))

(def letters
  "abcdefghijklmnopqrstuvwxyz")

(def numbers
  "0123456789")

(def encoding
  (zipmap (concat numbers letters)
          (concat numbers (reverse letters))))

(defn encode [text]
  (->> text
    str/lower-case
    (map #(get encoding %))
    (filter identity)
    (partition-all 5)
    (map #(apply str %))
    (interpose " ")
    (apply str)))
