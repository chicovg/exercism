;;; two-fer.el --- Two-fer Exercise (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;;; Imagine a bakery that has a holiday offer where you can buy two cookies for the price of one ("two-fer one!").
;;; You go for the offer and (very generously) decide to give the extra cookie to a friend.
;;;
;;; Code:
(defun two-fer (&optional NAME)
  "Return the 'two-fer' phrase including the NAME if given."
  (format "One for %s, one for me." (or NAME "you")))

(provide 'two-fer)
;;; two-fer.el ends here
