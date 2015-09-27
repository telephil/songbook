(in-package :songbook)

(defparameter *path* "")
(defparameter *tabs* '())

(defun reload ()
  (setf *tabs* (list-tabs *path*)))

(defun load-tabs (path)
  (setf *path* path)
  (reload))

(defun find-tab (sid)
  (find-if (lambda (o) (= sid (id o))) *tabs*))

