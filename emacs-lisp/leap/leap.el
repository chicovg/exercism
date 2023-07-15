;;; leap.el --- Leap exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Provides a procedure which determines whether or not a year is a leap year.

;;; Code:

(defun divisible-by (number divisor)
  "Return t if NUMBER is divisible by DIVISOR."
  (eql (mod number divisor) 0))

(defun leap-year-p (year)
  "Given a YEAR, reports if it is a leap year."
  (cond ((divisible-by year 400) t)
        ((divisible-by year 100) nil)
        ((divisible-by year 4) t)))

(provide 'leap-year-p)
;;; leap.el ends here
