(ns rna-transcription)

(defn to-rna [dna]
  (->> dna
    (map #(condp = %
            \G \C
            \C \G
            \T \A
            \A \U
            (assert false (str "Invalid nucleotide " %))))
    (apply str "")))
