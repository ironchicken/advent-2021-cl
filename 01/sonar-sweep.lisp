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

(defun answer2 (input)
  (let ((window-sums (loop for z in input
			   for y in (cdr input)
			   for x in (cddr input)
			   collect (+ x y z))))
    (length (loop for y in window-sums
		  for x in (cdr window-sums)
		  when (> x y) collect x))))
