(defun sublista (lista &optional (cont 0))
(when (equal (last lista) nil) (return-from sublista cont))  
(if (not (atom (car lista)))
      (sublista (cdr lista) (+ cont 1))
    (sublista (cdr lista) cont))
)

(defun sublistas (lista &optional (cont 0))
(when (equal (last lista) nil) (return-from sublistas cont))  
(if (not (atom (car lista)))
      (sublistas (cdr lista) (+ (sublistas (car lista) cont) 1))
    (sublistas (cdr lista) cont))
)
(defun sublista1 (exp)
  (if (or (null exp)(atom exp)) 0
    (+ 
     (if (atom (car exp))
       0 
       1) (sublista1 (car exp)) (sublista1 (cdr exp)))))