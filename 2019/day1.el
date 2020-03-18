;;; package --- Advent of Code 2019 day 1 in Emacs Lisp.

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

;; (part1) ;; Correct answer is 3465154.

(defun part1 ()
  "Advent of Code day 1 part 1."
  (let ((lines (read-lines "day1input")))
    (seq-reduce '+
                (mapcar 'calculate-required-fuel
                        (mapcar 'string-to-number lines))
                0)))

(defun calculate-required-fuel (mass)
  "Return required amount of fuel, based on MASS."
  (- (floor (/ mass 3)) 2))

;;
;; Part 2
;;

;; (part2) ;; Correct answer is 5194864.

(defun part2 ()
  "Advent of Code day 1 part 2."
  (let ((lines (read-lines "day1input")))
    (seq-reduce '+
                (mapcar 'calculate-required-fuel-recursively
                        (mapcar 'string-to-number lines))
                0)))

(defun calculate-required-fuel-recursively (mass)
  "Return required amount of fuel, based on MASS.

This version takes into account that fuel also has mass and therefore
requires additional fuel."
  (let ((fuel (calculate-required-fuel mass)))
    (if (<= fuel 0)
        0
      (+ fuel (calculate-required-fuel-recursively fuel)))))

;;; day1.el ends here
