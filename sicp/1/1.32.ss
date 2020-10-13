(define (sum term a next  b)
    (if (> a b)
        0
        (+ (term a) 
            (sum term (next a) next b))))
(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
            (accumulate combiner null-value term (next a) next b)))))
(define (product a b)
    (accumulate (lambda (a b) (* a b)) 1 (lambda (term) term) a (lambda (next) (+ next 1)) b))
(product 1 3)

(define (accumulate-iter combiner null-value term a next b)
    (define (iter a result)
        (if(> a b)
            result
            (iter (next a) (combiner result (term a)))))
    (iter a null-value))