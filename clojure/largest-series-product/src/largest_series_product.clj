(ns largest-series-product)

(defn- char->int
  [c]
  (- (int c) (int \0)))

(defn largest-product [n ds]
  (cond
    (re-find #"[^0-9]" ds)
    (throw (IllegalArgumentException. "Invalid value given"))

    (> n (count ds))
    (throw (IllegalArgumentException. "Span cannot be longer than string"))

    (neg? n)
    (throw (IllegalArgumentException. "Span cannot be negative"))

    :else
    (let [ints (mapv char->int ds)]
      (loop [start 0
             end   n
             max-p 0]
        (if (> end (count ints))
          max-p
          (let [product (apply * (subvec ints start end))]
            (recur (inc start)
                   (inc end)
                   (max max-p product))))))))
