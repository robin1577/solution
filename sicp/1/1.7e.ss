#|
比如1.000123的根号就会返回1  
123456789123456789 返回351364183.0401283
改进失败
|#
(define (square x)
    (* x x))
(define (abs x)
    (cond   ((> x 0) x)
            ((= x 0) 0)
            ((< x 0) (- x))
    )

)
(define (sqrt-iter guess x)
        (if(< (abs (/ (- (average guess  (/ x guess)) x) 
                     guess)) 
             0.0001)
            guess
            (sqrt-iter (improve guess x) x)))
(define (improve guess x)
    (average guess  (/ x guess)))
(define (average x y)   
    (/ (+ x y) 2))
(define (good-enough? guess x)
    (< (abs (- (square guess) x)) 0.001))
(define (sqrt x)
    (sqrt-iter 1.0 x))
(sqrt 1.00123)