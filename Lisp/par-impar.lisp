(defun impar (x)
   (if (/= (rem x 2) 0)
       (print "El numero es impar")
   (print "El numero es par")))

(defun par (x)
   (if (/= (rem x 2) 0)
       (return-from par NIL)
     (return-from par T)))

(defun par-impar (x)
   (if (/= (rem x 2) 0)
       NIL
     T))

(defun mapear ()
  (mapcar #'par '(1 2 3 4 5 6 7 8)))

(defun mapear1 (funcion lista)
  (mapcar funcion lista))