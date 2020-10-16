;利用accumulate重写 map append length 但这些都只适用于序列
(define (accumulate op initial sequence)
    (if (null? sequence)
        initial
        (op (car sequence) (accumulate op initial (cdr sequence)))))
(define (map p sequence)
    (accumulate ((lambda (x y) (cons (p x) y))) (list) sequence))
(define (append seq1 seq2)
    (accumulate cons (list) seq2 seq1))
(define (length sequencce)
    (accumulate (lambda (x y) (+ 1 y)) 0 sequence))