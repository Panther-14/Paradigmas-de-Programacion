(defun quicksort (lis)
  (when lis
    (destructuring-bind (p . r) lis
      (flet ((less (x) (< x p)))
        (append (quicksort (remove-if-not #'less r))
                (list p)
                (quicksort (remove-if #'less r)))))))

(defun merge-sort (result-type sequence predicate)
   (let ((split (floor (length sequence) 2)))
     (if (zerop split)
       (copy-seq sequence)
       (merge result-type (merge-sort result-type (subseq sequence 0 split) predicate)
                          (merge-sort result-type (subseq sequence split)   predicate)
                          predicate))))