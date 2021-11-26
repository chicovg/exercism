(ns log-levels
  (:require [clojure.string :as str]))

(def log-line-regex #"^\[(ERROR|INFO|WARNING)\]:\s(.*)")

(defn- parse-log-line
  [s]
  (some->> s
           (re-find log-line-regex)
           (drop 1)))

(defn message
  "Takes a string representing a log line
   and returns its message with whitespace trimmed."
  [s]
  (-> s parse-log-line second str/trim))

(defn log-level
  "Takes a string representing a log line
   and returns its level in lower-case."
  [s]
  (-> s parse-log-line first str/lower-case))

(defn reformat
  "Takes a string representing a log line and formats it
   with the message first and the log level in parentheses."
  [s]
  (format "%s (%s)" (message s) (log-level s)))
