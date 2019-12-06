(ns clock)

(defn clock->string
  [{:keys [hours minutes]}]
  (format "%02d:%02d" hours minutes))

(defn clock [hours minutes]
  (let [all-mins (-> hours
                     (* 60)
                     (+ minutes))]
    {:hours (-> all-mins
                (mod 1440)
                (quot 60))
     :minutes (mod all-mins 60)}))

(defn add-time
  [{:keys [hours minutes]} time]
  (clock hours (+ minutes time)))
