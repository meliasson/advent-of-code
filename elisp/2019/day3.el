;;; package --- Advent of Code 2019 day 3 in Emacs Lisp.

;;; Commentary:

;; Let's practice Emacs Lisp!

;;; Code:

;;
;; External function declarations
;;

(declare-function read-lines "ext:read-lines")

;;
;; External utilities
;;

(load (expand-file-name "utils" (file-name-directory (buffer-file-name))))

;;
;; Part 1
;;

;; (part1) ;; Correct answer is 446.

(defvar d3-lines)
(defvar d3-wires)
(defvar d3-maps)
(defvar d3-map1)
(defvar d3-map2)
(defvar d3-cross)
(defvar d3-coordinate)
(defvar d3-closest-intersection)
(setq d3-closest-intersection nil)
(defvar d3-distance)

(defun part1 ()
  "Advent of Code day 3 part 1."
  (setq d3-lines (read-lines "day3input"))
  (setq d3-wires (mapcar (lambda (line) (split-string line ",")) d3-lines))
  (setq d3-maps (mapcar 'build-map d3-wires))
  (setq d3-map1 (car d3-maps))
  (setq d3-map2 (car (cdr d3-maps)))
  (dolist (coordinate d3-map1)
    (setq d3-coordinate (car (assoc (car coordinate) d3-map2)))
    (if d3-coordinate
        (progn
          (setq d3-distance (+ (abs (car d3-coordinate)) (abs (car (cdr d3-coordinate)))))
          (if (or (eq d3-closest-intersection nil) (> d3-closest-intersection d3-distance))
              (setq d3-closest-intersection d3-distance)))))
  d3-closest-intersection)

(defvar d3-fewest-steps)
(setq d3-fewest-steps nil)
(defvar d3-nr-of-steps)

;; (part2) ;; Correct answer is 9006.

(defun part2 ()
  "Advent of Code day 3 part 2."
  (setq d3-lines (read-lines "day3input"))
  (setq d3-wires (mapcar (lambda (line) (split-string line ",")) d3-lines))
  (setq d3-maps (mapcar 'build-map d3-wires))
  (setq d3-map1 (car d3-maps))
  (setq d3-map2 (car (cdr d3-maps)))
  (dolist (coordinate d3-map1)
    (setq d3-coordinate (car (assoc (car coordinate) d3-map2)))
    (if d3-coordinate
        (progn
          (setq d3-nr-of-steps (+ (car (cdr coordinate)) (car (cdr (assoc (car coordinate) d3-map2)))))
          (if (or (eq d3-fewest-steps nil) (> d3-fewest-steps d3-nr-of-steps))
              (setq d3-fewest-steps d3-nr-of-steps)))))
  d3-fewest-steps)

(defvar d3-map)
(defvar d3-x)
(defvar d3-y)
(defvar d3-direction)
(defvar d3-steps)
(defvar d3-number-of-steps)

(defun build-map (wire)
  "Build map from WIRE."
  (setq d3-map ())
  (setq d3-x 0)
  (setq d3-y 0)
  (setq d3-number-of-steps 0)
  (dolist (wire-part wire)
    (setq d3-direction (substring wire-part 0 1))
    (setq d3-steps (string-to-number (substring wire-part 1 nil)))
    (dotimes (number d3-steps)
      (cond ((string-equal d3-direction "U")
             (setq d3-y (1+ d3-y)))
            ((string-equal d3-direction "R")
             (setq d3-x (1+ d3-x)))
            ((string-equal d3-direction "D")
             (setq d3-y (1- d3-y)))
            ((string-equal d3-direction "L")
             (setq d3-x (1- d3-x))))
      (setq d3-map (cons (build-vertice d3-x d3-y) d3-map))))
  d3-map)

(defun build-vertice (x y)
  "Add vertice at X,Y to MAP."
  (setq d3-number-of-steps (1+ d3-number-of-steps))
  (list (list x y) d3-number-of-steps))

;;; day3.el ends here
