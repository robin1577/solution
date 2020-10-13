(define (fast-mul a b)
    (cond ((even? b) (+ (double a) (fast-mul a (halve b))))
          (else (+ a (fast-mul a (- b 1))))))