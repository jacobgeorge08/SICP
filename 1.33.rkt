#lang sicp

; Exercise 1.33.

; You can obtain an even more general version of accumulate (exercise 1.32) by introducing the notion of a filter on the terms to be combined. That is, combine only those terms derived from values in the range that satisfy a specified condition. The resulting filtered-accumulate abstraction takes the same arguments as accumulate, together with an additional predicate of one argument that specifies the filter. Write filtered-accumulate as a procedure.

(define (filtered-accumulate combiner null-value term a next b filter?)
  (if (> a b)
      null-value
      (cond ((filter? a)
             (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter?)))
            (else (filtered-accumulate combiner null-value term (next a) next b filter?)))))


; Show how to express the following using filtered-accumulate:
; a) the sum of the squares of the prime numbers in the interval a to b (assuming that you have a prime? predicate already written)
; b) the product of all the positive integers less than n that are relatively prime to n (i.e., all positive integers i<n such that GCD(i,n)=1. )

  (define (prime? n)
  (if (= n 1)
      #f
      (= (smallest-divisor? n) n)))

(define (smallest-divisor? x)
  (define (iter divisor)
    (cond ((= (remainder x divisor) 0) divisor)
          ((> (square divisor) x) x )
          (else (iter (+ 1 divisor)))))
    (iter 2 ))
(define (square x)
  (* x x))

(define ( inc a)
  (+ 1 a))

(define (prime-squares-sum a b)
  (filtered-accumulate + 0 square a inc b prime?))

(prime-squares-sum 1 10)

(define (prime-prduct a b)
  (filtered-accumulate * 1 identity a inc b prime?))

(prime-prduct 1 6)
