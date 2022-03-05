(ns proverb
  (:require [clojure.string :as str]))

(def sentence-template
  "For want of a %s the %s was lost.")

(def last-sentence-template
  "And all for the want of a %s.")

(defn recite [words]
  (loop [[w1 w2 & rest] words
         sentences   []]
    (cond
      (nil? w1)
      ""

      (nil? w2)
      (format last-sentence-template w1)

      (empty? rest)
      (str/join "\n" (concat sentences
                             [(format sentence-template w1 w2)
                              (format last-sentence-template (first words))]))

      :else
      (recur (cons w2 rest) (conj sentences (format sentence-template w1 w2))))))
