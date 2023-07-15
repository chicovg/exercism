;;; robot-name.el --- Robot Name (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;;
;; Build a robot with a name like AA000, that can be reset
;; to a new name. Instructions are in README.md
;;


;;; Code:
(defvar-local *names* '())

(defun random-capital-letter ()
  "Return a random capital letter."
  (string (+ 65 (random 26))))

(defun random-digit-as-string ()
  "Return a random digit from 0-9 as a string."
  (format "%d" (random 10)))

(defun generate-robot-name ()
  "Return a randomly-generated name in the format [A-Z]{2}[0-9]{3}."
  (let ((name (concat
               (random-capital-letter)
               (random-capital-letter)
               (random-digit-as-string)
               (random-digit-as-string)
               (random-digit-as-string))))
    (if (member name *names*)
        (generate-robot-name)
      (setq *names* (cons name *names*))
      name)))

(defun build-robot ()
  "Build a new robot with a random name."
  (cons (generate-robot-name) '()))

(defun robot-name (robot)
  "Get the ROBOT's name."
  (car robot))

(defun reset-robot (robot)
  "Reset the name of ROBOT.  Factory reset!"
  (setcar robot (generate-robot-name)))


(provide 'robot-name)
;;; robot-name.el ends here

