(ns run-length-encoding)

(defn run-length-encode
  "encodes a string with run-length-encoding"
  [plain-text]
  (->> (partition-by identity plain-text)
       (map #(if (> (count %) 1)
               (str (count %) (first %))
               (first %)))
       (apply str)))

(defn run-length-decode
  "decodes a run-length-encoded string"
  [cipher-text]
  (->> (re-seq #"[0-9]+[a-zA-Z\s]{1}|[a-zA-Z\s]{1}" cipher-text)
       (map #(if (> (count %) 1)
               (let [char-count (Integer/parseInt (apply str (drop-last %)))
                     repeated (apply str (repeat char-count (last %)))]
                 repeated)
               %))
       (apply str)))

