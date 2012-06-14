;;;; net.phorni.dasm.asd

(asdf:defsystem :net.phorni.dasm
  :description ""
  :author "kurohuku"
  :version "0.1"
  :serial t
  :depends-on (:cffi)
  :components ((:file "package")
	       (:file "library")
	       (:file "dasm")
	       (:file "util")))
