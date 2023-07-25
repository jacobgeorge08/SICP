#lang sicp

; Exercise 1.29

; Simpson's Rule is a more accurate method of numerical integration than the method illustrated above. Using Simpson's Rule, the integral of a function f between a and b is approximated as h/3[y0+4y1+2y2+4y3+2y4+⋯+2yn−2+4yn−1+yn] where h = (b−a)/n , for some even integer n , and yk=f(a+kh). Increasing n increases the accuracy of the approximation.) Define a procedure that takes as arguments f, a, b, and n and returns the value of the integral, computed using Simpson's Rule. Use your procedure to integrate cube between 0 and 1 (with n = 100 and n = 1000), and compare the results to those of the integral procedure shown above.

 (define (simpson-integral f a b n)
   (define (sum term a next b)
     (if (> a b)
       0
       (+ (term a) (sum term (next a) next b))))
   (define (term x)
     (+ (f x) (* 4 (f (+ x h))) (f (+ x (* 2 h)))))
   (define (next x)
     (+ x (* 2 h)))
   (define h (/ (- b a) n))
   (* (/ h 3) (sum term a next (- b (* 2 h)))))


 (define (cube x)
   (* x x x))


 (display (simpson-integral cube 0 1 100)) (newline)
 (display (simpson-integral cube 0 1 1000)) (newline)
