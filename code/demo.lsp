#|
(defun fib(n)
  "return the nth Fibonacci number."
  (if (< n 2)
      n
      (+ (fib(- n 1))
         (fib(- n 2))
      )
  )
)

(fib 30)

|#
;; demo code
(with-test (:name :aprof-instance :skipped-on (not :immobile-space))

(let (seen-this seen-that)
(dolist (line (split-string
(with-output-to-string (s)
(sb-aprof:aprof-run #'make-structs :stream s))
#\newline))
(when (search "THIS-STRUCT" line) (setq seen-this t)) (when (search "THAT-STRUCT" line) (setq seen-that t)))
(assert (and seen-this seen-that))))
(defun my-list (&rest x)
(declare (optimize sb-c::instrument-consing))
X)
(compile 'my-list)
#+nil
(let ((1 (sb-impl::%hash-table-alist sb-c: :*checkgen-used-types*)))
(format t "~&Types needed by checkgen: ('+' = has internal error number)~%")
(setq 1 (sort 1 #' > :key #'cadr))
(loop for (type-spec. (count • interr-p)) in 1
do (format t "~:[~;+~] ~5D ~5~%" interr-p count type-spec))
(format t "~&Error numbers not used by checkgen:~%") (loop for (spec symbol) across sb-c:+backend-internal-errors+
when (and (not (stringp spec))
(not (gethash spec sb-c::*checkgen-used-types*)))
do (format t "
~5~%"' spec)))