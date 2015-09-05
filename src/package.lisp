(in-package :cl-user)

(defpackage songbook
  (:use :cl :lucerne :iterate)
  (:import-from :ceramic.resource
                :define-resources
                :resource-directory)
  (:export :browse :run))
