(defun eliminaRepetidos (lista &optional (respuesta nil))
  (when (not lista) (return-from eliminaRepetidos respuesta))
(if (not (member (first lista) respuesta))
    (push (first lista) respuesta)
    (remove (first lista) lista))
(eliminaRepetidos  (cdr lista) respuesta))

(defun delDuplicados (lista)
  (remove-duplicates lista))

(eliminaRepetidos '(1 1 1 1 2 2 2 3 3 3))

(delDuplicados '(1 1 1 1 2 2 2 3 3 3))

