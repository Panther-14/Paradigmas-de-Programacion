(defun eliminaRepetidos (lista &optional (respuesta nil))
  (when (not lista) (return-from eliminaRepetidos respuesta))
(if (not (member (first lista) respuesta))
    (push (first lista) respuesta)
    (remove (first lista) lista))
(eliminaRepetidos  (cdr lista) respuesta))

(defun aplana (lista)
  (when (not lista) (return-from aplana nil))
  (if (atom lista) (list lista)
     (append
      (aplana (car lista))
      (aplana (cdr lista)))))

(defun fusion (lista1 lista2)
 (sort (aplana (append lista1 lista2)) #'<) 
)

(defun unicos (lista &optional (respuesta nil))
  (when (not lista) (return-from unicos (reverse respuesta)))
  (if (/= (contar lista (first lista)) 1)
      (push (first lista) respuesta)
)
(unicos (cdr lista) respuesta)
)

(defun elemUnicos (lista inicio fin)
(if (= inicio fin)
    lista
(progn
  (remove (car (funcall #'unicos lista)) lista)
(elemUnicos (cdr lista) (+ inicio 1) fin))))
  

(defun contar (lista valor &optional (cont 0))
  (when (not lista) (return-from contar cont))
  (if (=  valor (car lista))
      (contar (cdr lista) valor (+ cont 1))
    (contar (cdr lista) valor cont)
)
)

(merge 'list '(2 3 4) '(1 3 5 6 9 10) #'<)