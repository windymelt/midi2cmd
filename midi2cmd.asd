#|
  This file is a part of midi2cmd project.
  Copyright (c) 2018 Windymelt
|#

#|
  Author: Windymelt
|#

(in-package :cl-user)
(defpackage midi2cmd-asd
  (:use :cl :asdf))
(in-package :midi2cmd-asd)

(defsystem midi2cmd
  :version "0.1"
  :author "Windymelt"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "midi2cmd"))))
  :description ""
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op midi2cmd-test))))
