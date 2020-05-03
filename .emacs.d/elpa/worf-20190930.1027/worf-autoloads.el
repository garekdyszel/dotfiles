;;; worf-autoloads.el --- automatically extracted autoloads
;;
;;; Code:
(add-to-list 'load-path (directory-file-name (or (file-name-directory #$) (car load-path))))

;;;### (autoloads nil "worf" "worf.el" (23998 56988 716430 536000))
;;; Generated autoloads from worf.el

(autoload 'worf-mode "worf" "\
Minor mode for navigating and editing `org-mode' files.

When `worf-mode' is on, various unprefixed keys call commands
if the (looking-back \"^*+\") is true.

\\{worf-mode-map}

\(fn &optional ARG)" t nil)

(autoload 'worf-archive "worf" "\


\(fn)" t nil)

(autoload 'worf-archive-and-commit "worf" "\


\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("elpa.el" "worf-pkg.el") (23998 56988
;;;;;;  764429 951000))

;;;***

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; End:
;;; worf-autoloads.el ends here
