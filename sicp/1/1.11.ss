(define (RR n)
    (if (< n 3)
        n
        (+ (RR (- n 1)) 
            (* 2 (RR (- n 2)))
            (* 3 (RR (- n 3))))))
(define (RI n)
    (if (< n 3)
        n
        (RIter 1 2 3 count-3)))
(define (RIter a b c count)
    (if (= count 0)
        c
        (RIter b c (+ c (* 2 b) (* 3 a)) (- count 1))) )