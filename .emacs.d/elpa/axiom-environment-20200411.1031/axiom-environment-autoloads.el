;;; axiom-environment-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "axiom-base" "axiom-base.el" (0 0 0 0))
;;; Generated autoloads from axiom-base.el

(let ((loads (get 'axiom 'custom-loads))) (if (member '"axiom-base" loads) nil (put 'axiom 'custom-loads (cons '"axiom-base" loads))))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "axiom-base" '("axiom-")))

;;;***

;;;### (autoloads nil "axiom-boot-mode" "axiom-boot-mode.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from axiom-boot-mode.el

(autoload 'axiom-boot-mode "axiom-boot-mode" "\
Major mode for Axiom's internal Boot language.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "axiom-boot-mode" '("axiom-boot-")))

;;;***

;;;### (autoloads nil "axiom-buffer-menu" "axiom-buffer-menu.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from axiom-buffer-menu.el

(autoload 'axiom-buffer-menu-mode "axiom-buffer-menu" "\
Major mode for giving users quick-access to Axiom buffers.
\\<axiom-buffer-menu-mode-map>
\\[axiom-buffer-menu-cycle-groups-forward] -- move to next buffer group (file, directory or scratch).
\\[axiom-buffer-menu-cycle-groups-backward] -- move to previous buffer group (file, directory or scratch).
\\[axiom-buffer-menu-cycle-forward] -- move to next active line.
\\[axiom-buffer-menu-cycle-backward] -- move to previous active line.
\\[axiom-buffer-menu-select] -- select the buffer named on the current line.
\\[axiom-buffer-menu-mouse-select] -- select the buffer clicked on with mouse-1.
\\[axiom-buffer-menu-select-other-window] -- display the buffer named on the current line in another window.
\\[axiom-buffer-menu-kill-buffer] -- kill the buffer named on the current line.
\\[axiom-buffer-menu-bury-buffer] -- bury the buffer named on the current line (move to bottom of list).
\\[axiom-buffer-menu-quit] -- kill the menu buffer, return to previous buffer.
\\[describe-mode] -- describe mode.

\(fn)" t nil)

(autoload 'axiom-buffer-menu "axiom-buffer-menu" "\
Display a list of Axiom buffers." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "axiom-buffer-menu" '("axiom-buffer-menu-")))

;;;***

;;;### (autoloads nil "axiom-environment" "axiom-environment.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from axiom-environment.el

(add-to-list 'auto-mode-alist '("\\.input" . axiom-input-mode))

(add-to-list 'auto-mode-alist '("\\.spad" . axiom-spad-mode))

(add-to-list 'auto-mode-alist '("\\.boot" . axiom-boot-mode))

;;;***

;;;### (autoloads nil "axiom-help-mode" "axiom-help-mode.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from axiom-help-mode.el

(autoload 'axiom-help-mode "axiom-help-mode" "\
Major mode for Axiom Help buffers.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "axiom-help-mode" '("axiom-help-")))

;;;***

;;;### (autoloads nil "axiom-input-mode" "axiom-input-mode.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from axiom-input-mode.el

(autoload 'axiom-input-mode "axiom-input-mode" "\
Major mode for the Axiom-Input interactive language.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "axiom-input-mode" '("axiom-input-")))

;;;***

;;;### (autoloads nil "axiom-process-mode" "axiom-process-mode.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from axiom-process-mode.el

