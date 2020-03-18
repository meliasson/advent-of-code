;;; package --- Advent of Code 2018 day 1 in Emacs Lisp.

;;; Commentary:

;; Let's practice Emacs Lisp!

;;; Code:

;;
;; External function declarations
;;

(declare-function read-lines "ext:read-lines")
(declare-function seq-reduce "ext:seq-reduce")

;;
;; External utilities
;;

(load (expand-file-name "utils" (file-name-directory (buffer-file-name))))

;;
;; Part 1
;;

;; (part1)

(defun part1 ()
  "Advent of Code day 1 part 1."
  (let ((lines (read-lines "day1input")))
    (seq-reduce '+ (mapcar 'string-to-number lines) 0)))

;;
;; Part 2
;;

;; (part2)

(defun part2 ()
  "Advent of Code day 1 part 2."
  (let ((lines (read-lines "day1input"))
        (frequency 0)
        (intermediate-frequencies ()))
    (nconc lines lines)
    (catch 'frequency-reached-twice
      (dolist (line lines)
        (push (list frequency t) intermediate-frequencies)
        (setq frequency (+ frequency (string-to-number line)))
        (when (assoc frequency intermediate-frequencies)
          (throw 'frequency-reached-twice frequency))))))

;;
;; Extra
;;

;; (part1-as-text-in-buffer)

(defun part1-as-text-in-buffer ()
  "Advent of Code day 1."
  (find-file "day1input")
  (goto-char (point-min))
  (let ((result 0))
    (while (progn
             (let ((line (thing-at-point 'line)))
               (setq result (+ result (string-to-number line))))
             (forward-line 1)
             (not (looking-at "^$"))))
    (and (kill-buffer (current-buffer)) result)))

;;; day1.el ends here
