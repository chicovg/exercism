(ns hexadecimal
  (:require [clojure.string :as str]))

(defn- hex-char->int
  [c]
  (case c
    (\0 \1 \2 \3 \4 \5 \6 \7 \8 \9) (- (int c) 48)
    (\A \B \C \D \E \F) (- (int c) 55)
    (\a \b \c \d \e \f) (- (int c) 87)
    -1))

(defn hex-to-int [s]
  (loop [hex-str s
         multp   1
         sum     0]
    (if (empty? hex-str)
      sum
      (let [char-val (hex-char->int (last hex-str))]
        (if (neg? char-val)
          0
          (recur (butlast hex-str)
                 (* 16 multp)
                 (+ sum
                    (* multp
                       char-val))))))))

