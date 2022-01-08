(ns roman-numerals)

(def nm->rnm [[1000 "M"]
              [900 "CM"]
              [500 "D"]
              [400 "CD"]
              [100 "C"]
              [90 "XC"]
              [50 "L"]
              [40 "XL"]
              [10 "X"]
              [9 "IX"]
              [8 "VIII"]
              [7 "VII"]
              [6 "VI"]
              [5 "V"]
              [4 "IV"]
              [1 "I"]])

(defn numerals [number]
  (loop [n                 number
         [[nm rnm] & rest] nm->rnm
         rn                nil]
    (if (or (<= n 0) (nil? nm))
      rn
      (let [q (int (/ n nm))]
        (if (pos? q)
          (recur (- n (* q nm))
                 rest
                 (str rn
                      (apply str (repeat q rnm))))
          (recur n
                 rest
                 rn))))))
