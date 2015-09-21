(in-package :cl-user)

(defpackage songbook.js
  (:use :cl :parenscript)
  (:export :gen-js))

(in-package :songbook.js)

(defun gen-js ()
  (ps
    (var *current-link* null)

    (defun set-selection (obj)
      (unless (null *current-link*)
	(setf (@ *current-link* class-name) "list-group-item"))
      (setf (@ obj class-name) "list-group-item active")
      (setf *current-link* obj))

    (defun display-tab (id)
      (let ((req (new (-x-m-l-http-request))))
	(setf (@ req onreadystatechange)
	      (lambda ()
		(let ((output (chain document (get-element-by-id "tabview")))
		      (new-html (@ req response-text)))
		  (unless (string= (@ output inner-h-t-m-l) new-html)
		    (setf (@ output inner-h-t-m-l) new-html)))))
	(chain req (open "POST" "/tab" t))
	(chain req (set-request-header "Content-Type" "application/x-www-form-urlencoded"))
	(chain req (send (+ "id=" id)))))))

