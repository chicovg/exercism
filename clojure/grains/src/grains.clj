(ns grains)

(defn- grains-seq
  []
  (iterate #(* % 2N) 1N))

(defn square [n]
  (last (take n (grains-seq))))

(defn total []
  (reduce + (take 64 (grains-seq))))
