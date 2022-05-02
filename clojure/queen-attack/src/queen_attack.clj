(ns queen-attack
  (:require [clojure.string :as str]))

(defn board-string [{:keys [b w]}]
  (apply str
         (for [r (range 8)]
           (str
            (str/join " "
                      (for [c (range 8)]
                        (cond (= b [r c]) \B
                              (= w [r c]) \W
                              :else \_)))
            "\n"))))

(defn- same-row? [[x1 _] [x2 _]]
  (= x1 x2))

(defn- same-col? [[_ y1] [_ y2]]
  (= y1 y2))

(defn- same-diagonal? [[x1 y1] [x2 y2]]
  (= (Math/abs (- x1 x2))
     (Math/abs (- y1 y2))))

(defn can-attack [{:keys [b w]}]
  (or (same-col? b w)
      (same-row? b w)
      (same-diagonal? b w)))
