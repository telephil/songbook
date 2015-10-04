(setf sb-impl::*default-external-format* :utf-8)

(ql:quickload :uiop)
(ql:quickload :sb-daemon)
(ql:quickload :swank)
(ql:quickload :songbook)

(defparameter *swank-port* 40001)

(progn
  (defparameter *running* nil)
  (defun launch-app (argv)
    (unless (= 1 (length argv))
      (uiop:die 1 "not enough arguments (expected 1 but got ~a)~%" (length argv)))
    (sb-daemon:daemonize :output "/tmp/songbook.out"
                         :error "/tmp/songbook.error"
                         :pidfile "/tmp/songbook.pid"
                         :exit-parent t
                         :sigterm (lambda (sig)
                                    (declare (ignore sig))
                                    (setf *running* nil)))
    (swank:create-server :port *swank-port* :dont-close t)
    (setf *running* t)
    (songbook:browse (pathname (first argv)))
    (loop while *running* do (sleep 10))
    (songbook:shutdown)
    (swank:stop-server *swank-port*)
    (uiop:quit))
  (launch-app (uiop:command-line-arguments)))
