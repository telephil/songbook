(defsystem songbook
  :author "Philippe Mechai <philippe.mechai@gmail.com>"
  :maintainer "Philippe Mechai <philippe.mechai@gmail.com>"
  :license "MIT"
  :version "0.1"
  :homepage "https://github.com/telephil/songbook"
  :bug-tracker "https://github.com/telephil/songbook/issues"
  :source-control (:git "git@github.com:telephil/songbook.git")
  :depends-on (:lucerne
               :iterate
               :ceramic
               :uiop
               :cl-ppcre)
  :components ((:module "assets"
                :components
                ((:module "css"
                  :components
		  ((:static-file "style.css")
		   (:static-file "bootstrap.min.css")))
		 (:module "js"
		  :components
		  ((:static-file "scripts.js")))))
	       (:module "src"
		:serial t
		:components
		((:file "package")
		 (:file "tab")
		 (:file "model")
		 (:file "webapp")
		 (:file "songbook"))))
  :description "Explorer for guitar tabs in text format"
  :long-description
  #.(uiop:read-file-string
     (uiop:subpathname *load-pathname* "README.md")))