;实现复合函数运算
(define (compose f g)
    (lambda (x) (f (g x))))
(define (square x)
    (* x x))
(define (inc x)
    (+ x 1))
((compose square inc) 6)