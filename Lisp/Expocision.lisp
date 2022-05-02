(defun aplana (lista)
  (if (not lista)
      NIL
  (if (atom lista) (list lista)
     (append
      (aplana (car lista))
      (aplana (cdr lista))))))

(defun cuenta-atomos (lista)
  (length (funcall #'aplana lista))
)
;Funcion contar atomos anonima
(lambda (x) (length (funcall #'aplana x)))

((lambda (x) (length (funcall #'aplana x))) '(1 2 3 4 (5 (6 7) 8 (9 (10)))))

;Funcion de Javi
(defun dobles (lista)
 (mapcar #'(lambda(x)(* 2 x)) lista))