(ns bank-account)

(defn open-account []
  (atom {::balance 0
         ::open?   true}))

(defn close-account [account]
  (swap! account assoc ::open? false))

(defn get-balance [account]
  (let [{::keys [balance open?]} @account]
    (when open? balance)))

(defn update-balance [account amount]
  (when (::open? @account)
    (swap! account update ::balance + amount)))
