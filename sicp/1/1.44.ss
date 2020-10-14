;平滑函数 
;如果g为接受过程的过程，则x传入的必定是过程
(define (compose f g)
    (lambda (x) (f (g x))))
;
(define (smooth f)
    (lambda (x) 
        (let ((dx 0.0001))
             (/ (+ (f (- x dx)) (f x) (f (+ x dx))) 3))))
;定义一个n倍复合过程，接受f n，返回一个过程接受x
(define (repeated f n)
    (if (= n 1)
        f
        (compose f (repeated f (- n 1)))))
;这里的f会被smooth接受
(define (smooth-repeated f n)
                ((repeated smooth n) f))
(define (square x)
    (* x x))
;这里的5会被(smooth f)过程接受
((smooth-repeated square 100) 5)
;当h是个过程的时候会发生什么
(define (compose f g)
    (lambda (h) (f (g h))));返回了一个过程，这个过程接收一个过程h
(define (smooth-repeated f n)
                ((repeated smooth n) f));返回了一个过程h
((smooth-repeated square 10)5)
;

