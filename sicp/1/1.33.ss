(define (accumulate combiner null-value term a next b)
    (if (> a b)
        null-value
        (combiner (term a)
            (accumulate combiner null-value term (next a) next b)))))
(define (filtered-accumulate combiner null-value term a next b filter)
    (if (> a b)
        null-value
        (if (filter (term a))
            (combiner (term a)
                    (accumulate combiner null-value term (next a) next b filter))
            (combiner null-value
                (accumulate combiner null-value term (next a) next b filter))
            )))
;素数和，已知prime x x为素数返回1 否则返回0
(filtered-accumulate (lambda (a b) (+ a b) 0 (lambda (term) term)
                     a (lambda (next) (+ next 1) b prime)))
;小于n的所有与n互素的正整数乘积 已知filter为gcd(a,b)=1 且a<b
(filtered-accumulate (lambda (a b) (* a b) 1 (lambda (term) term)
                     1 ((lambda (next) (next 1) b  (lambda (i) (= (gcd i n) 1)) )))))