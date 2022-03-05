(ns kindergarten-garden
  (:require [clojure.string :as str]))

(defn- name->keyword
  [n]
  (-> n
      str/lower-case
      keyword))

(defn- abbr->flower
  [abbr]
  (case abbr
    "C" :clover
    "G" :grass
    "R" :radishes
    "V" :violets))

(defn garden
  ([garden-string]
   (garden garden-string ["Alice" "Bob" "Charlie"
                          "David" "Eve" "Fred"
                          "Ginny" "Harriet" "Ileana"
                          "Joseph" "Kincaid" "Larry"]))
  ([garden-string students]
   (let [name-keys (sort (mapv name->keyword students))
         rows      (str/split-lines garden-string)]
     (->> rows
          (map #(str/split % #""))
          (map #(map abbr->flower %))
          (map #(partition-all 2 %))
          (map #(zipmap name-keys %))
          (apply merge-with concat)))))
