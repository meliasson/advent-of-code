;;; package --- Advent of Code 2019 utils in Emacs Lisp.

;;; Commentary:

;; Let's practice Emacs Lisp!

;;; Code:

(defun read-lines (file-path)
  "Return content of file at FILE-PATH as list of lines."
  (with-temp-buffer
    (insert-file-contents file-path)
    (split-string (buffer-string) "\n" t)))

(provide 'utils)

;;; utils.el ends here
