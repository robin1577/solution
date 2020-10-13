(define (sum term next a b)
    (if (> a b)
        0
        (+ (term a) 
            (sum term next (next a) b))))
(define (product term next a b)
    (if (> a b)
        0
        (* (term a) 
            (product term next (next a) b))))