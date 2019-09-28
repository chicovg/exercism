(ns pov)

(defn root-to
  "Returns a path from the root to the given node"
  [to [root & children]]
  (cond
    (= to root) [root]
    (empty? children) []
    :else (first (for [child children
                       :let [path (root-to to child)]
                       :when (not-empty path)]
                   (vec (cons root path))))))

(defn path-from-to [from to tree]
  "Returns a path from one node to the other or nil if no path exists"
  (let [root-to-from (root-to from tree)
        root-to-to (root-to to tree)]
    (cond
      (or (empty? root-to-from) (empty? root-to-to)) nil
      (some #{to} root-to-from) (let [from-pos (.indexOf root-to-from from)
                                      to-pos (.indexOf root-to-from to)]
                                  (-> (subvec root-to-from to-pos (inc from-pos))
                                      reverse
                                      vec))
      (some #{from} root-to-to) (let [from-pos (.indexOf root-to-to from)
                                      to-pos (.indexOf root-to-to to)]
                                  (subvec root-to-to from-pos (inc to-pos)))
      :else (let [reversed-root-to-from (->> root-to-from
                                             (drop 1)
                                             reverse
                                             vec)]
              (into reversed-root-to-from root-to-to)))))

(defn of [from [root & children :as tree]]
  "Given a node and a tree, re-parents the graph on the provided node"
  (let [path (path-from-to root from tree)]
    (if (empty? path)
      nil
      (loop [[root & children] tree
             [_ next & rest] path
             pov-tree nil]
        (if (nil? root)
          pov-tree
          (let [children-off-path (for [[h & tail :as child] children
                                        :when (not (= h next))]
                                    child)
                child-on-path (->> children
                                   (filter #(= (first %) next))
                                   first)
                updated-pov-tree (-> [root]
                                     (concat children-off-path)
                                     (concat (if pov-tree [pov-tree] []))
                                     vec)]
            (recur child-on-path (cons next rest) updated-pov-tree)))))))
