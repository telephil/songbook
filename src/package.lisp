(in-package :cl-user)

(defpackage songbook
  (:use :cl :lucerne :parenscript)
  (:import-from :ceramic.resource
                :define-resources
                :resource-directory)
  (:export :browse :shutdown))
