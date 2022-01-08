(ns all-your-base)

(defn- digits->base-ten
  [digits base-from]
  (loop [dgts digits
         mul  1
         sum  0]
    (if (empty? dgts)
      sum
      (recur (butlast dgts)
             (* mul base-from)
             (+ sum (* mul (last dgts)))))))

(defn- base-ten->digits
  [num-base-ten base-to]
  (loop [num num-base-ten
         d   (->> 1
                  (iterate #(* base-to %))
                  (take-while #(<= % num))
                  (last))
         out []]
    (if (= 1 d)
      (conj out num)
      (let [dgt (int (/ num d))]
        (recur (- num (* dgt d))
               (/ d base-to)
               (conj out dgt))))))

(defn convert [base-from digits base-to]
  (cond
    (or
     (some neg? digits)
     (some #(>= % base-from) digits)
     (<= base-from 1)
     (<= base-to 1))
    nil

    (empty? digits)
    digits

    (every? zero? digits)
    [0]

    :else
    (-> digits
        (digits->base-ten base-from)
        (base-ten->digits base-to))))