(autoload 'axiom-process-redirect-send-command "axiom-process-mode" "\
Send COMMAND to Axiom and put result in OUTPUT-BUFFER.

If DISPLAY is non-nil then display the result buffer.

If ECHO-CMD is non-nil then copy the command to the process buffer,
and if ECHO-RESULT is non-nil then also copy the result too.

If OP-CMD is non-nil then include command in output to
OUTPUT-BUFFER.  If OP-PROMPT is non-nil then also include
prompt in output to OUTPUT-BUFFER.

\(fn COMMAND OUTPUT-BUFFER &optional DISPLAY ECHO-CMD ECHO-RESULT OP-CMD OP-PROMPT)" nil nil)

(autoload 'axiom-process-find-constructor-source "axiom-process-mode" "\
Attempt to find the SPAD source for the given constructor.

Invoke a grep shell-command looking in the directories specified by
`axiom-process-spad-source-dirs'.  Return a list containing
a filename and a line number.

\(fn NAME-OR-ABBREV)" nil nil)

(autoload 'axiom-process-eval-region "axiom-process-mode" "\
Evaluate the given region in the Axiom process.

\(fn START END &optional NO-DISPLAY)" t nil)

(autoload 'axiom-process-read-region "axiom-process-mode" "\
Copy region into a temporary file and )read it.

\(fn START END &optional NO-DISPLAY)" t nil)

(autoload 'axiom-process-read-file "axiom-process-mode" "\
Tell the Axiom process to read FILENAME.

If NO-DISPLAY is nil then also display the Axiom process buffer.

\(fn FILENAME &optional NO-DISPLAY)" t nil)

(autoload 'axiom-process-read-buffer "axiom-process-mode" "\
Read the current buffer into the Axiom process.

If NO-DISPLAY is nil then also display the Axiom process buffer.

\(fn &optional NO-DISPLAY)" t nil)

(autoload 'axiom-process-compile-file "axiom-process-mode" "\
Tell the Axiom process to compile FILENAME.

If NO-DISPLAY is nil then display the Axiom compilation results
buffer, otherwise do not display it.

\(fn FILENAME &optional NO-DISPLAY)" t nil)

(autoload 'axiom-process-compile-buffer "axiom-process-mode" "\
Compile the current buffer in the Axiom process.

If NO-DISPLAY is nil then display the Axiom compilation results
buffer, otherwise do not display it.

\(fn &optional NO-DISPLAY)" t nil)

(autoload 'axiom-process-show-constructor "axiom-process-mode" "\
Show information about NAME-OR-ABBREV in a popup buffer.

Works by calling ``)show NAME-OR-ABBREV'' in the Axiom process and
capturing its output.  When called interactively completion is
performed over all standard constructor names (packages, domains and
categories) and their abbreviations.

If the buffer already exists (from a previous call) then just switch
to it, unless FORCE-UPDATE is non-nil in which case the buffer is
reconstructed with another query to the Axiom process.

Interactively, FORCE-UPDATE can be set with a prefix argument.

\(fn NAME-OR-ABBREV &optional FORCE-UPDATE)" t nil)

(autoload 'axiom-process-show-package "axiom-process-mode" "\
Show information about NAME-OR-ABBREV in a popup buffer.

Works by calling ``)show NAME-OR-ABBREV'' in the Axiom process and
capturing its output.  When called interactively completion is
performed over all standard package names.

If the buffer already exists (from a previous call) then just switch
to it, unless FORCE-UPDATE is non-nil in which case the buffer is
reconstructed with another query to the Axiom process.

Interactively, FORCE-UPDATE can be set with a prefix argument.

\(fn NAME-OR-ABBREV &optional FORCE-UPDATE)" t nil)

(autoload 'axiom-process-show-domain "axiom-process-mode" "\
Show information about NAME-OR-ABBREV in a popup buffer.

Works by calling ``)show NAME-OR-ABBREV'' in the Axiom process and
capturing its output.  When called interactively completion is
performed over all standard domain names.

If the buffer already exists (from a previous call) then just switch
to it, unless FORCE-UPDATE is non-nil in which case the buffer is
reconstructed with another query to the Axiom process.

Interactively, FORCE-UPDATE can be set with a prefix argument.

\(fn NAME-OR-ABBREV &optional FORCE-UPDATE)" t nil)

(autoload 'axiom-process-show-category "axiom-process-mode" "\
Show information about NAME-OR-ABBREV in a popup buffer.

Works by calling ``)show NAME-OR-ABBREV'' in the Axiom process and
capturing its output.  When called interactively completion is
performed over all standard category names.

If the buffer already exists (from a previous call) then just switch
to it, unless FORCE-UPDATE is non-nil in which case the buffer is
reconstructed with another query to the Axiom process.

Interactively, FORCE-UPDATE can be set with a prefix argument.

\(fn NAME-OR-ABBREV &optional FORCE-UPDATE)" t nil)

(autoload 'axiom-process-display-operation "axiom-process-mode" "\
Show information about OPERATION-NAME in a popup buffer.

Works by calling ``)display operation OPERATION-NAME'' in the Axiom
process and capturing its output.  When called interactively
completion is performed over all standard operation names.

If the buffer already exists (from a previous call) then just switch
to it, unless FORCE-UPDATE is non-nil in which case the buffer is
reconstructed with another query to the Axiom process.

Interactively, FORCE-UPDATE can be set with a prefix argument.

\(fn OPERATION-NAME &optional FORCE-UPDATE)" t nil)

(autoload 'axiom-process-apropos-thing-at-point "axiom-process-mode" "\
Show information about NAME in a popup buffer.

When called interactively NAME defaults to the word around point, and
completion is performed over all standard constructor and operation
names.

If NAME is a standard constructor name then call ``)show NAME'' in the
Axiom process and capture its output, otherwise assume it's an
operation name and call ``)display operation NAME'' instead.  This can
be overridden by setting IS-CONSTRUCTOR non-nil, in which case ``)show
NAME'' will always be called.  Interactively this can be done with a
prefix argument.

\(fn NAME &optional IS-CONSTRUCTOR)" t nil)

(autoload 'axiom-process-webview-constructor "axiom-process-mode" "\
Show information about NAME-OR-ABBREV in a web browser.

Invokes `browse-url' on a URL made by appending the given
constructor name and .html to the base URL held in customizable
variable `axiom-process-webview-url'.

\(fn NAME-OR-ABBREV)" t nil)

(autoload 'axiom-process-edit-constructor-source "axiom-process-mode" "\
Open the SPAD source file containing NAME-OR-ABBREV.

\(fn NAME-OR-ABBREV)" t nil)

(autoload 'axiom-process-mode "axiom-process-mode" "\
Major mode for interaction with a running Axiom process.

\(fn)" t nil)

(autoload 'run-axiom "axiom-process-mode" "\
Run an Axiom process in a buffer using program command line CMD.

The name of the buffer is given by variable
`axiom-process-buffer-name', and uses major mode `axiom-process-mode'.
With a prefix argument, allow CMD to be edited first (default is value
of `axiom-process-program').  If there is a process already running
then simply switch to it.

\(fn CMD)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "axiom-process-mode" '("axiom-process-" "with-axiom-process-query-buffer")))

;;;***

;;;### (autoloads nil "axiom-selector" "axiom-selector.el" (0 0 0
;;;;;;  0))
;;; Generated autoloads from axiom-selector.el

(autoload 'axiom-selector "axiom-selector" "\
Invoke a selector function by entering a single character.

The user is prompted for a single character indicating the
desired function. The `?' character describes the available
functions.  See `define-axiom-selector-function' for defining new
functions." t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "axiom-selector" '("??" "?a" "?b" "?i" "?q" "?r" "?s" "axiom-" "define-axiom-selector-function")))

;;;***

;;;### (autoloads nil "axiom-spad-mode" "axiom-spad-mode.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from axiom-spad-mode.el

(autoload 'axiom-spad-mode "axiom-spad-mode" "\
Major mode for Axiom's SPAD language.

\(fn)" t nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "axiom-spad-mode" '("axiom-spad-")))

;;;***

;;;### (autoloads nil nil ("axiom-environment-pkg.el") (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; axiom-environment-autoloads.el ends here
