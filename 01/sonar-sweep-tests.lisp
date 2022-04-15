(defpackage sonar-sweep-test
  (:use :common-lisp :fiveam :sonar-sweep))

(in-package sonar-sweep-test)

(def-suite sonar-sweep-tests
  :description "Sonar sweep tests")

(in-suite sonar-sweep-tests)

(defparameter test-input '(199 200 208 210 200 207 240 269 260 263))

(test
 depth-increases
 "Count of number of depth increases is correct"
 (is (= 7 (sonar-sweep::answer1 test-input))))

(defun run-tests ()
  (run! 'sonar-sweep-tests))
