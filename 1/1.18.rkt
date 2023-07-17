#lang sicp

; Exercise 1.18
; Using the results of exercises 1.16 and 1.17, devise a procedure that generates an iterative process for multiplying two integers in terms of adding, doubling, and halving and uses a logarithmic number of steps

(define (even? n)
  ( = (remainder n 2) 0 ))

(define (double a)
  (* 2 a))

(define (half a)
( / a 2))

(define (mul a b)
    (cond ((= 0 b) 0)
          ((= 1 b) a)
          ((even? b) (mul (double a)(half b) ))
          (else (+ a  (mul a(- b 1)))))
)

;Using my same solution as in excercise 1.17 since I use the value of `a` as an accumulator
