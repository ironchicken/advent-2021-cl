(defpackage :dive
  (:use :common-lisp))

(in-package :dive)

(defstruct command
  direction
  magnitude)

(defstruct location
  horizontal
  vertical)

(defparameter *directions* '("forward" "down" "up"))

(defun parse-command (s)
  (let* ((delimiter (position #\Space s))
	 (direction (subseq s 0 delimiter))
	 (magnitude (parse-integer (subseq s (1+ delimiter)))))
    (when (find direction *directions* :test #'string=)
      (make-command
       :direction direction
       :magnitude magnitude))))

(defun read-input (in)
  (loop for line = (read-line in nil)
	while line collect (parse-command line)))

(defun follow-commands (location commands)
  (dolist (cmd commands)
    (cond ((string= (command-direction cmd) "forward")
	   (incf (location-horizontal location) (command-magnitude cmd)))
	  ((string= (command-direction cmd) "up")
	   (decf (location-vertical location) (command-magnitude cmd)))
	  ((string= (command-direction cmd) "down")
	   (incf (location-vertical location) (command-magnitude cmd))))))

(defun answer1 (commands)
  (let ((location (make-location :horizontal 0 :vertical 0)))
    (follow-commands location commands)
    (* (location-horizontal location) (location-vertical location))))

(defun answer1-from-file (filename)
  (with-open-file (in filename :direction :input)
    (answer1 (read-input in))))
