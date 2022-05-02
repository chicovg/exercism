(ns go-counting
  (:require [clojure.set :as set]))

(defn- dimensions [grid]
  {:height (count grid)
   :width  (count (get grid 0))})

(defn- validate-coordinates [grid [x y]]
  (let [{:keys [height width]} (dimensions grid)]
    (when (or (neg? x)
              (>= x width)
              (neg? y)
              (>= y height))
      (throw (new IllegalArgumentException "Invalid coordinates")))))

(defn- neighbors [grid [x y]]
  (let [{:keys [height width]} (dimensions grid)]
    (cond-> []
      (pos? x)           (conj [(dec x) y])
      (pos? y)           (conj [x       (dec y)])
      (< x (dec width))  (conj [(inc x) y])
      (< y (dec height)) (conj [x       (inc y)]))))

(defn territory
  [grid coordinates]
  (validate-coordinates grid coordinates)
  (loop [[h & rest] [coordinates]
         stones     #{}
         owners     #{}
         visited    #{}]
    (if (nil? h)
      {:stones stones
       :owner  (when (not-empty stones)
                 (case owners
                   #{\B} :black
                   #{\W} :white
                   nil))}
      (let [val (get-in grid (reverse h))]
        (if (#{\B \W} val)
          (recur rest
                 stones
                 (conj owners val)
                 (conj visited h))
          (recur (concat rest (remove (fn [n]
                                        (visited n))
                                      (neighbors grid h)))
                 (conj stones h)
                 owners
                 (conj visited h)))))))

(defn territories [grid]
  (let [{:keys [height width]} (dimensions grid)]
    (loop [[h & rest] (for [x (range width)
                            y (range height)]
                        [x y])
           visited    #{}
           output     {:black-territory #{}
                       :white-territory #{}
                       :null-territory  #{}}]
      (cond
        (nil? h)
        output

        (visited h)
        (recur rest
               visited
               output)

        :else
        (let [{:keys [owner stones]} (territory grid h)
              territory-key          (case owner
                                       :black :black-territory
                                       :white :white-territory
                                       :null-territory)]
          (recur rest
                 (set/union visited stones)
                 (update output territory-key set/union stones)))))))
