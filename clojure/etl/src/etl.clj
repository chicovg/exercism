(ns etl
  (:require [clojure.string :as str]))

(defn transform [source]
  (->> source
       (map (fn [[k values]]
              (reduce #(assoc %1 (str/lower-case %2) k)
                      {}
                      values)))
       (apply merge)))
