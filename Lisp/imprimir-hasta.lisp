(defun imprimir-hasta (a &optional (b 0))
  (if (< a b)
      'final
    (progn
      (format t "~A ~%" b)
(imprimir-hasta a (+ b 1)))))

(defun imprimir-hasta-inverso (a &optional (b 0))
  (if (< a b)
      'final
    (progn
      (format t "~A ~%" a)
(imprimir-hasta-inverso (- a 1) b))))