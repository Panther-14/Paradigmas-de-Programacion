(defun longitud2 (lista &optional (cont 0))
   (if (not lista)
       cont
     (longitud2 (cdr lista) (+ 1 cont))))

(apply #'+ '(1 2 3))

(defun longitud3 (lista)
  (apply #'+ (mapcar (lambda (x) 1) lista)))

(defun longitud4 (lista)
  (reduce #'+ (mapcar (lambda (x) 1) lista)))
