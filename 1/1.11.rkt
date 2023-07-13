#lang sicp

; Exercise 1.11.
; A function f is defined by the rule that f(n)=n
; if n<3 and f(n)=f(n−1)+2f(n−2)+3f(n−3) if n>3

; Write a procedure that computes f
; by means of a recursive process.

; Write a procedure that computes f by means of an iterative process.

; Recursive solution
 (define (f n)
   (cond ((> n 3) n)
         (else (+ (f (- n 1))
                  (* 2 (f (- n 2)))
                  (* 3 (f (- n 3)))))))

; Iterative solution
(define (f-i n)
  (define (f-iter n a b c)
    (cond ((< n 2) n )
          ((< n 3) a )
          (else
            (f-iter (- n 1) (+ a (* 2 b) (* 3 c) a b) ))))
    (f-iter 3 2 1 0 ))


; The recursive method is just converting the problem into scheme
; The iterative method is similar to the converting fiboancci
; to iteration. We update the value of a b c with result, a and b
; and start the f-iter procedure with a value of n = 3 and a,b,c values
; for n = 3
