(ns rotational-cipher)

(defn- rotate-with-offset
  [rotation offset code-point]
  (-> code-point
      (- offset)
      (+ rotation)
      (mod 26)
      (+ offset)))

(defn- rotate-code-point
  [rotation code-point]
  (condp <= code-point
    123 code-point
    97 (rotate-with-offset rotation 97 code-point)
    65 (rotate-with-offset rotation 65 code-point)
    code-point))

(defn rotate [phrase rotation]
  (->> phrase
       (map (comp char
                  (partial rotate-code-point rotation)
                  int))
       (apply str)))
