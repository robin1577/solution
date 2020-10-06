#|
按左对齐计算
row从1开始
col从0开始
图就不画了
|#
(define (pascal row col)
    (if (or (= row col)  (= col 0))
        1
        (+ (pascal (- row 1) col)  
            (pascal (- row 1) (- col 1)))))
(pascal 5 1)