(ns gigasecond
  (:import [java.time Instant]
           [java.time ZonedDateTime]
           [java.time ZoneId]))

(def gigasecond-millis
  (* 1000000000 1000))

(defn- field->string
  [val]
  (if (< val 10)
    (str 0 val)
    (str val)))

(defn- inst->fields
  [^Instant inst]
  (let [^ZonedDateTime dtm (.atZone inst (ZoneId/of "UTC"))]
    [(.getYear dtm)
     (.getMonthValue dtm)
     (.getDayOfMonth dtm)]))

(defn from [year month day]
  (-> (format "%d-%s-%sT00:00:00Z" year (field->string month) (field->string day))
      Instant/parse
      (.plusMillis gigasecond-millis)
      inst->fields))
