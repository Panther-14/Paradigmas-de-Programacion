(defun par-impar1 (x)
   (if (/= (rem x 2) 0)
       NIL
     T))

(defun filtrar (funcion lista &optional (respuesta nil))
  (when (not lista) (return-from filtrar respuesta))
  (if (funcall funcion (car lista))
      (push (car lista) respuesta)
)
(filtrar funcion (cdr lista) respuesta)
)