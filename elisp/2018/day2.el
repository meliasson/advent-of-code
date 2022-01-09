;;; package --- Advent of Code 2018 day 2 in Emacs Lisp.

;;; Commentary:

;; Let's practice Emacs Lisp!

;;; Code:

(defun read-lines (file-path)
  "Return content of file at FILE-PATH as list of lines."
  (with-temp-buffer
    (insert-file-contents file-path)
    (split-string (buffer-string) "\n" t)))

(defun part1 ()
  "Advent of Code day 2 part 1."
  (let ((box-ids (read-lines "day2input"))
        (twos 0)
        (threes 0))
    (dolist (box-id box-ids)
      (let ((letter-frequencies ())
            (letters (split-string box-id "" t)))
        (dolist (letter letters)
          (unless (assoc letter letter-frequencies)
            (push (list letter 0) letter-frequencies))
          (setf (cdr (assoc letter letter-frequencies)) (list (+ (car (cdr (assoc letter letter-frequencies))) 1))))
        (catch 'two-found
          (dolist (letter-frequency letter-frequencies)
            (when (= (car (cdr letter-frequency)) 2)
              (progn
                (setf twos (+ twos 1))
                (throw 'two-found twos)))))
        (catch 'three-found
          (dolist (letter-frequency letter-frequencies)
            (when (= (car (cdr letter-frequency)) 3)
              (progn
                (setf threes (+ threes 1))
                (throw 'three-found threes)))))))
    (* twos threes)))

;; (part1)

(defun part2 ()
  "Advent of Code day 2 part 2."
  (defvar boxes)
  (setf boxes (read-lines "day2input"))
  (message "%s" boxes)
  (dolist (box boxes)
    (defvar box-letters)
    (setf box-letters (split-string box "" t))
    (dolist (comparison-box boxes)
      (defvar comparison-box-letters)
      (setf comparison-box-letters (split-string comparison-box "" t))
      ;; (mapcar* ) ; accepts two sequences
      )))

;; (part2)

;;; day2.el ends here
