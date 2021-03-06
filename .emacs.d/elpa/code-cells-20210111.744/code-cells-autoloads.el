;;; code-cells-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "code-cells" "code-cells.el" (0 0 0 0))
;;; Generated autoloads from code-cells.el

(autoload 'code-cells-forward-cell "code-cells" "\
Move to the next cell boundary, or end of buffer.
With ARG, repeat this that many times.  If ARG is negative, move
backward.

\(fn &optional ARG)" t nil)

(autoload 'code-cells-backward-cell "code-cells" "\
Move to the previous cell boundary, or beginning of buffer.
With ARG, repeat this that many times.  If ARG is negative, move
forward.

\(fn &optional ARG)" t nil)

(autoload 'code-cells-do "code-cells" "\
Find current cell bounds and evaluate BODY.
Inside BODY, the variables `start' and `end' are bound to the
limits of the current cell.

If the first element of BODY is the keyword `:use-region' and the
region is active, use its bounds instead.  In this case,
`using-region' is non-nil in BODY.

\(fn &rest BODY)" nil t)

(autoload 'code-cells-mark-cell "code-cells" "\
Put point at the beginning of this cell, mark at end." t nil)

(autoload 'code-cells-command "code-cells" "\
Return an anonymous command that calls FUN on the current cell.

FUN is a function that takes two character positions as argument.
Most interactive commands that act on a region are of this form
and can be used here.

If OPTIONS contains the keyword :use-region, the command will act
on the region instead of the current cell when appropriate.

If OPTIONS contains the keyword :pulse, provide visual feedback
via `pulse-momentary-highlight-region'.

\(fn FUN &rest OPTIONS)" nil nil)

(autoload 'code-cells-mode "code-cells" "\
Minor mode for cell-oriented code.

If called interactively, enable Code-Cells mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(autoload 'code-cells-convert-ipynb "code-cells" "\
Convert buffer from ipynb format to a regular script." nil nil)

(autoload 'code-cells-write-ipynb "code-cells" "\
Convert buffer to ipynb format and write to FILE.
Interactively, asks for the file name.  When called from Lisp,
FILE defaults to the current buffer file name.

\(fn &optional FILE)" t nil)

(add-to-list 'auto-mode-alist '("\\.ipynb\\'" . code-cells-convert-ipynb))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "code-cells" '("code-cells-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; code-cells-autoloads.el ends here
