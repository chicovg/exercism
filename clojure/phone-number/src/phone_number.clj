(ns phone-number
  (:require [clojure.string :as s]))

(defn number [num-string]
  (let [digits (s/replace num-string #"[^\d]" "")]
    (condp re-matches digits
      #"^[\d]{10}" digits
      #"^1[\d]{10}" (subs digits 1)
      "0000000000")))

(defn area-code [num-string]
  (subs (number num-string) 0 3))

(defn pretty-print [num-string]
  (let [n (number num-string)]
    (format "(%s) %s-%s" (subs n 0 3) (subs n 3 6) (subs n 6))))
