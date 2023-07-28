#lang sicp

; Exercise 1.36
; Modify fixed-point so that it prints the sequence of approximations it generates, using the newline and display primitives


(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

  (fixed-point (lambda (x) (+ 1 (/ 1 x)) ) 1.0)
  (newline)
  (display "Log Function")
  (newline)
  (newline)
  ( fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
