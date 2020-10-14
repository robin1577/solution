#|
(define (linear-combination a b x y)
    (+ (* a x)(* b y)))
;接受的可以是有理数，复数，多项式
(define (linear-combination a b x y)
    (add (mul a x) (mul b y)))
;假定make-rat numer denom过程已经写好了
(define (add-rat x y)
    (make-rat (+ (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
(define (sub-rat x y)
    (make-rat (- (* (numer x) (denom y))
                 (* (numer y) (denom x)))
              (* (denom x) (denom y))))
(define (mul-rat x y)
    (make-rat (* (numer x) (numer y))
              (* (denom x) (denom y))))
(define (div-rat x y)
    (make-rat (* (numer x) (denom y))
              (* (denom x) (numer y))))
(define (equal-rat? x y)
    (= (* (numer x) (denom y))
       (* (numer y) (denom x))))
#|
(define x (cons 1 2))
(car x)
(cdr x)
|#
;通过序对实现 make-rat，numer，denom
(define (make-rat n d)  (cons n d))
(define (numer x)       (car x))
(define (denom x)       (cdr x))
;打印有理数
(define (print-rat x)
    (newline)
    (display (nemer x))
    (display "/")
    (display (denom x)))
;打印1/2
(define one-half (make-rat 1 2))
(print-rat one-half)
;化简有理数
(define (make-rat n d)
    (let((g (gcd n d)))
        (cons (/n g) (/ d g))))
;通过过程实现cons
(define (cons x y)
    (lambda (m) (cond ((= m 0) x)
                      ((= m 1) y))))
(define (car z) (z 0))
(define (cdr z) (z 1))
;定义个区间加法
(define (add-interval x y)
    (make-interval (+ (lower-bound x) (lower-bound y))
                   (+ (upper-bound x) (upper-bound y))))
|#
;lisp 提供list来生成一个序列
(cons 1 (cons 2 (cons 3 (cons 4 nil))))
(list 1 2 3 4)
(define (list-ref items n)
        (if (= n 0)
            (car item)
            (list-ref (cdr items) (- n 1))))
(define (lenght items)
    (if (null? items)
        0
        (+1 (cdr items))))
(define (lenght-iter items)
    (define (iter a result)
        (if (null? a)
            result
            (iter (cdr a) (+ 1 result)))
    (iter items 0)))
(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))
;map
