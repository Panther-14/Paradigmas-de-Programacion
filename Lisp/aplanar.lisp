;Funcion mia
(defun aplana (lista)
  (when (not lista) (return-from aplana nil))
  (if (atom lista) (list lista)
     (append
      (aplana (car lista))
      (aplana (cdr lista)))))
;Funciones de mis compañeros
(defun aplanar (lista)
(if (not lista)
'()
(let ((frente (car lista)))
(if (atom frente)
(cons frente (aplanar (cdr lista)))
(append (aplanar frente)
(aplanar (cdr lista)))))))

(defun aplanar1 (lista)
(if lista
(if (atom (car lista))
(append (list (car lista)) (aplanar1 (cdr lista)))
(append (aplanar1 (car lista)) (aplanar1 (cdr lista))))))

(defun aplanar2 (lista)
  (if (null lista)
      lista
      (if (atom (car lista))
          (cons (car lista) (aplanar2 (cdr lista)))
          (append (aplanar2 (car lista)) (cdr lista)))))
