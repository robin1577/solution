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
;(cons 1 (cons 2 (cons 3 (cons 4 (list)))))
;(list 1 2 3 4)
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
            (iter (cdr a) (+ 1 result))))
    (iter items 0))
(define (append list1 list2)
    (if (null? list1)
        list2
        (cons (car list1) (append (cdr list1) list2))))
;map
(define (map proc items)
    (if (null? items)
        (list)
        (cons (proc (car items)) (map proc (cdr items)))))
;(map (lambda (x) (* x x)) (list 1 2 3 4))
;pair? lisp基本过程检查参数是否为序对
(define (count-leaves x)
    (cond ((null? x)       0)
          ((not (pair? x)) 1)
          (else (+ (count-leaves (car x)) 
                    (count-leaves (cdr x))))))
(define (scale-tree tree factor)
    (map (lambda (sub-tree) 
                    (if (pair? sub-tree)
                        (scale-tree sub-tree factor)
                        (* sub-tree factor))
         tree)))
;eumerate filter map accumulate
(define (eumerate-interval low hight);枚举区间的整数
    (if (> low high)
            (list)
            (cons low (enumerate-interval (+ low 1) high))))
(define (enumerate-tree tree)
    (cond ((null? tree) (list))
           ((not (pair? tree)) (list tree))
           (else (append (enumerate-tree (car tree))
                        (enumerate-tree (cdr tree))))))
;(enumerate-tree (list 1 (list 2) (list 3 4) 5))
(define (filter predicate sequence);定义一个filter,接受和返回一个表
    (cond ((null? sequence) (list))
          ((predicate (car sequence))
                   (cons (car sequence) (filter predicate (cdr sequence))))
          (else (filter predicate (cdr sequence)))))
;map
;accumulate
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))))
;重构sum-odd-squares
(define (sum-odd-squares tree)
    (accumulate + 0 (map (lambda (x) (* x x)) (filter odd? (enumerate-tree tree)))))
;(sum-odd-squares (list 1 (list 2) (list 3 4) 5))
;只含有奇数的斐波那契数列
(define (even-fibs n)
    (accumulate cons (list) (filter even? (map fib (enumerate-interval 0 n)))))

