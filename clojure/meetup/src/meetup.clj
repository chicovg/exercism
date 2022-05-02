(ns meetup
  (:import [java.time DayOfWeek LocalDate]))

(defn- day-of-week?
  [day-of-week date]
  (let [^DayOfWeek dow (.getDayOfWeek date)]
    (case day-of-week
      :monday    (= DayOfWeek/MONDAY dow)
      :tuesday   (= DayOfWeek/TUESDAY dow)
      :wednesday (= DayOfWeek/WEDNESDAY dow)
      :thursday  (= DayOfWeek/THURSDAY dow)
      :friday    (= DayOfWeek/FRIDAY dow)
      :saturday  (= DayOfWeek/SATURDAY dow)
      :sunday    (= DayOfWeek/SUNDAY dow))))

(defn- teenth?
  [kwd date]
  (if (= :teenth kwd)
    (#{13 14 15 16 17 18 19} (.getDayOfMonth date))
    true))

(defn- take-by-occurance
  [occurance coll]
  (case occurance
    :first  (first coll)
    :teenth (first coll)
    :second (second coll)
    :third  (nth coll 2)
    :fourth (nth coll 3)
    :last   (last coll)))

(defn- ->date-vector
  [date]
  [(.getYear date)
   (.getMonthValue date)
   (.getDayOfMonth date)])

(defn meetup [month year day-of-week occurance]
  (->> (LocalDate/of year month 1)
       (iterate #(.plusDays % 1))
       (take-while #(= month (.getMonthValue %)))
       (filter #(day-of-week? day-of-week %))
       (filter #(teenth? occurance %))
       (take-by-occurance occurance)
       ->date-vector))
