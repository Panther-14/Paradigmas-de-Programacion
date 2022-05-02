(defun aplana (lista)
  (when (not lista) (return-from aplana nil))
  (if (atom lista) (list lista)
     (append
      (aplana (car lista))
      (aplana (cdr lista)))))

(defun cuenta-atomos (lista)
  (length (funcall #'aplana lista))
)

(cuenta-atomos '(a (8 c) ((d e) f)))

(defun contarAtomos (exp)
  (if (or (null exp)(atom exp)) 0
    (+ 
     (if (atom (car exp))
       1 
       0) (contarAtomos (car exp)) (contarAtomos (cdr exp)))))

(defun suma-pares (lista &optional (respuesta 0))
  (when (not lista) (return-from suma-pares respuesta))
  (if (evenp (car lista))
      (suma-pares (cdr lista) (+ respuesta (car lista)))
  (suma-pares (cdr lista) respuesta)
  )
)

(defun multiplos3 (lista &optional (respuesta nil))
(when (not lista) (return-from multiplos3 (reverse respuesta)))
(if (= (rem (car lista) 3) 0)
    (multiplos3 (cdr lista) (push (car lista) respuesta))
  (multiplos3 (cdr lista) respuesta))
)

(defun multiplos-3 (lista)
(if (not lista)
    'FINAL
    (if (= (rem (car lista) 3) 0)
        (progn (format T "~d ~%" (car lista)) (multiplos-3 (cdr lista)))
      (multiplos-3 (cdr lista)))
))
