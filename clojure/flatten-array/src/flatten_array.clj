(ns flatten-array)

(defn flatten [arr] ;; <- arglist goes here
  (cond
    (nil? arr)       []
    (not (seqable? arr)) [arr]
    :else (mapcat flatten arr)))
