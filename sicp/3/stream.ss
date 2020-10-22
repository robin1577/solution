
;: (car (cdr (filter prime?
;:                   (enumerate-interval 10000 1000000))))
(define (memo-proc proc)
  (let ((already-run? false) (result false))
    (lambda ()
      (if (not already-run?)
          (begin (set! result (proc))
                 (set! already-run? true)
                 result)
          result))))
(define (delay exp)
      (memo-proc (lambda () exp)))
(define (cons-stream a b)
    (cons a (delay b)))
(define  stream-null? null?)
(define (stream-cdr stream) (force (cdr stream)))
(define (stream-car stream) (car stream))

(define (stream-ref s n)
  (if (= n 0)
      (stream-car s)
      (stream-ref (stream-cdr s) (- n 1))))

(define (stream-map proc s)
  (if (stream-null? s)
      '()
      (cons-stream (proc (stream-car s))
                   (stream-map proc (stream-cdr s)))))

(define (stream-for-each proc s)
  (if (stream-null? s)
      'done
      (begin (proc (stream-car s))
             (stream-for-each proc (stream-cdr s)))))

(define (display-stream s)
  (stream-for-each display-line s))

(define (display-line x)
  (newline)
  (display x))



;; stream-car and stream-cdr would normally be built into
;;  the stream implementation
;: (define (stream-car stream) (car stream))
;: (define (stream-cdr stream) (force (cdr stream)))

;: (stream-car
;:  (stream-cdr
;:   (stream-filter prime?
;:                  (stream-enumerate-interval 10000 1000000))))

(define (stream-enumerate-interval low high)
  (if (> low high)
      '()
      (cons-stream
       low
       (stream-enumerate-interval (+ low 1) high))))

(define (stream-filter pred stream)
  (cond ((stream-null? stream) '())
        ((pred (stream-car stream))
         (cons-stream (stream-car stream)
                      (stream-filter pred
                                     (stream-cdr stream))))
        (else (stream-filter pred (stream-cdr stream)))))
;; force would normally be built into
;;  the stream implementation
;: (define (force delayed-object)
;:   (delayed-object))
(define (show x)
  (display-line x)
  x)

(define x (stream-map show (stream-enumerate-interval 0 10)))
(stream-ref x 5)
;: (stream-ref x 7)