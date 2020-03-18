;;; package --- Advent of Code 2019 day 3 in Emacs Lisp.

;;; Commentary:

;; Let's practice Emacs Lisp!

;;; Code:

(defun read-lines (file-path)
  "Return content of file at FILE-PATH as list of lines."
  (with-temp-buffer
    (insert-file-contents file-path)
    (split-string (buffer-string) "\n" t)))

(defun part1 ()
  "Advent of Code day 3 part 1."
  (let ((lines (read-lines "day3input")))
    (message "%s" lines)))

;; (part1)

;;; day1.el ends here
