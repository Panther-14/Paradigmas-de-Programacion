;Funcion que imita la funcion primitiva mapcar
(defun fake-mapcar (funcion argumento &optional (respuesta nil))
  (when (not argumento) (return-from fake-mapcar (reverse respuesta)))
  (push (funcall funcion (car argumento))respuesta)
  (fake-mapcar funcion (cdr argumento) respuesta)
)
;Funcion que imita la funcion primitiva reduce
(defun fake-reduce (funcion inicio  argumento)
  (if (null argumento)
       inicio
    (fake-reduce funcion (funcall funcion inicio (car argumento)) (cdr argumento))))
;Funciones para probar
(defun impar (x)
   (if (/= (rem x 2) 0)
       T
     NIL))
(defun mayor (a b)
  (if (> a b)
      a
      b))