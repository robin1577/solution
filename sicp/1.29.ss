;let内部只能定义不能使用 所以只定义一个h 而不再定义一个m=h/3
;lisp的声明一定要在使用前 但是lisp不能自动找到声明 只能一条一条执行
(define (simpson f a b n)
    (let ((h (/ (- b a) n)))
     (define (yk k)
            (cond ((or (= k 0) (= k n))  (f (+ a (* k h))))
                  ((= (remainder k 2) 0) (* 2 (f (+ a (* k h)))))
                  (else (* 4 (f (+ a (* k h))))) 
            ))
     (define (next k) (+ k 1))
    (* (/ h 3) (sum yk next 0 n))))
(define (sum term next a b)
    (if (> a b)
        0
        (+ (term a) 
            (sum term next (next a) b))))
(simpson (lambda (x) (* x x x)) 0 1 100)