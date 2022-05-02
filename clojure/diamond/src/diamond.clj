(ns diamond)

(defn- next-row
  [row]
  (let [length   (count row)
        next-ltr (-> row
                     first
                     int
                     inc
                     char)]
    (concat [next-ltr]
            (repeat length \space)
            [next-ltr])))

(defn- pad-row
  [length row]
  (let [total-padding (- length (count row))
        padding-chars (repeat (/ total-padding 2) \space)]
    (concat padding-chars
            row
            padding-chars)))

(defn diamond [c]
  (let [c-idx          (-> c
                           int
                           (- 65))
        row-length     (-> c-idx
                           inc
                           (* 2)
                           dec)
        top-pyramid    (->> [\A]
                            (iterate next-row)
                            (map #(pad-row row-length %))
                            (take (inc c-idx))
                            (map #(apply str %)))
        bottom-pyramid (-> top-pyramid
                           butlast
                           reverse)]
    (concat top-pyramid bottom-pyramid)))
