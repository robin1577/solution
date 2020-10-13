(define (square x)
    (* x x))
(define (cube x)
    (* x x x))
(define (sum-of-square x y)
    (+ (square x) (square y)))
(define (f a)
    (sum-of-square ))
(define (abs x)
    (cond   ((> x 0) x)
            ((= x 0) 0)
            ((< x 0) (- x))
    )

)
(define (>= x y)
    (not (< x y)))
(define (sqrt-iter guess x)
    (if (good-enough? guess x)
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
;1.2.2
(define (fib n) (fib-iter 1 0 n))
(define (fib-iter a b count)
    (if (= n 0) b
        (fib-iter (+a b) a (- count 1))))
(define (count-chang amount)
    (cc amount 5))
(define (cc amount kinds-of-coins)
    (cond ((= amount 0) 1)
          ((or (< amount 0) (= kinds-of-coins 0)) 0)
          (else (+ (cc amount (- kinds-of-coins 1))
                   (cc (- amount (first-denomination kinds-of-coins)) kinds-of-coins)))))
 (define (first-denomination kinds)
     (cond ((= kinds 1) 1)
           ((= kinds 2) 5)
           ((= kinds 3) 10)
           ((= kinds 4) 25)
           ((= kinds 5) 50)))
;
(define (expt b n)
    (if (= n 0)
        b
        (* b (expt b (- n 1)))))
(define (expt b n)
    (expt-iter b n 1))
(define (expt-iter b count product)
    (if (= count 0)
        product
        (* b (expt-iter b (- count 1) (* b product)))))
(define (fast-expt b n)
    (cond ((= n 0) 1)
          ((even? n) (square (fast-expt b (/ n 2))))
          (else (* b (fast-expt b (- n 1))))))
(define (even? n)
    (= (remainder n 2) 0))
#|
remainder 基础过程
|#
(define (gcd a b)
    (if (= b 0)
      a
      (gcd b (remainder a b))))
#|
1.3
|#
;a到b的和
(define (sum-intergers a b)
    (if (> a b)
        0
        (+ a (sum-intergers (a+1) b))))
;整数的立方和
(define (sum-cubes a b)
    (if(> a b)
    0
    (+ cube(a) (sum-cubes (+ a 1) b))))
;pi的无穷级数 近似pi
(define (pi-sum a b)
    (if (> a b)
        0   
        (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b) )))
;抽象出一个公共模式 用于和
(define (sum term next a b)
    (if (> a b)
        0
        (+ (term a) 
            (sum term next (next a) b))))
;求定积分的近似值
(define (integral f a b dx)
    (define (add-dx x) (+ x dx))
    (* (sum f add-dx (+ a (/ dx 2.0)) b) dx))
;(integral cube 0 1 0.001)
;找fx=0的解，用区间折半查找
(define (search f neg-point pos-point)
    (let ((midpoint (average neg-point pos-point)))
        (if (close-enough? neg-point pos-point)
            midpoint 
            (let ((test-value (f midpoint)))
                 (cond ((poistive? test-value)  
                        (search f neg-point midpoint))
                       ((negative? test-value) 
                        (search f midpoint pos-point ))
                       (else midpoint)
                        )))))
(define (close-enough? x y)
    (< (abs (- x y)) 0.001))
#|
(define (half-intercal-method f a b)
    (let ((a-value (f a))
          (b-value (f b)))
          (cond ((and (negative? a-value) (positive? b-value))
                    (search f a b)
                 (and (negative? b-value) (positive? a-value)))))
                 (else "values are not of opposite sign" a b))
|#
;f(x)=x 即找函数的不动点 即不停的ff...ffffffffx
(define tolerance 0.0001)
(define (fixed-point f first-guess)
        (define (close-enough? v1 v2)
            (< (abs (- v1 v2)) tolerance))
        (define (try guess)
            (let ((next (f guess)))
                (if (close-enough? guess next)
                    next
                    (try next))))
        (try first-guess))
(define (sqrt y\x)
    (fixed-point (lambda (y) (average y (/ x y)) 1.0)))
;过程作为返回值 平均阻尼函数
(define (average-damp f)
    (lambda (x) (average x (f x))))
;((average-damp square) 10)
;3种思想 不动点搜寻 平均阻尼 和函数 y-》x/y
(define (sqrt x)
    (fixed-point (average-damp (lambda (y) (/ x y))) 1.0))
;(sqrt 9)
(define (cube-root x)
    (fixed-point (average-damp (lambda (y) (/ x (square y)))) 1.0))
;求任何连续函数的导数
(define (deriv g) (lambda (x) (/ -(g (+ x dx)) (g x) dx)))
(define dx 0.00001)
;利用gx 产生一个fx
(define (newton-transform g)
    (lambda (x) (- x (/ (g x) ((deriv g)x)))))
(define (newton-method g guess)
    (fixed-point (new-transform g) guess))
;抽象不动点搜寻
(define (fixed-point-of-transform g transform guess)
    (fixed-point (transform g) guess))