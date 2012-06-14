;;;; library.lisp

(cl:in-package :dasm)

(cffi:define-foreign-library libdasm
  (:windows "libdasm.dll")
  (:unix "libdasm.so"))

(cffi:use-foreign-library libdasm)

