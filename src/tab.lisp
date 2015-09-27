(in-package #:songbook)

(defclass tab ()
  ((id     :reader id     :initarg :id)
   (artist :reader artist :initarg :artist)
   (title  :reader title  :initarg :title)
   (path   :reader path   :initarg :path)))

(defmethod print-object ((object tab) stream)
  (print-unreadable-object (object stream :type t)
    (format stream "ID:~a ARTIST:~a TITLE:~a PATH:~a"
	    (id object) (artist object) (title object) (path object))))

(defun make-tab (id artist title path)
  (make-instance 'tab :id id :artist artist :title title :path path))

(defvar *artist-title-regex* "(\\w?.*\\w)\\s*-\\s*(.+)")

(defun list-tabs (tabdir)
  "List all tab files in tabdir directory
A tab file is a .txt file whose name is either 'Artist - Title' or 'Title'"
  (iter
   (for path in (uiop:directory-files tabdir "*.txt"))
   (for id from 0)
   (for name = (ppcre:regex-replace-all "_" (pathname-name path) " "))
   (for scan = (cadr (multiple-value-list (ppcre:scan-to-strings *artist-title-regex* name))))
   (for artist = (or (and scan (aref scan 0)) "Unknown Artist"))
   (for title  = (or (and scan (aref scan 1)) name))
   (collect (make-tab id artist title path))))

(defun tab-match-p (pattern tab)
  "Check whether given tab artist name or title match the given pattern"
  (let ((regex (format nil "(?i)~a" pattern)))
    (and (or (ppcre:scan regex (artist tab))
	  (ppcre:scan regex (title tab)))
       tab)))

(defun filter-tabs (pattern tabs)
  "Filter a list of tab using tab-match-p as predicate"
  (iter
    (for tab in tabs)
    (when (tab-match-p pattern tab)
      (collect tab))))

(defun tab-content (tab)
  (uiop:read-file-string (path tab)))
