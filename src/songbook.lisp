(in-package #:songbook)

(defvar *port* 40000)

(defun browse (path)
  (progn
    (load-tabs path)
    (start app :port *port*)))

(defun shutdown ()
  (stop app))
