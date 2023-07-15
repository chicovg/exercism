;;; hello-world-test.el --- Tests for Hello World (exercism)  -*- lexical-binding: t; -*-

;;; Commentary:
;; Common test data version: 1.1.0 be3ae66

;;; Code:

;; (load-file "hello-world.el")
(load (expand-file-name "hello-world.el") nil nil nil t)
(declare-function hello "hello-world.el")


(ert-deftest hello-world-test ()
  (should (string= (hello) "Hello, World!")))

(provide 'hello-world-test)

;;; hello-world-test.el ends here
