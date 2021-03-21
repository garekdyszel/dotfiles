;;; arduino-cli-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "arduino-cli-mode" "arduino-cli-mode.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from arduino-cli-mode.el

(autoload 'arduino-cli-mode "arduino-cli-mode" "\
arduino-cli integration for Emacs.

If called interactively, enable Arduino-Cli mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "arduino-cli-mode" '("arduino-cli-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; arduino-cli-mode-autoloads.el ends here
