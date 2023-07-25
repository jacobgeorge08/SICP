#lang sicp

; Exercise 1.31

; Recursive Approach
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
         (product term (next a) next b))))

; Iterative Approach
(define (product-i term a next b)
  (define (iter a result)
    (if (> a b)
        1
        (iter (next a) (* result (term a)))))
    (iter a 1))

; Factorial
(define (factorial a)
  (define (identity a) a)
  (define (next a) (+ 1 a))
  (product identity 1 next a)
    )

( factorial 4)

; Wallis Product
(define (wallis-product n)
  (define (term n)
    (* (/ (* 2 n)
          (- (* 2 n) 1))
       (/ (* 2 n)
          (+ (* 2 n) 1))))
  (product term 1.0 inc n))
