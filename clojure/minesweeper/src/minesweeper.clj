(ns minesweeper
  (:require [clojure.string :as str]))

(def line-separator (System/getProperty "line.separator"))
(def mine "*")

(defn- ->2d-vector
  [board]
  (->> (str/split-lines board)
       (mapv #(str/split % #""))
       (mapv #(filterv not-empty %))))

(defn- ->board
  [v]
  (str/join line-separator (map #(apply str %) v)))

(defn- dimensions
  [board-2d-vec]
  {:rows (count board-2d-vec)
   :cols (count (first board-2d-vec))})

(defn- get-adjacent-coordinates
  [board-2d-vec r c]
  (let [{:keys
         [cols rows]} (dimensions board-2d-vec)
        min-r         (max 0 (dec r))
        max-r         (min (+ r 2) rows)
        min-c         (max 0 (dec c))
        max-c         (min (+ c 2) cols)]
    (for [r' (range min-r max-r)
          c' (range min-c max-c)
          :when (not (and (= r r')
                          (= c c')))]
      [r' c'])))

(defn- get-adjacent-mines-count
  [board-2d-vec r c]
  (->> (get-adjacent-coordinates board-2d-vec r c)
       (map #(get-in board-2d-vec %))
       (filter #(= mine %))
       count))

(defn- cell-val-with-mine-count
  [board-2d-vec r c]
  (let [current-val (get-in board-2d-vec [r c])]
    (if
     (= mine current-val) mine
     (let [adjacent-mines (get-adjacent-mines-count board-2d-vec r c)]
       (if (zero? adjacent-mines)
         " "
         (str adjacent-mines))))))

(defn draw [board]
  (let [board-2d-vec  (->2d-vector board)
        {:keys
         [cols rows]} (dimensions board-2d-vec)
        new-vals      (for [r (range rows)
                            c (range cols)]
                        (cell-val-with-mine-count board-2d-vec r c))
        new-2d-coll   (partition cols new-vals)]
    (->board new-2d-coll)))
