(defpackage sonar-sweep
  (:use :common-lisp))

(in-package sonar-sweep)

(defun read-input (filename)
  (with-open-file (in filename :direction :input)
    (loop for line = (read-line in nil)
	  while line collect (parse-integer line))))

(defun answer1 (input)
  (length
   (loop for y in input
	 for x in (cdr input)
	 when (> x y) collect x)))
