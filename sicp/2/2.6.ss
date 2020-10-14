;完全看不懂
;https://zhuanlan.zhihu.com/p/78752838
;https://www.zhihu.com/question/39930042
;如果我们可以声明一个函数来表示(1,2),那我们自然也可以声明一个函数来表示任意自然数
;church计数法的本质其实是使用f(x)的执行次数作为计数
(define zero (lambda (f) (lambda (x) x)))
(define (add-1 n) 
            (lambda (f) (lambda (x) (f (n f) x))))
(define one
    (lambda (f)
        (lambda (x)
            (f x))))
(define two
    (lambda (f)
        (lambda (x)
            (f (f x)))))
(define three
    (lambda (f)
        (lambda (x)
            (f (f (f x))))))  
(define +
    (lambda (m)
        (lambda (n)
            (lambda (f)
                (lambda (x)
                    (m f (n f x)))))))