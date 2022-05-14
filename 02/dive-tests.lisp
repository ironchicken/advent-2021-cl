(defpackage :dive-test
  (:use :common-lisp :fiveam :dive))

(in-package :dive-test)

(def-suite dive-tests
  :description "Dive tests")

(in-suite dive-tests)

(defparameter test-input "forward 5
down 5
forward 8
up 3
down 8
forward 2")

(defparameter test-commands
  (list
   (dive::make-command :direction "forward" :magnitude 5)
   (dive::make-command :direction "down" :magnitude 5)
   (dive::make-command :direction "forward" :magnitude 8)
   (dive::make-command :direction "up" :magnitude 3)
   (dive::make-command :direction "down" :magnitude 8)
   (dive::make-command :direction "forward" :magnitude 2)))

(test
    input-parses
  "Input can be correctly parsed"
  (is (equalp (dive::read-input (make-string-input-stream test-input)) test-commands)))

(test
    follow-commands-is-correct
  "Commands can be correctly followed"
  (let ((location (dive::make-location :horizontal 0 :vertical 0 :aim 0)))
    (dive::follow-commands location test-commands)
    (is (and (= (dive::location-horizontal location) 15)
	     (= (dive::location-vertical location) 60)))))

(defun run-tests ()
  (run! 'dive-tests))
