(in-package :songbook)

(defparameter *tabs* '())

(defun load-tabs (path)
  (setf *tabs*
	(list-tabs path)))

(defun find-tab (sid)
  (find-if (lambda (o) (= sid (id o))) *tabs*))

(defun tab-content (tab)
  (with-open-file (stream (path tab))
    (let ((data (make-string (file-length stream))))
      (read-sequence data stream)
      data)))

