(ns nucleotide-count)

(defn count [nucleotide strand]
  (if (some #{nucleotide} "ATCG")
    (get (nucleotide-counts strand) nucleotide)
    (throw (IllegalArgumentException. "Invalid nucleotide"))))

(defn nucleotide-counts [strand]
  (merge {\A 0 \T 0 \C 0 \G 0}
         (frequencies strand)))
