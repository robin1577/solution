(define (double f)
    (lambda (x) (f (f x))))
(define (inc x)(+ x 1))
((double inc) 5) ;ff
(((double double) inc) 5);dd=4=ffff 
(((double (double double)) inc) 5);dddd=16=ffffffffffffffff