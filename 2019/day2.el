;;; package --- Advent of Code 2019 day 2 in Emacs Lisp.

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

;; (part1 12 2) ;; Correct answer is 5482655.

(defun part1 (noun verb)
  "Advent of Code day 2 part 1.

Position 1 in intcode program is replaced with NOUN, and position 2 is
replaced with VERB."
  (let ((intcode (get-intcode))
        (startpos 0))
    (setcar (cdr intcode) noun)
    (setcar (cdr (cdr intcode)) verb)
    (process-opcode intcode startpos)
    (car intcode)))

(defun get-intcode ()
  "Get intcode as list of numbers."
  (let ((raw-intcode (car (read-lines "day2input"))))
    (let ((split-intcode (split-string raw-intcode ",")))
      (mapcar 'string-to-number split-intcode))))

(defun process-opcode (intcode index)
  "Process opcode at INDEX in INTCODE."
  (let ((opcode (elt intcode index)))
    (when (or (eq opcode 1) (eq opcode 2))
      (let ((operand1 (elt intcode (elt intcode (+ index 1))))
            (operand2 (elt intcode (elt intcode (+ index 2)))))
        (if (eq opcode 1)
            (setcar (nthcdr (elt intcode (+ index 3)) intcode) (+ operand1 operand2))
          (setcar (nthcdr (elt intcode (+ index 3)) intcode) (* operand1 operand2))))
      (process-opcode intcode (+ index 4)))))

;;
;; Part 2
;;

(setq max-specpdl-size 500000) ;; needed since recursion goes deep
(setq max-lisp-eval-depth 50000) ;; needed since recursion goes deep

;; (part2 0 0) ;; Correct answer is 4967.

(defun part2 (noun verb)
  "Advent of code day 2 part 2.

Position 1 in intcode program is replaced with NOUN, and position 2 is
replaced with VERB."
  (if (/= (part1 noun verb) 19690720)
      (if (eq verb 99)
          (part2 (1+ noun) 0)
        (part2 noun (1+ verb)))
    (string-to-number (format "%d%d" noun verb))))

;;; day2.el ends here
