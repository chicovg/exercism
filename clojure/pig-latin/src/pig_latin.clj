(ns pig-latin
  (:require [clojure.string :as str]))

(defn- translate-word
  [word]
  (if-let [[_ beg end] (or
                        (re-find #"^(ch|qu|[^a|e|i|o|u]qu|thr|th|sch)(\w+)" word)
                        (re-find #"^(xr\w+|yt\w+)" word)
                        (re-find #"^([^a|e|i|o|u])(\w+)" word)
                        (re-find #"^([a|e|i|o|u]\w+)" word))]
    (str end beg "ay")
    word))

(defn translate [phrase]
  (->> (re-seq #"\w+" phrase)
       (map translate-word)
       (str/join " ")))
