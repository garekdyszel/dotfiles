;;; csound-mode-autoloads.el --- automatically extracted autoloads
;;
;;; Code:

(add-to-list 'load-path (directory-file-name
                         (or (file-name-directory #$) (car load-path))))


;;;### (autoloads nil "csound-eldoc" "csound-eldoc.el" (0 0 0 0))
;;; Generated autoloads from csound-eldoc.el

(autoload 'csound-eldoc-function "csound-eldoc" "\
Returns a doc string appropriate for the current context, or nil." nil nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "csound-eldoc" '("csound-eldoc-")))

;;;***

;;;### (autoloads nil "csound-font-lock" "csound-font-lock.el" (0
;;;;;;  0 0 0))
;;; Generated autoloads from csound-font-lock.el

(defvar csound-font-lock-list 'nil)

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "csound-font-lock" '("csound-font-lock-")))

;;;***

;;;### (autoloads nil "csound-indentation" "csound-indentation.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from csound-indentation.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "csound-indentation" '("csound-indentation-")))

;;;***

;;;### (autoloads nil "csound-mode" "csound-mode.el" (0 0 0 0))
;;; Generated autoloads from csound-mode.el

(autoload 'csound-mode "csound-mode" "\
A major mode for interacting and coding Csound

\(fn)" t nil)

(add-to-list 'auto-mode-alist `(,(concat "\\." (regexp-opt '("csd" "orc" "sco" "udo")) "\\'") . csound-mode))

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "csound-mode" '("csound-")))

;;;***

;;;### (autoloads nil "csound-repl" "csound-repl.el" (0 0 0 0))
;;; Generated autoloads from csound-repl.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "csound-repl" '("csound-repl-")))

;;;***

;;;### (autoloads nil "csound-repl-interaction" "csound-repl-interaction.el"
;;;;;;  (0 0 0 0))
;;; Generated autoloads from csound-repl-interaction.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "csound-repl-interaction" '("csound-repl-interaction-" "read-csound-repl")))

;;;***

;;;### (autoloads nil "csound-score" "csound-score.el" (0 0 0 0))
;;; Generated autoloads from csound-score.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "csound-score" '("csound-score-")))

;;;***

;;;### (autoloads nil "csound-skeleton" "csound-skeleton.el" (0 0
;;;;;;  0 0))
;;; Generated autoloads from csound-skeleton.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "csound-skeleton" '("csound-skeleton-")))

;;;***

;;;### (autoloads nil "csound-util" "csound-util.el" (0 0 0 0))
;;; Generated autoloads from csound-util.el

(if (fboundp 'register-definition-prefixes) (register-definition-prefixes "csound-util" '("csound-util-")))

;;;***

;;;### (autoloads nil nil ("csound-mode-pkg.el" "csound-opcodes.el")
;;;;;;  (0 0 0 0))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; csound-mode-autoloads.el ends here
