(ns series)

(defn slices
  "Given a string of digits, output all the contiguous substrings of
   length n in that string in the order that they appear."
  [string length]
  (loop [[_ & rest :as chars] string
         series []]
    (cond
      (zero? length) [""]
      (< (count chars) length) series
      :else (recur
              rest
              (conj series (apply str (take length chars)))))))

