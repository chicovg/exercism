(ns dominoes)

(defn can-chain?
  ([dominoes] (can-chain? [] dominoes))
  ([[[c1 c2] & _ :as chain] [[d1 d2] & _ :as dominoes]]
   (cond
     (empty? dominoes) (if (empty? chain)
                         true
                         (= c1 (last (last chain))))
     (empty? chain) (can-chain? (cons [d2 d1] chain) (drop 1 dominoes))
     :else (some true?
                 (for [[a b] dominoes :when (or (= b c1) (= a c1))]
                   (let [remaining (remove #(= [a b] %) dominoes)]
                     (or
                      (can-chain? (cons [b a] chain) remaining)
                      (can-chain? (cons [a b] chain) remaining))))))))
