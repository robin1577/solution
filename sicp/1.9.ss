#|
两个都是递归过程
显然第一个是线性递归计算的
第二个是迭代递归计算的
|#
(define (+ a b)
    (if (= a 0)
        b
        (inc (+ (dec a) b))))
(define (+ a b)
    (if (= a 0)
        (+ (dec a) (inc b)))