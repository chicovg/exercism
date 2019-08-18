(ns isbn-verifier)

(defn isbn-to-digits [isbn]
  (->> isbn
       (re-seq #"[\dX]")
       (map #(if (= "X" %)
               10
               (Integer/parseInt %)))
       vec))

(defn isbn10? [digits]
  (loop [[head & rest] digits
         sum-1 0
         sum-2 0]
    (cond
      (nil? head) (= (mod sum-2 11) 0)
      (and (= 10 head) (not-empty rest)) false
      :else (recur rest (+ sum-1 head) (+ sum-1 sum-2 head)))))

(defn isbn13-sum [digits]
  (->> digits
       (map-indexed #(if (even? %)
                       %2
                       (* %2 3)))
       (reduce + 0)))

(defn isbn13? [digits]
  (let [sum (isbn13-sum digits)]
    (= 0 (mod sum 10))))

(defn isbn? [isbn]
  (let [digits (isbn-to-digits isbn)
        digit-count (count digits)]
    (cond
      (= digit-count 10) (isbn10? digits)
      (= digit-count 13) (isbn13? digits)
      :else false)))

(defn isbn13-check-digit [sum]
  (let [mod-10 (mod sum 10)]
    (if (zero? mod-10)
      0
      (- 10 mod-10))))

(defn create-isbn13 [isbn10]
  (if (not (isbn? isbn10))
    nil
    (let [prepended (str "978" isbn10)
          isbn-digits-without-check (pop (isbn-to-digits prepended))
          isbn-sum (isbn13-sum isbn-digits-without-check)
          check-digit (isbn13-check-digit isbn-sum)]
          (apply str (conj isbn-digits-without-check check-digit)))))
