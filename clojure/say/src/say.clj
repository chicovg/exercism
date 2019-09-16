(ns say
  (:require [clojure.java.shell :refer [sh]]))

(defn out-of-range
  [num]
  (throw (IllegalArgumentException. (str "number out of range: " num))))

(def text {1 "one"
           2 "two"
           3 "three"
           4 "four"
           5 "five"
           6 "six"
           7 "seven"
           8 "eight"
           9 "nine"
           10 "ten"
           11 "eleven"
           12 "twelve"
           13 "thirteen"
           20 "twenty"
           30 "thirty"
           40 "forty"
           50 "fifty"
           60 "sixty"
           70 "seventy"
           80 "eighty"
           90 "ninety"
           100 "hundred"
           1000 "thousand"
           1000000 "million"
           1000000000 "billion"})

(defn upper-teens
  [num]
  (let [over-ten (- num 10)]
    (str (get text over-ten) "teen")))

(defn double-digits
  [num]
  (let [tens (* (int (/ num 10)) 10)
        remainder (- num tens)]
    (cond
      (= 0 tens) (get text remainder)
      (= 0 remainder) (get text tens)
      :else (str (get text tens) "-" (get text remainder)))))

(defn factor
  [num]
  (first
   (filter #(<= % num) [1000000000000
                        1000000000
                        1000000
                        1000
                        100])))

(defn number
  "Given a number from 0 to 999,999,999,999, spells out the number in English"
  [num]
  (cond
    (or
     (< num 0)
     (> num 999999999999)) (out-of-range num)
    (= 0 num) "zero"
    (< num 14) (get text num)
    (< num 20) (upper-teens num)
    (< num 100) (double-digits num)
    :else (let [div (factor num)
                quot (int (/ num div))
                remainder (mod num div)
                div-text (get text div)]
            (if (= remainder 0)
              (str (number quot) " " div-text)
              (str (number quot) " " div-text " " (number remainder))))))
