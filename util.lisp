;;;; util.lisp

(cl:in-package :dasm)

(defun code->instruction (ptr &optional (mode :mode-32))
  (cffi:with-foreign-objects
      ((inst 'INSTRUCTION)
       (str :char 256))
    (let ((n (get-instruction inst ptr mode)))
      (get-instruction-string inst :format-intel 0 str 256)
      (list
       (cffi:pointer-address ptr)
       n
       (cffi:foreign-string-to-lisp str :max-chars 256)))))

	  
(defun code->instruction-list (ptr len &optional (mode :mode-32))
  (let ((n 0)
	(result nil))
    (loop
       :while (< n len)
       :do
       (let ((inst (code->instruction (cffi:inc-pointer ptr n) mode)))
	 (push inst result)
	 (incf n (second inst))))
    (nreverse result)))

	