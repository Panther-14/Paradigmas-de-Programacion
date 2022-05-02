(defun factorial (n) (if (= n 0) 1(* n (factorial (- n 1))) ))

(defun potencia (x m)(if (= m 0) 1(* x (potencia x (- m 1)))))

(defun longlist (lista)(cond ((null lista) 0) (T (+ 1 (longlist (CDR lista))))))

(defun sumatoria (n)(if (= n 0) 0(+ n (sumatoria (- n 1)))))

(defun producto (n)(if (= n 1) 1(* n (producto (- n 1)))))

(defun aplana (lista)(cond((null lista) NIL)((atom (CAR lista))(cons(CAR lista)(aplana (CDR lista))))(t (append(aplana (CAR lista))(aplana (CDR lista))))))