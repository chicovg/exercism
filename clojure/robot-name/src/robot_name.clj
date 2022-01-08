(ns robot-name)

(def robots (atom {}))

(defn- rand-char
  []
  (char (+ 65 (rand-int 26))))

(defn- rand-name
  []
  (str (rand-char)
       (rand-char)
       (rand-int 10)
       (rand-int 10)
       (rand-int 10)))

(defn- unique-name
  []
  (let [names (-> @robots
                  vals
                  set)]
    (->> (repeatedly rand-name)
         (drop-while (fn [name]
                       (contains? names name)))
         (first))))

(defn robot
  "Generate a 'robot', return the id."
  []
  (let [robot-id (gensym "robot")
        _        (swap! robots assoc robot-id (unique-name))]
    robot-id))

(defn robot-name
  "Given a robot id, return the name"
  [robot-id]
  (get @robots robot-id))

(defn reset-name
  "Given a robot id, reset the robot name, return the new name"
  [robot-id]
  (let [new-name (unique-name)
        _        (swap! robots assoc robot-id new-name)]
    new-name))
