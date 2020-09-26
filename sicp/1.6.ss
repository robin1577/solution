#|
程序运行后显示超出内存
scheme使用的是应用序列，先求出参数值，特殊形式if不会求出所有参数值，而是只执行对的那一部分的参数
而我们定义的new-if会求出所有的参数
我们再sqrt-iter中使用了new-if，我们本来的想法是good-enoug后就返回guess然后这次调用停止，但是因为要求出所有
参数值，则后面不该执行的调用(sqrt-iter (improve guess x) x)))执行了，即程序无法停止下来了
但是如果用cond本身实现if，而不是构造一个像if一样的常规过程就不会出错，因为cond也满足特殊形式
|#
(define (new-if predicate then-clause else-clause)
    (cond (predicate then-clause)
        (else else-clause)))
(define (sqrt-iter guess x)
    (cond ((good-enough? guess x) guess)
        (else (sqrt-iter (improve guess x) x))))        
#|
(define (sqrt-iter guess x)
    (new-if (good-enough? guess x)
        guess
        (sqrt-iter (improve guess x) x)))
这个代码会出错
|#

(define (square x) (* x x))
(define (abs x)
    (cond   ((> x 0) x)
            ((= x 0) 0)
            ((< x 0) (- x))))
(define (improve guess x)
    (average guess  (/ x guess)))
(define (average x y)   
    (/ (+ x y) 2))
(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
    (sqrt-iter 1.0 x))
(sqrt 4)