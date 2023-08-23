#lang sicp

; Exercise 1.42

; Let f and g be two one-argument functions. The composition f after g is defined to be the function x f(g(x)). Define a procedure compose that implements composition.

(define (compose f g)
  (lambda (x) (f ( g x))))
