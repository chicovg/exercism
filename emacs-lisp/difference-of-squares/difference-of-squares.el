;;; difference-of-squares.el --- Difference of Squares (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Provides functions for calculating sum of squares, square of sums, and the difference between the two.

;;; Code:
(defun --square (n)
  "Calculate the square of N."
  (* n n))

(defun sum-of-squares (n)
  "Calculate the sum of the squares of the numbers from 1 to N."
  (seq-reduce
   '+
   (mapcar #'--square
           (number-sequence 1 n))
   0))

(defun square-of-sum (n)
  "Calculate the square of the sum of the numbers from 1 to N."
  (--square
   (seq-reduce '+
               (number-sequence 1 n)
               0)))


(defun difference (n)
  (abs
   (-
    (sum-of-squares n)
    (square-of-sum n))))

(provide 'difference-of-squares)
;;; difference-of-squares.el ends here
