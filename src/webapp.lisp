(in-package :songbook)
(annot:enable-annot-syntax)

;;; App resources

(defun resource-directory (name)
  (asdf:system-relative-pathname :songbook name))

;;; App

(defapp app
  :middlewares ((clack.middleware.static:<clack-middleware-static>
                 :root (resource-directory #p"assets/")
                 :path "/static/")))

;;; Templates

(djula:add-template-directory
 (resource-directory #p"templates/"))

(defparameter +index+ (djula:compile-template* "index.html"))

;;; Views

@route app "/"
(defview index ()
  (render-template (+index+) :tabs *tabs*))

@route app (:post "/tab")
(defview tab-view ()
  (with-params (id)
    (respond
     (tab-content
      (find-tab
       (parse-integer id))))))

@route app "/reload"
(defview reload-view ()
  (reload)
  (redirect "/"))

@route app "/js"
(defview get-js ()
  (respond (gen-js)))
