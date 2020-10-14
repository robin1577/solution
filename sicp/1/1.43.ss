;函数的n次复合运算 定义了一个返回过程的过程
(define (compose f g)
    (lambda (x) (f (g x))))
;定义了一个返回过程的过程
(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))));返回了一个过程
(define (square x)
    (* x x))
((repeated square 2) 5)