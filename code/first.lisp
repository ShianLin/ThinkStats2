#|(format t "Hello World~%")
(defun hello-world()(format t "Hello World"))
(hello-world)
|#
;;single line cpmments starts
#|
Here is a nulti-line comment
test
|#

;; Improved demo code
(with-test (:name :aprof-instance :skipped-on (not :immobile-space))
  (let (seen-this seen-that)
    (dolist (line (split-string
                   (with-output-to-string (s)
                     (sb-aprof:aprof-run #'make-structs :stream s))
                   #\newline))
      (when (search "THIS-STRUCT" line) 
        (setq seen-this t)) 
      (when (search "THAT-STRUCT" line) 
        (setq seen-that t)))
    (assert (and seen-this seen-that))))

(defun my-list (&rest x)
  (declare (optimize sb-c::instrument-consing))
  x)

(compile 'my-list)

#+nil
(let ((hash-table-alist (sb-impl::%hash-table-alist sb-c::*checkgen-used-types*)))
  (format t "~&Types needed by checkgen: ('+' = has internal error number)~%")
  (setq hash-table-alist (sort hash-table-alist #'> :key #'cadr))
  (loop for (type-spec count interr-p) in hash-table-alist
        do (format t "~:[~;+~] ~5D ~5~%" interr-p count type-spec))
  (format t "~&Error numbers not used by checkgen:~%")
  (loop for (spec symbol) across sb-c:+backend-internal-errors+
        when (and (not (stringp spec))
                  (not (gethash spec sb-c::*checkgen-used-types*)))
        do (format t "~5~%" spec)))
