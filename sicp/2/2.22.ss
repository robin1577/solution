;因为cons是反向构造的 比如(cons (cons 1 2) 3)
;正常构造应该是(cons 3 (cons 1 (cons 2 (list))))
(cons (cons 1  (cons 2 (list))) (cons 3 (list)))
(cons 3 (cons 1 (cons 2 (list))))
#|
(define (square items)
    (define (iter things answer)
        (if (null? things)
            answer
            (iter (cdr thing)
                  (cons answer (square (car things))))))
    (iter items (list)))
|#