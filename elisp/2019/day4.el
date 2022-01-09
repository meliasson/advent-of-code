;;; package --- Advent of Code 2019 day 4 in Emacs Lisp.

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

;; (part1) ;; Correct answer is 460.

(defun part1 ()
  "Advent of Code day 4 part 1."
  (let ((lower-limit (get-lower-limit))
        (upper-limit (get-upper-limit))
        (number-of-passwords-meeting-criteria 0))
    (while (> (1+ upper-limit) lower-limit)
      (if (number-meets-criteria-part1 lower-limit)
          (setq number-of-passwords-meeting-criteria
                (1+ number-of-passwords-meeting-criteria)))
      (setq lower-limit (1+ lower-limit)))
    number-of-passwords-meeting-criteria))

;; (part2) ;; Correct answer is 290.

(defun part2 ()
  "Advent of Code day 4 part 2."
    (let ((lower-limit (get-lower-limit))
        (upper-limit (get-upper-limit))
        (number-of-passwords-meeting-criteria 0))
    (while (> (1+ upper-limit) lower-limit)
      (if (number-meets-criteria-part2 lower-limit)
          (setq number-of-passwords-meeting-criteria
                (1+ number-of-passwords-meeting-criteria)))
      (setq lower-limit (1+ lower-limit)))
    number-of-passwords-meeting-criteria))


(defun get-lower-limit ()
  "Get lower limit of password range in puzzle input."
  (car (get-puzzle-input)))

(defun get-upper-limit ()
  "Get upper limit of password range in puzzle input."
  (car (cdr (get-puzzle-input))))

(defun get-puzzle-input ()
  "Return puzzle input.

Return value is a list with two elements, where the first element is
the lower limit of the password range, and the second element is the
upper limit."
  (mapcar 'string-to-number
          (split-string (car (read-lines "day4input"))
                        "-")))

(defun number-meets-criteria-part1 (number)
  "Determine if NUMBER meets the password criteria.

Return t if it does, nil otherwise."
  (and (number-meets-equality-criteria number)
       (number-meets-decrease-criteria number)))

(defun number-meets-criteria-part2 (number)
  "Determine if NUMBER meets the password criteria.

Return t if it does, nil otherwise."
  (and (number-meets-refined-equality-criteria number)
       (number-meets-decrease-criteria number)))

(defun number-meets-decrease-criteria (number)
  "Determine if NUMBER meets the decrease password criteria.

Return t if it does, nil otherwise."
  (let ((number-as-string (number-to-string number))
        (result t))
    (dotimes (index (1- (length number-as-string)))
      (let ((first (string-to-number (string (elt number-as-string index))))
            (second (string-to-number (string (elt number-as-string (1+ index))))))
        (if (< second first)
            (setq result nil))))
    result))

(defun number-meets-equality-criteria (number)
  "Determine if NUMBER meets the equality password criteria.

Return t if it does, nil otherwise."
  (let ((number-as-string (number-to-string number))
        (result nil))
    (dotimes (index (1- (length number-as-string)))
      (let ((first (string-to-number (string (elt number-as-string index))))
            (second (string-to-number (string (elt number-as-string (1+ index))))))
        (if (= second first)
            (setq result t))))
    result))

(defun number-meets-refined-equality-criteria (number)
  "Determine if NUMBER meets the equality password criteria.

Return t if it does, nil otherwise."
  (let ((number-as-string (number-to-string number))
        (result nil))
    (let ((first (string-to-number (string (elt number-as-string 0))))
          (second (string-to-number (string (elt number-as-string 1))))
          (third (string-to-number (string (elt number-as-string 2))))
          (fourth (string-to-number (string (elt number-as-string 3))))
          (fifth (string-to-number (string (elt number-as-string 4))))
          (sixth (string-to-number (string (elt number-as-string 5)))))
      (if (or (and (= first second) (not (= second third)))
              (and (= second third) (not (= first second)) (not (= third fourth)))
              (and (= third fourth) (not (= second third)) (not (= fourth fifth)))
              (and (= fourth fifth) (not (= third fourth)) (not (= fifth sixth)))
              (and (= fifth sixth) (not (= fourth fifth))))
          (setq result t)))
    result))

;;; day4.el ends here
