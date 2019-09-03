(ns anagram
  (:require [clojure.string :as s]))

(defn is-same-length?
  [word prospect]
  (= (count word) (count prospect)))

(defn is-not-equal?
  [word prospect]
  (not (= (s/lower-case word) (s/lower-case prospect))))

(defn has-same-letters?
  [word prospect]
  (= (sort (s/lower-case word)) (sort (s/lower-case prospect))))

(defn anagrams-for
  [word prospect-list]
  (filter (every-pred (partial is-same-length? word)
                      (partial is-not-equal? word)
                      (partial has-same-letters? word))
          prospect-list))

;; Alternate implementation using thread last:
;; (defn anagrams-for
;;   [word prospect-list]
;;   (->> prospect-list
;;        (filter (partial is-same-length word))
;;        (filter (partial is-not-equal word))
;;        (filter (partial has-same-letters word))))
