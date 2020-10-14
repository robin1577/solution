;sign正或0为1 负为-1
(define (make-rat n d sign)  
        (if (= sign 1)
            (cons n d)
            (cons (-n) d)))