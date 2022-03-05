(ns binary-search-tree)

(def value :value)
(def left :left)
(def right :right)

(defn singleton [value]
  {:value value
   :left  nil
   :right nil})

(defn insert [new-value {:keys [value left right]}]
  (cond
    (nil? value)
    (singleton new-value)

    (<= new-value value)
    {:value value
     :left  (insert new-value left)
     :right right}

    :else ;; new-value < value
    {:value value
     :left  left
     :right (insert new-value right)}))

(defn to-list [{:keys [value left right]}]
  (concat
   (when left (to-list left))
   [value]
   (when right (to-list right))))


(defn from-list
  [[root & children]]
  (if
    (empty? children)
    (singleton root)

    (let [lt-root (filter #(<= % root) children)
          gt-root (filter #(> % root) children)]
      {:value root
       :left  (when (not-empty lt-root)
                (from-list lt-root))
       :right (when (not-empty gt-root)
                (from-list gt-root))})))
