;; --- Lisp ---
;; swap.lisp
(defun swap (a b)
  (values b a))

(defun main ()
  (multiple-value-bind (a b) (swap 3 5)
    (format t "Functional Swap: a = ~A, b = ~A~%" a b))

  (let ((a 10)
        (b 20))
    (format t "Before: a = ~A, b = ~A~%" a b)
    (let ((temp a))
      (setf a b)
      (setf b temp))
    (format t "After: a = ~A, b = ~A~%" a b)))
(main)


