(defun longitud (lista &optional (contador 0) )
  (if (equal lista nil)
      (progn
    (format t "~A" contador))
(longitud (cdr lista) (+ contador 1))))

(defun isPartOf (numero lista)
  (if (member numero lista)
      (progn
        (format t "Pertenece a la lista"))
(progn "No pertenece a la lista")))

(defun pertenence (numero lista)
  (if (equal numero (car lista))
      (progn
        (format t "Pertenece a la lista"))
(pertenece numero (cdr lista))))