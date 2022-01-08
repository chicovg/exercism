(ns secret-handshake)

(def events [[1 "wink"]
             [2 "double blink"]
             [4 "close your eyes"]
             [8 "jump"]])

(defn- has-digit?
  [num n]
  (pos? (bit-and num n)))

(defn- reverse-on-16
  [num commands]
  (if (has-digit? num 16)
    (reverse commands)
    commands))

(defn commands [num]
  (->> events
       (filter (fn [[n _]]
                 (has-digit? num n)))
       (map second)
       (reverse-on-16 num)))
