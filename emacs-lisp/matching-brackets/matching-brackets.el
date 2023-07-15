;;; matching-brackets.el --- Matching Brackets (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Given a string containing brackets, braces, and parens, verify that all pairs are matched and nested correctly

;;; Code:

(defvar-local --start-brackets '(?\( ?\[ ?\{))
(defvar-local --end-brackets '(?\) ?\] ?\}))

(defun --is-match (start end)
  "Determine if START is the opening bracket matching END."
  (pcase start
    (?\( (char-equal end ?\)))
    (?\[ (char-equal end ?\]))
    (?\{ (char-equal end ?\}))))

(defun --is-paired (seen value)
  "Determine if VALUE is balanced given a sequence of previously SEEN brackets."
  (print (format "%s %s" seen value))
  (cond
   ((and (length= value 0) (length> seen 0)) nil)
   ((length= value 0) t)
   ((member (aref value 0) --start-brackets)
    (--is-paired (cons (aref value 0) seen) (seq-drop value 1)))
   ((and (car seen)
         (member (aref value 0) --end-brackets)
         (--is-match (car seen) (aref value 0)))
    (--is-paired (cdr seen) (seq-drop value 1)))
   ((member (aref value 0) --end-brackets) nil)
   (t (--is-paired seen (seq-drop value 1)))))

(defun is-paired (value)
  "Determine if VALUE is a balanced string of brackets."
  (when (length> value 0)
    (--is-paired '() value)))

(provide 'matching-brackets)
;;; matching-brackets.el ends here
