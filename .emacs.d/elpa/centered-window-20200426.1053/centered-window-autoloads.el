;;; centered-window-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "centered-window" "centered-window.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from centered-window.el

(autoload 'centered-window-mode-toggle "centered-window" nil nil nil)

(defvar centered-window-mode nil "\
Non-nil if Centered-Window mode is enabled.
See the `centered-window-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `centered-window-mode'.")

(custom-autoload 'centered-window-mode "centered-window" nil)

(autoload 'centered-window-mode "centered-window" "\
Minor mode to center text on the current buffer

If called interactively, enable Centered-Window mode if ARG is
positive, and disable it if ARG is zero or negative.  If called
from Lisp, also enable the mode if ARG is omitted or nil, and
toggle it if ARG is `toggle'; disable the mode otherwise.

\(fn &optional ARG)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "centered-window" '("cwm-")))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; centered-window-autoloads.el ends here
