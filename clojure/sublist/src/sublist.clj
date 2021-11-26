(ns sublist
  (:require [clojure.string :as s]))

(defn classify [list1 list2]
  (let [str1 (s/join "." list1)
        str2 (s/join "." list2)]
    (cond
      (= str1 str2) :equal
      (s/includes? str1 str2) :superlist
      (s/includes? str2 str1) :sublist
      :else :unequal)))
