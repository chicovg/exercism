(ns poker
  (:require [clojure.string :as str]))

(defn- parse-hand
  [hand-str]
  (map #(let [v (apply str (butlast %))
              s (last %)]
          [v s])
       (str/split hand-str #" ")))

(defn- value->rank
  [value]
  (case value
    "J"       11
    "Q"       12
    "K"       13
    "A"       14
    (Integer/parseInt value)))

(defn- ->card
  [[value suit]]
  {:value value
   :rank  (value->rank value)
   :suit  suit})

(defn- hand-rank
  "Given a hand, returns a vector with ranking info in the following format:
   [hand-type-rank (1-9), tie breaker card rank, all card ranks]"
  [cards]
  (let [suits        (->> cards (map :suit) distinct count)
        ranks        (->> cards (map :rank) sort reverse)
        rank-freqs   (frequencies ranks)
        freq->rank   (zipmap (vals rank-freqs)
                             (keys rank-freqs))
        rank-counts  (->> rank-freqs vals sort vec)
        min-rank     (last ranks)
        straight?    (= (range min-rank (+ min-rank 5))
                        (reverse ranks))]
    (vec
     (cond
       ;; straight flush
       (and (= 1 suits) straight?)
       (concat [9 0] ranks)

       ;; four of a kind, tiebreaker: quad value
       (= [1 4] rank-counts)
       (concat [8 (get freq->rank 4)] ranks)

       ;; full house, tiebreaker: triplet value
       (= [2 3] rank-counts)
       (concat [7 (get freq->rank 3)] ranks)

       ;; flush
       (= suits 1)
       (concat [6 0] ranks)

       ;; straight
       straight?
       (concat [5 0] ranks)

       ;; ace-low/wheel straight
       (= ranks [14 5 4 3 2])
       (concat [5 0 5 4 3 2 1])

       ;; three of a kind
       (= [1 1 3] rank-counts)
       (concat [4 0] ranks)

       ;; two pair
       (= [1 2 2] rank-counts)
       (concat [3 0] ranks)

       ;; one pair
       (= [1 1 1 2] rank-counts)
       (concat [2 0] ranks)

       ;; high card
       :else
       (concat [1 0] ranks)))))

(defn- set-hand-rank
  [hand]
  (assoc hand :rank (hand-rank (:cards hand))))

(defn- pick-winners
  [hands]
  (let [winner        (last hands)
        other-winners (filter #(= (:rank winner) (:rank %))
                                  (butlast hands))]
    (cons winner other-winners)))

(defn- unparse-hand
  [{cards :cards}]
  (str/join " "
            (mapv (fn [{:keys [suit value]}]
                    (str value suit))
                  cards)))

(defn best-hands [hands]
  (->> hands
       (map parse-hand)
       (map #(map ->card %))
       (map #(hash-map :cards %))
       (map set-hand-rank)
       (sort-by :rank)
       pick-winners
       (mapv unparse-hand)))

