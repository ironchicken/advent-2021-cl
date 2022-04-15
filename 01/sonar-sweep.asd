(asdf:defsystem "sonar-sweep"
  :name "sonar-sweep"
  :author "Richard Lewis <richard@rjlewis.me.uk>"
  :components
  ((:file "sonar-sweep"))
  :serial t
  :in-order-to ((asdf:test-op (asdf:test-op "sonar-sweep-test"))))

(asdf:defsystem "sonar-sweep-test"
  :name "sonar-sweep-test"
  :depends-on ("fiveam" "sonar-sweep")
  :components
  ((:file "sonar-sweep-tests"))
  :perform (asdf:test-op (o c)
			 (uiop:symbol-call :sonar-sweep-test :run-tests)))
