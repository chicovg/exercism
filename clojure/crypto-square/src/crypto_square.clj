(ns crypto-square
  (:require [clojure.string :as str]))

(defn normalize-plaintext [text]
  (-> text
      str/lower-case
      (str/replace #"[^0-9a-z]" "")))

(defn- rectangle
  [text]
  (let [text-size (count text)]
    (first
     (for [c (range text-size)
           r (range text-size)
           :when (and (>= (* r c) text-size)
                      (>= c r)
                      (<= (- c r) 1))]
       {:c c
        :r r}))))

(def square-size (comp :c rectangle))

(defn plaintext-segments [text]
  (let [normalized-text (normalize-plaintext text)
        size            (square-size normalized-text)]
    (->> (partition-all size normalized-text)
         (mapv #(apply str %)))))

(defn- interleave-all
  "A custom version of `interleave` which keeps 'extra' values when some collections are longer than others"
  [& colls]
  (loop [cs  colls
         out []]
    (let [items (filter identity (map first cs))]
      (if (empty? items)
        out
        (recur
         (map rest cs)
         (concat out items))))))

(defn ciphertext [text]
  (->> text
       plaintext-segments
       (apply interleave-all)
       (apply str)))

(defn normalize-ciphertext [text]
  (let [ct            (ciphertext text)
        {:keys [c r]} (rectangle ct)
        padding       (- (* c r) (count ct))]
    (loop [text           ct
           remaining-rows c
           out            []]
      (if (empty? text)
        (str/join " " out)
        (let [pad-row?     (and (pos? remaining-rows)
                                (<= remaining-rows padding))
              chunk-length (if pad-row?
                             (dec r)
                             r)
              row          (cond-> (take chunk-length text)
                             pad-row?
                             (concat [" "]))]
          (recur (drop chunk-length text)
                 (dec remaining-rows)
                 (conj out (apply str row))))))))
