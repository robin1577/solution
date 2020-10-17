#|
基于四个选择函数real-part imag-part magnitude angle
两个构造函数 make-from-real-imag  make-from-mag-ang
三角关系(x,y)和(r,A)之间有转换关系
对于抽象出来的函数 add sub mul div
不同的人可以编写不同的选择函数和构造函数，使得表示与使用无关，但此时只有
一种表示
|#
#|
但如果我们想同时使用多种表示，需要多一个类型标志部分 
符号rectangular polar 借助这个标志就可以选择对应选择函数了
|#
(define (attach-tag type-tag contents)
    (cons type-tag contents))
(define (type-tag datum)
    (if (pair? datum)
        (car datum)
        (error "bad tagged datum")))
(define (contents datum)
    (if (pair? datum)
        (cdr datum)
        (error "bad tagged datum")))
 
