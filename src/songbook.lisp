(in-package #:songbook)

(defvar *port* 40000)

(defun browse (path)
  (progn
    (load-tabs path)
    (start app :port *port*)))

(defun run ()
  (let ((window (ceramic:make-window :url (format nil "http://localhost:~D/" *port*)
				     :width 1600
				     :height 1900)))
    (ceramic:show-window window)))
