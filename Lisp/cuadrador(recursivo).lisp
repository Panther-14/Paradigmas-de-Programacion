(defun cuadrados-rec (inicio fin)
  (if (> inicio fin)
  'final
  (progn
    (format t "~A ~A ~%" inicio (* inicio inicio))
(cuadrados-rec (+ inicio 1) fin))))
