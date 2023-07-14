#lang sicp

; Exercise 1.12.
; The following pattern of numbers is
; called Pascal's triangle. The numbers at the edge of the
; triangle are all 1, and each number inside the triangle is
; the sum of the two numbers above it.

; Write a procedure that computes elements of Pascal's
; triangle by means of a recursive process. If a number lies
; outside of the triangle, return 0 (this makes sense if we view
; pascal as the combination function ). Start counting rows and
; columns from 0.

(define (pascal row col)
  (cond ((or (= col 0 )(= col row)) 1)
        ((> col row) 0)
        (else (+ (pascal (- row 1)(- col 1))
                 (pascal (- row 1)col))
    )))



(pascal 2 1)
(pascal 2 2)
(pascal 3 0)
(pascal 3 1)
(pascal 3 2)
(pascal 3 3)
