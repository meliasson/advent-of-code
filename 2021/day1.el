;;; package --- Advent of Code 2021 day 1 in Emacs Lisp.

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
;; Settings
;;

(setq max-specpdl-size 500000) ;; Needed since recursion goes deep.
(setq max-lisp-eval-depth 50000) ;; Needed since recursion goes deep.

;;
;; Part 1
;;

;; (part1) ;; Correct answer is 1292.

(defun part1 ()
  "Advent of Code day 1 part 1."
  (let ((lines (read-lines "day1input")))
    (let ((depths (mapcar 'string-to-number lines)))
      (count-depth-increases 1000000000 depths))))

(defun count-depth-increases (current-depth subsequent-depths)
  "Start at CURRENT-DEPTH and recurse through SUBSEQUENT-DEPTHS."
  (if subsequent-depths
      (if (< current-depth (car subsequent-depths))
          (+ 1 (count-depth-increases (car subsequent-depths) (cdr subsequent-depths)))
        (+ 0 (count-depth-increases (car subsequent-depths) (cdr subsequent-depths))))
    0))

;;
;; Part 2
;;

;; (part2) ;; Correct answer is 1262.

(defun part2 ()
  "Advent of Code day 1 part 2."
  (let ((lines (read-lines "day1input")))
    (let ((depths (mapcar 'string-to-number lines)))
      (count-sliding-window-depth-increases 1000000000 depths))))

(defun count-sliding-window-depth-increases (current-sliding-window-depth subsequent-depths)
  "Start at CURRENT-DEPTH and recurse through SUBSEQUENT-DEPTHS."
  (if (> (length subsequent-depths) 2)
      (if (< current-sliding-window-depth (get-sliding-window-depth subsequent-depths))
          (+ 1 (count-sliding-window-depth-increases (get-sliding-window-depth subsequent-depths) (cdr subsequent-depths)))
        (+ 0 (count-sliding-window-depth-increases (get-sliding-window-depth subsequent-depths) (cdr subsequent-depths))))
    0))

(defun get-sliding-window-depth (depths)
  "Sum first three entries in DEPTHS."
  (+ (car depths) (car (cdr depths)) (car (cdr (cdr depths)))))

;;; day1.el ends here
