#|
  This file is a part of midi2cmd project.
  Copyright (c) 2018 Windymelt
|#

(in-package :cl-user)
(defpackage midi2cmd-test-asd
  (:use :cl :asdf))
(in-package :midi2cmd-test-asd)

(defsystem midi2cmd-test
  :author "Windymelt"
  :license ""
  :depends-on (:midi2cmd
               :prove)
  :components ((:module "t"
                :components
                ((:test-file "midi2cmd"))))
  :description "Test system for midi2cmd"

  :defsystem-depends-on (:prove-asdf)
  :perform (test-op :after (op c)
                    (funcall (intern #.(string :run-test-system) :prove-asdf) c)
                    (asdf:clear-system c)))
