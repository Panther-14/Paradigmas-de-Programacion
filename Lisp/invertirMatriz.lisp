(defun invertir (matriz)
  (if (not matriz)
      nil
    (let* ((todo (primeros-resto matriz))
           (fila (car todo))
           (resto (second todo)))
      (cons fila (invertir resto))
)))

(defun primeros-resto (matriz &optional (fila nil) (resto nil))
  (if (not matriz)
      (list fila resto)
      (primeros-resto (cdr matriz)
                      (append fila (list (caar matriz)))
                      (if (cdr (car matriz))
                          (append resto (list (cdr (car matriz))))))))