(in-package :cl-user)

(defpackage songbook
  (:use :cl :lucerne :iterate)
  (:import-from :songbook.js
		:gen-js)
  (:export :browse :shutdown))
