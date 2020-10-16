;写一个树结构的map
(define (tree-map f tree)
    (cond (((null?) tree) (list));空树
          ((not (piar? tree)) (f tree));叶子
          (else (cons (tree-map f (car tree)))
                (tree-map f (cdr tree)))))
(define (tree-map f tree)
    (map (lambda (sub-tree) 
                 (if (pair? sub-tree)
                        (tree-map f sub-tree)
                        (f sub-tree)))
         tree))
          