(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)

(when (not (package-installed-p 'elnode))
     (package-refresh-contents)
     (package-install 'elnode))

(require 'elnode)

(defun my-test-handler (httpcon)
  "Demonstration function"
  (elnode-http-start httpcon 200 '("Content-type" . "text/html"))
  (elnode-http-return httpcon (format "<html><h1>Hello Elnode</h1><p>%s</p></html>" (emacs-version))))

(elnode-start 'my-test-handler :port (getenv "PORT") :host "0.0.0.0")

(while t
  (accept-process-output nil 1))
