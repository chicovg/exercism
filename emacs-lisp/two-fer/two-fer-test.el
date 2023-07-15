;;; two-fer-test.el --- Tests for Two-fer (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;; Common test data version: 1.2.0 4fc1acb

;;; Code:

(load (expand-file-name "two-fer.el") nil nil nil t)
(declare-function two-fer "two-fer.el" (&optional name))

(ert-deftest no-name-given ()
  (should (string= (two-fer) "One for you, one for me.")))

(ert-deftest a-name-given ()
  (should (string= (two-fer "Alice") "One for Alice, one for me.")))

(ert-deftest another-name-given ()
  (should (string= (two-fer "Bob") "One for Bob, one for me.")))

(provide 'two-fer-test)

;;; two-fer-test.el ends here