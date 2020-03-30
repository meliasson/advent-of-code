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

(defun part1 ()
  "Advent of Code day 4 part 1."
  (let ((lower-limit (get-lower-limit))
        (upper-limit (get-upper-limit))
        (number-of-passwords-meeting-criteria 0))
    (while (> (1+ upper-limit) lower-limit)
      (if (number-meets-criteria lower-limit)
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

(defun number-meets-criteria (number)
  "Determine if NUMBER meets the password criteria.

Return t if it does, nil otherwise."
  (and (number-meets-equality-criteria number)
       (number-meets-decrease-criteria number)))

(defun number-meets-equality-criteria (number)
  "Determine if NUMBER meets the equality password criteria.

Return t if it does, nil otherwise."
  (let ((number-as-string (number-to-string number))
        (result t))
    (dotimes (index (1- (length number-as-string)))
      (let ((first (string-to-number (string (elt number-as-string index))))
            (second (string-to-number (string (elt number-as-string (1+ index))))))
        (if (< second first)
            (setq result nil))))
    result))

(defun number-meets-decrease-criteria (number)
  "Determine if NUMBER meets the decrease password criteria.

Return t if it does, nil otherwise."
  (let ((number-as-string (number-to-string number))
        (result nil))
    (dotimes (index (1- (length number-as-string)))
      (let ((first (string-to-number (string (elt number-as-string index))))
            (second (string-to-number (string (elt number-as-string (1+ index))))))
        (if (eq second first)
            (setq result t))))
    result))

;;; day4.el ends here
