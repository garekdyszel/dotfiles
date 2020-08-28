;; Revised version of .emacs, created in Sept 2019.
;; Exclusively uses use-package where possible.

;;----- EMACS CONFIG STARTS HERE -----
;; set up package.el
(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'package-archives 
             '("org" . "https://orgmode.org/elpa/") t)
(package-initialize)

;; make sure use-package is always installed, even if it's not right away.
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; ensure all packages are installed, all the time
(require 'use-package-ensure)
(setq use-package-always-ensure t)

;; set up use-package
(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; turn off shortcuts that we fat-finger frequently.
(dolist (key '("\C-z" "\C-x\C-z" "\C-x\C-c" "\C-x\C-u" "\C-xs" "\C-o" "\C-n")) (global-unset-key key))

;; ensure save and quit remains the same as default Emacs binding
;; (global-set-key (kbd "C-x C-c") 'save-buffers-kill-terminal)

;; set up keyboard shortcuts to jump to commonly-used files.
(global-set-key (kbd "\C-ctd") (lambda () (interactive) (find-file "~/notes/org/todolist.org")))
(global-set-key (kbd "\C-ctp") (lambda () (interactive) (find-file "~/rsch/current_projects/.projects/projects")))
(global-set-key (kbd "\C-cj") (lambda () (interactive) (find-file "~/notes/org/jot")))
;; (global-set-key (kbd "\C-cd") (lambda () (interactive) (find-file "~/notes/org/done")))
;; (global-set-key (kbd "\C-cs") (lambda () (interactive) (find-file "~/tmp/latextmp.tex")))

;; class keybindings for Fall 2020
(global-set-key (kbd "\C-cbe") (lambda () (interactive) (find-file "~/uni/bachelor_4/electronic_materials/")))
(global-set-key (kbd "\C-cbm") (lambda () (interactive) (find-file "~/uni/bachelor_4/microcontrollers/")))
(global-set-key (kbd "\C-cbo") (lambda () (interactive) (find-file "~/uni/bachelor_4/optics/")))
(global-set-key (kbd "\C-cbp") (lambda () (interactive) (find-file "~/uni/bachelor_4/probability/")))
(global-set-key (kbd "\C-cbs") (lambda () (interactive) (find-file "~/uni/bachelor_4/senior_design/")))

;; change indentation size for CC mode.
(setq-default c-basic-offset 3)

;; add line numbers in programming modes
(add-hook 'prog-mode-hook 'display-line-numbers-mode)
(add-hook 'latex-mode-hook 'display-line-numbers-mode)
(add-hook 'org-mode-hook 'display-line-numbers-mode)

;; stop auto-removal of first-level tabs in latex export.
(setq TeX-auto-untabify 't)

;; stop indenting source code with tabs. Instead replace it with spaces.
(setq-default indent-tabs-mode nil)

;; ask 'y or n' instead of 'yes or no'.
(fset 'yes-or-no-p 'y-or-n-p)

;; .emacs shortcut
(global-set-key (kbd "\C-cem") (lambda () (interactive) (find-file "~/.emacs")))

;; enable parentheses checking
(show-paren-mode 1)

;; turn off that infernal overwrite mode activator that we keep fat-fingering
(global-unset-key (kbd "<insert>"))

;; make the compilation show up in a new window (not one of the ones we already have open)
                                        ;(setq display-buffer-alist
                                        ;      '("*compilation*"))

(setq special-display-function
      (lambda (buffer &optional args)
        (split-window)
        (switch-to-buffer buffer)
        (get-buffer-window buffer 0)))

;; change the default compile command for C files
;; (add-hook 'c-mode-hook
;;           (lambda ()
;;             (set (make-local-variable 'compile-command)
;;                  (format "g++ %s -o %s -g" (buffer-file-name) (file-name-sans-extension)))))

                                        ; from enberg on #emacs for compilation window killing
(add-hook 'compilation-finish-functions
          (lambda (buf str)
            (if (null (string-match ".*exited abnormally.*" str))
                ;;no errors, make the compilation window go away in a few seconds
                (progn
                  (run-at-time
                   "2 sec" nil 'delete-windows-on
                   (get-buffer-create "*compilation*"))
                  (message "No Compilation Errors!")))))

;; replace kill-word and backward-kill-word with commands that are easier to predict
;; also make the kill-whole-line command delete the line instead.
(bind-key "M-<delete>" 'nil)
(bind-key "M-d" 'nil)
(bind-key "C-S-<backspace>" 'nil)
(bind-key "C-<backspace>" 'nil)

(defun delete-word (arg)
  "Delete characters forward until encountering the end of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-region (point) (progn (forward-word arg) (point))))

(defun backward-delete-word (arg)
  "Delete characters backward until encountering the beginning of a word.
With argument ARG, do this that many times."
  (interactive "p")
  (delete-word (- arg)))

(defun delete-current-line ()
  "Deletes the current line"
  (interactive)
  (delete-region
   (line-beginning-position)
   (line-end-position)))

(bind-key "M-<delete>" 'delete-word)
(bind-key "C-<backspace>" 'backward-delete-word)
(bind-key "C-S-<backspace>" 'delete-current-line)

;; remap yank to cua-paste
(bind-key "M-y" 'nil)
(bind-key "C-M-y" 'cua-paste)


;; duplicate lines function
(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (forward-line 1)
  (yank))
(global-set-key (kbd "C-p") nil)
(global-set-key (kbd "C-p") 'duplicate-line)

;; kill all other buffers except the current one
;; in a single command
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer 
        (delq (current-buffer) 
              (remove-if-not 'buffer-file-name (buffer-list)))))

;; change default cursor style to bar instead of rectangle
(setq-default cursor-type 'bar)

;; vim-like keybindings for movement
;; (bind-key "s-j" 'backward-char)
;; (bind-key "s-k" 'next-line)
;; (bind-key "s-i" 'previous-line)
;; (bind-key "s-l" 'forward-char)
;; (bind-key "M-s-j" 'left-word)
;; (bind-key "M-s-k" 'forward-paragraph)
;; (bind-key "M-s-l" 'right-word)
;; (bind-key "M-s-i" 'backward-paragraph)

;; ---- custom-set-variables ----
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-indent-environment-list
   '(("verbatim" current-indentation)
     ("verbatim*" current-indentation)
     ("tabular" LaTeX-indent-tabular)
     ("tabular*" LaTeX-indent-tabular)
     ("align" LaTeX-indent-tabular)
     ("align*" LaTeX-indent-tabular)
     ("array" LaTeX-indent-tabular)
     ("eqnarray" LaTeX-indent-tabular)
     ("eqnarray*" LaTeX-indent-tabular)
     ("displaymath")
     ("equation")
     ("equation*")
     ("picture")
     ("tabbing")
     ("circuitikz")
     ("tikzpicture")))
 '(Linum-format "%7i ")
 '(TeX-command-list
   '(("TeX" "%(PDF)%(tex) %(file-line-error) %`%(extraopts) %S%(PDFout)%(mode)%' %t" TeX-run-TeX nil
      (plain-tex-mode texinfo-mode ams-tex-mode)
      :help "Run plain TeX")
     ("LaTeX" "%`%l%(mode)%' %T" TeX-run-TeX nil
      (latex-mode doctex-mode)
      :help "Run LaTeX")
     ("Makeinfo" "makeinfo %(extraopts) %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with Info output")
     ("Makeinfo HTML" "makeinfo %(extraopts) --html %t" TeX-run-compile nil
      (texinfo-mode)
      :help "Run Makeinfo with HTML output")
     ("AmSTeX" "amstex %(PDFout) %`%(extraopts) %S%(mode)%' %t" TeX-run-TeX nil
      (ams-tex-mode)
      :help "Run AMSTeX")
     ("ConTeXt" "%(cntxcom) --once --texutil %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt once")
     ("ConTeXt Full" "%(cntxcom) %(extraopts) %(execopts)%t" TeX-run-TeX nil
      (context-mode)
      :help "Run ConTeXt until completion")
     ("BibTeX" "bibtex %s" TeX-run-BibTeX nil
      (plain-tex-mode latex-mode doctex-mode context-mode texinfo-mode ams-tex-mode)
      :help "Run BibTeX")
     ("Biber" "biber %s" TeX-run-Biber nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run Biber")
     ("View" "%V" TeX-run-discard-or-function t t :help "Run Viewer")
     ("Print" "%p" TeX-run-command t t :help "Print the file")
     ("Queue" "%q" TeX-run-background nil t :help "View the printer queue" :visible TeX-queue-command)
     ("File" "%(o?)dvips %d -o %f " TeX-run-dvips t
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Generate PostScript file")
     ("Dvips" "%(o?)dvips %d -o %f " TeX-run-dvips nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert DVI file to PostScript")
     ("Dvipdfmx" "dvipdfmx %d" TeX-run-dvipdfmx nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert DVI file to PDF with dvipdfmx")
     ("Ps2pdf" "ps2pdf %f" TeX-run-ps2pdf nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Convert PostScript file to PDF")
     ("Glossaries" "makeglossaries %s" TeX-run-command nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run makeglossaries to create glossary
     file")
     ("Index" "makeindex %s" TeX-run-index nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run makeindex to create index file")
     ("upMendex" "upmendex %s" TeX-run-index t
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run upmendex to create index file")
     ("Xindy" "texindy %s" TeX-run-command nil
      (plain-tex-mode latex-mode doctex-mode texinfo-mode ams-tex-mode)
      :help "Run xindy to create index file")
     ("Check" "lacheck %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for correctness")
     ("ChkTeX" "chktex -v6 %s" TeX-run-compile nil
      (latex-mode)
      :help "Check LaTeX file for common mistakes")
     ("Spell" "(TeX-ispell-document \"\")" TeX-run-function nil t :help "Spell-check the document")
     ("Clean" "TeX-clean" TeX-run-function nil t :help "Delete generated intermediate files")
     ("Clean All" "(TeX-clean t)" TeX-run-function nil t :help "Delete generated intermediate and output files")
     ("Other" "" TeX-run-command t t :help "Run an arbitrary command")))
 '(TeX-view-program-selection '((output-html "xdg-open")))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(auth-source-save-behavior nil)
 '(auto-fill-mode t)
 '(beacon-color "#cc6666")
 '(cdlatex-math-modify-alist nil)
 '(cdlatex-math-modify-prefix "/")
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(cua-enable-cua-keys nil)
 '(cua-mode t nil (cua-base))
 '(cua-normal-cursor-color "black")
 '(custom-enabled-themes '(srcery))
 '(custom-safe-themes
   '("efbd20364f292a1199d291dfaff28cc1fd89fff5b38e314bd7e40121f5c465b4" "bbbd58d82a60c4913b00db1ecab1938ddcb0378225a1a3e54d840f36370d86c6" "2d835b43e2614762893dc40cbf220482d617d3d4e2c35f7100ca697f1a388a0e" "a77ced882e25028e994d168a612c763a4feb8c4ab67c5ff48688654d0264370c" "0dd2666921bd4c651c7f8a724b3416e95228a13fca1aa27dc0022f4e023bf197" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "d707aeee54d91b181a267a473862ebf0e20502c9bca8bef078b0a226b9581dd2" "a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" default))
 '(doc-view-continuous t)
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#383838")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(frame-background-mode 'dark)
 '(frame-title-format "%b" t)
 '(fringe-mode 4 nil (fringe))
 '(global-pretty-mode t)
 '(global-visual-line-mode t)
 '(gnus-delay-default-hour 7)
 '(helm-completion-style 'emacs)
 '(inhibit-startup-screen t)
 '(main-line-color1 "#1E1E1E")
 '(main-line-color2 "#111111")
 '(main-line-separator-style 'chamfer)
 '(major-mode 'org-mode)
 '(message-send-mail-function 'sendmail-query-once)
 '(notmuch-saved-searches
   '((:name "inbox" :query "tag:inbox" :key "i")
     (:name "flagged" :query "tag:flagged" :key "f")
     (:name "sent" :query "tag:sent" :key "t")
     (:name "drafts" :query "tag:draft" :key "d")
     (:name "all mail" :query "*" :key "a")
     (:name "unread" :query "tag:unread")))
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#93E0E3" "#94BFF3" "#DC8CC3"))
 '(org-agenda-files
   '("~/rsch/current_projects/espin_theory_repo/espin_theory/deal-ii-simulator/two_electrodes/TODO" "~/notes/org/todolist.org" "~/rsch/current_projects/.projects/projects"))
 '(org-highlight-latex-and-related '(latex entities))
 '(org-latex-classes '(("article" "\\documentclass[12pt]{article}" ("" . ""))))
 '(org-preview-latex-default-process 'dvipng)
 '(org-ref-default-citation-link "cite")
 '(org-ref-insert-cite-key "C-c 0")
 '(package-selected-packages
   '(csound-mode php-mode yasnippet-snippets mu4e magic-latex-buffer auctex-latexmk cdlatex ox-reveal srcery emmet-mode emmet use-package-el-get org-ref mermaid-mode org-super-agenda ob-mermaid undo-tree css-eldoc c-eldoc latex-math-preview srcery-theme cyberpunk-theme soothe-theme jupyter restart-emacs scad-mode ein org-re-reveal-ref magit sage-shell-mode org-drill org-plus-contrib org-babel-eval-in-repl matlab-mode ov tab-jump-out org-link-minor-mode auctex company-mode ox-org yasnippet zenburn-theme anki-editor gnuplot ## pdf-view-restore org-pdfview ox-bibtex-chinese org-noter org htmlize))
 '(pdf-view-midnight-colors '("#DCDCCC" . "#383838"))
 '(powerline-color1 "#1E1E1E")
 '(powerline-color2 "#111111")
 '(python-shell-interpreter "/usr/bin/python3")
 '(python-shell-virtualenv-root "/usr/bin/python3")
 '(send-mail-function 'mailclient-send-it)
 '(show-paren-mode t)
 '(tab-width 3)
 '(texmathp-tex-commands '(("align" env-on)))
 '(tool-bar-mode nil)
 '(truncate-partial-width-windows 0)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#93E0E3")
     (280 . "#6CA0A3")
     (300 . "#7CB8BB")
     (320 . "#8CD0D3")
     (340 . "#94BFF3")
     (360 . "#DC8CC3")))
 '(vc-annotate-very-old-color "#DC8CC3")
 '(window-divider-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "DejaVu Sans Mono" :foundry "PfEd" :slant normal :weight normal :height 165 :width normal)))))


;; ----- PACKAGE CONFIG STARTS HERE -----

;; This is only needed once, near the top of the file
(eval-when-compile
  ;; Following line is not needed if use-package.el is in ~/.emacs.d
  ;; (add-to-list 'load-path "<path where use-package is installed>")
  (require 'use-package))

;; set up theme
(use-package srcery-theme
  :config
  (load-theme 'srcery))

;; grab the overlay package, so we can color Org-mode text in buffer and in export
;; (use-package ov
;;   :ensure t)

;; Org-mode: The following lines are always needed.  Choose your own keys.
(use-package org
  :ensure org-plus-contrib
  :bind (("\C-cl" . org-store-link)
         ("\C-ca" . org-agenda)
         ("\C-cc" . org-capture)
         ;;("\C-cb" . org-switchb)
         )
  :config
  (add-hook 'org-mode-hook 'visual-line-mode)
  (define-key org-mode-map (kbd "C-,") nil)
  (setq org-log-done t)


  ;; fix org-babel!
  (defun org-babel-get-header (params key &optional others)
    (delq nil
          (mapcar
           (lambda (p) (when (funcall (if others #'not #'identity) (eq (car p) key)) p))
           params)))
  
  ;; setup matlab in babel
  (setq org-babel-default-header-args:matlab
        '((:results . "output") (:session . "*MATLAB*")))

  ;; load languages to use in source code blocks.
  (org-babel-do-load-languages
   'org-babel-load-languages '(
                               (C . t)
                               (org . t)
                               (ledger . t)
                               (octave . t)
                               (asymptote . t)
                               (matlab . t)
                               (python . t)
                               (latex . t)))

  (setq org-babel-python-command "python3")

  ;; redisplay images after running source code blocks.
  (add-hook 'org-babel-after-execute-hook 'org-redisplay-inline-images)

  ;; load all inline images on startup of org
  (setq org-display-inline-images t)

  ;; create other TODO categories
  (setq org-todo-keywords
        '((sequence "TODO" "NEXT" "INPROGRESS" "WAITING" "CHECK" "|" "DONE")))

  ;; take screenshot and insert into org file.
  (defun my-org-screenshot ()
    "Take a screenshot into a time stamped unique-named file in the
  same directory as the org-buffer and insert a link to this file."
    (interactive)
    (let ((filename
           (concat
            (make-temp-name
             (concat
              "./"
              (format-time-string "%Y%m%d_%H%M%S_")) ) ".png")))
      (call-process "scrot" nil nil nil "-s" filename)
      (insert (concat "[[" filename "]]"))
      (org-display-inline-images)))
  ;; key shortcut to use my-org-screenshot
  ;; (global-set-key (kbd "\C-cs") 'my-org-screenshot)
  
  ;; make sure citations compile correctly.
  (setq org-latex-pdf-process
        '("pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "bibtex %b"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"
          "pdflatex -shell-escape -interaction nonstopmode -output-directory %o %f"))

  ;; remove temporary latex files on pdf export
  (setq org-latex-logfiles-extensions (quote ("lof" "lot" "aux" "idx" "log" "out" "toc" "nav" "snm" "vrb" "dvi" "fdb_latexmk" "blg" "brf" "fls" "entoc" "ps" "spl" "bbl" "pygtex" "pygstyle")))

  ;; don't ask to evaluate source code blocks on export: just do it.
  (setq org-confirm-babel-evaluate nil)

  ;; Use imagemagick to preview in buffer.
  (setq org-preview-latex-default-process 'imagemagick)

  (add-to-list 'org-latex-packages-alist
               '("" "tikz" t))

  ;; (eval-after-load "preview"
  ;;   '(add-to-list 'preview-default-preamble "\\PreviewEnvironment{tikzpicture}" t))

  ;; set the default image size to 200 px x 200 px
  (setq org-default-image-size 200)

  ;; disable eldoc errors for when we try to use lilypond source code blocks in org-mode
  (global-eldoc-mode 1)

  ;; don't make the inline latex images so big.
  (setq org-image-actual-width nil)

  ;; make latex inline images larger
  (plist-put org-format-latex-options :scale 1.25))

;; set up org-ref & keybindings
(use-package org-ref
  :after org
  :ensure t
  :config
  ;;(global-set-key (kbd "\C-cd") 'doi-add-bibtex-entry)
  ;; set default directories for org-ref
  (setq org-ref-default-citation-link "cite")
  (setq org-ref-notes-directory "~/rsch/general_notes"
        org-ref-bibliography-notes "~/refs/general_notes"
        org-ref-default-bibliography '("~/rsch/refs/rsch-refs.bib")
        org-ref-pdf-directory "~/rsch/refs/"))

;; set up org-noter & keybindings
(use-package org-noter
  :after org
  :ensure t
  :config
  (global-set-key (kbd "\C-cn") 'org-noter)
  ;; set pdf viewing mode to pdf-tools at any time docview is called (uncomment if you want to do that)
  (defvar tv/prefer-pdf-tools (fboundp 'pdf-view-mode))
  (defun tv/start-pdf-tools-if-pdf ()
    (when (and tv/prefer-pdf-tools
               (eq doc-view-doc-type 'pdf))
      (pdf-view-mode)))
  (add-hook 'doc-view-mode-hook 'tv/start-pdf-tools-if-pdf))


;; allow us to prevent export of org headings with tag ":IGNORE:"
(use-package ox-extra
  :load-path "~/.emacs.d/lisp"
  :config
  (ox-extras-activate '(ignore-headlines)))

;; enable yasnippet (for latex snippets), set its dirs, and have it run as a minor mode in all major modes.
;; set yasnippet directories
(use-package yasnippet
  :ensure t
  :config
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
                                        ;"~/notes/org/snippets"))
  (yas-global-mode +1)

  ;; snippets for inconvenient stuff to type
  (yas-define-snippets 'latex-mode '(
                                     ("si" "\\SI{$1}{$2}" "si-units")
                                     ("cl" "\\documentclass[12pt]{report}
\\include{../preamble}
\\usepackage{cleveref}
\\begin{document}
$0

\\end{document}" "notes-class")
                                     ("se" "\\section{$1}" "section")
                                     ("su" "\\subsection{$1}" "subsection")))
  )

;; snippets for yasnippet, especially LaTeX
;;(use-package yasnippet-snippets)

;; emmet is like yasnippet, but better. It's used for HTML-like code only.
(use-package emmet-mode)

;; cdlatex-mode for lightning-fast latex editing
(use-package cdlatex
  :config
  (setq cdlatex-simplify-sub-super-scripts nil))

;; AucTex
(use-package tex
  :ensure auctex
  :config
  ;; expansion and contraction of outlines
  ;; TODO: redefine keybindings so they don't suck the life out of your hands
  (add-hook 'LaTeX-mode-hook #'outline-minor-mode)

  ;; display line numbers in all latex buffers
  (add-hook 'LaTeX-mode-hook 'display-line-numbers-mode)
  
  ;; extra outline headers 
  (setq TeX-outline-extra
        '(("%chapter" 1)
          ("%section" 2)
          ("%subsection" 3)
          ("%subsubsection" 4)
          ("%paragraph" 5)))
  (with-eval-after-load 'tex
    (add-to-list 'TeX-view-program-selection
                 '(output-pdf "xdg-open")))
  
  ;; add font locking to the headers
  (font-lock-add-keywords
   'latex-mode
   '(("^%\\(chapter\\|\\(sub\\|subsub\\)?section\\|paragraph\\)"
      0 'font-lock-keyword-face t)
     ("^%chapter{\\(.*\\)}"       1 'font-latex-sectioning-1-face t)
     ("^%section{\\(.*\\)}"       1 'font-latex-sectioning-2-face t)
     ("^%subsection{\\(.*\\)}"    1 'font-latex-sectioning-3-face t)
     ("^%subsubsection{\\(.*\\)}" 1 'font-latex-sectioning-4-face t)
     ("^%paragraph{\\(.*\\)}"     1 'font-latex-sectioning-5-face t)))

  ;; set default pdf viewer to okular
  (setq TeX-view-program-selection '((output-pdf "Zathura")))

  ;; set up correlation so we can find our spot
  (add-hook 'LaTeX-mode-hook 'TeX-source-correlate-mode)
  (setq TeX-source-correlate-start-server t)

  ;; attempt to execute biber, but doesn't work
  ;; (setq TeX-command-BibTeX 'Biber)

  ;; always turn on cdlatex-mode when we enter latex-mode
  (add-hook 'LaTeX-mode-hook 'cdlatex-mode)
  
  ;; make the preview font size MUCH bigger, so we can read our equations
  (set-default 'preview-scale-function 1.2)

  ;; make sure we can build using our makefiles
  (eval-after-load "tex" '(add-to-list 'TeX-command-list '("Make" "make" TeX-run-compile nil t)))
  ;; set the Make command to default
  ;; (setq TeX-command-default "Make")

  (add-hook 'TeX-mode-hook 
            (lambda () 
              (setq TeX-command-default "Make")))
  
  (add-hook 'LaTeX-mode-hook 
            (lambda () 
              (setq TeX-command-default "Make")))

  ;; add align as an equation environment
  (add-hook 'LaTeX-mode-hook 'add-my-latex-environments)
  (defun add-my-latex-environments ()
    (LaTeX-add-environments
     '("align" LaTeX-env-label)))
  
  ;; reftex code to recognize align as an equation
  (setq reftex-label-alist
        '(("align" ?e nil nil t)))

  )


;; don't hit C-c C-c six million times to compile latex to pdf
;; (use-package auctex-latexmk
;;   :config
;;   (auctex-latexmk-setup))

;; (use-package magic-latex-buffer)

;; automatic creation of paired delimiters
(electric-pair-mode 1)

;; replace the minibuffer with a better one
(use-package helm
  :ensure t
  :config
  ;; keybindings
  (global-unset-key (kbd "M-x"))
  (global-unset-key (kbd "C-x C-f"))
  (global-unset-key (kbd "C-x C-b"))
  (global-unset-key (kbd "C-x b"))
  (global-unset-key (kbd "C-x c M-y"))
  (global-unset-key (kbd "C-y"))
  
  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x C-b") 'helm-mini)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-y") 'helm-show-kill-ring)
  
                                        ;(define-key helm-map (kbd "<right>") 'forward-char)
  
  
  (setq helm-buffers-fuzzy-matching t
        helm-recentf-fuzzy-match t)
  (setq helm-ff-lynx-style-map t)

  ;; bibliography config
  ;; (setq bibtex-completion "~/refs/rsch-refs.bib"
  ;;       helm-bibtex-library-path "~/refs/"
  ;;       helm-bibtex-notes-path "~/refs/refnotes.org")
  ;; run helm-mode everywhere
  (helm-mode 1))

;; make sure shells pop up in the current buffer.
(add-to-list 'display-buffer-alist
             `(,(regexp-quote "*shell") display-buffer-same-window))
(global-set-key (kbd "C-t") 'shell)

;; save and export to pdf for org files that we want to do that for
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))

(defun org-export-as-pdf-and-open ()
  (interactive)
  (save-buffer)
  (org-open-file (org-latex-export-to-pdf))
  (revert-buffer-no-confirm))

(add-hook 
 'org-mode-hook
 (lambda()
   (define-key org-mode-map 
     (kbd "<f5>") 'org-export-as-pdf-and-open)))

;; use magit for managing our git repos more effectively
;; esp. with the code files we're currently working on
(use-package magit
  :ensure t
  :config
  (bind-key "C-c m i" 'magit-init)
  (bind-key "C-c m c" #'magit-commit)
  (bind-key "C-c m s" #'magit-stage)
  (bind-key "C-c m b" 'magit-branch)
  (bind-key "C-c m p" 'magit-push)
  (bind-key "C-c m u" 'magit-pull)
  (bind-key "C-c m h" #'magit-checkout)
  (bind-key "C-c m t" #'magit-tag))

;; get a better interface to sagemath
(use-package sage-shell-mode
  :ensure t)

;; edit OpenSCAD models in Emacs
(use-package scad-mode
  :ensure t)

;; use jupyter notebooks for python data analysis
(use-package jupyter
  :ensure t)

;; make it easier to keep track of undos
(use-package undo-tree
  :ensure t
  :config
  (global-undo-tree-mode 1))

;; use mermaid for diagramming in Org mode
;; (use-package ob-mermaid
;;   :ensure t
;;   :config
;;   (setq ob-mermaid-cli-path "~/node_modules/.bin/mmdc"))

;; use org-super-agenda for section headings in agenda views
(use-package org-super-agenda
  :ensure t
  :after org-agenda
  :init

  (setq org-agenda-custom-commands
        '(("c" "Super Agenda" agenda
           (org-super-agenda-mode)
           ((org-super-agenda-groups
             '(
               (:name "Waiting"
                      :todo "WAITING")
               (:name "Important"
                      :priority "A")
               (:name "Classes"
                      :tag "classes")
               (:name "Lab work"
                      :tag "labwork")
               (:name "Grad school and career stuff"
                      :tag "gradschool_job")
               )))
           (org-agenda nil "a")))))
;; display a whole month's worth of tasks by default
(setq org-agenda-span 'month)


;; flyspell-mode: check spelling as you write. Like MS Word's spell checker.
(use-package flyspell
  :config
  (flyspell-mode 1))

;; add support for notmuch: email client
;; (autoload 'notmuch "notmuch" "notmuch mail" t)
;; (bind-key "C-n" 'notmuch)

;; --- begin mu4e config (mail client) ---
;; all config copied mostly from
;; https://www.reddit.com/r/emacs/comments/bfsck6/mu4e_for_dummies/
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu4e/")
(require 'mu4e)

(setq mu4e-root-maildir (expand-file-name "~/mail"))

;; auto line wrap
;;(add-hook 'message-mode-hook 'auto-fill-mode)

;; better text flow on other mail readers
(setq mu4e-compose-format-flowed t) ;; let mail readers decide how to reflow text, respecting my hard newlines
(add-hook 'mu4e-compose-mode-hook (lambda () (use-hard-newlines -1))) ;; turn off automatic newlines

                                        ; get mail
(setq mu4e-get-mail-command "mbsync -a"
      ;; mu4e-html2text-command "w3m -T text/html" ;;using the default mu4e-shr2text
      mu4e-view-prefer-html t
      mu4e-update-interval 180
      mu4e-headers-auto-update t
      mu4e-compose-signature-auto-include nil
      mu4e-compose-format-flowed t)

;; to view selected message in the browser, no signin, just html mail
(add-to-list 'mu4e-view-actions
             '("ViewInBrowser" . mu4e-action-view-in-browser) t)

;; enable inline images
(setq mu4e-view-show-images t)
;; use imagemagick, if available
(when (fboundp 'imagemagick-register-types)
  (imagemagick-register-types))

;; every new email composition gets its own frame!
;;(setq mu4e-compose-in-new-frame t)

;; don't save message to Sent Messages, IMAP takes care of this
(setq mu4e-sent-messages-behavior 'delete)

(add-hook 'mu4e-view-mode-hook 'visual-line-mode)

;; <tab> to navigate to links, <RET> to open them in browser
(add-hook 'mu4e-view-mode-hook
          (lambda()
            ;; try to emulate some of the eww key-bindings
            (local-set-key (kbd "<RET>") 'mu4e~view-browse-url-from-binding)
            (local-set-key (kbd "<tab>") 'shr-next-link)
            (local-set-key (kbd "<backtab>") 'shr-previous-link)))

;; from https://www.reddit.com/r/emacs/comments/bfsck6/mu4e_for_dummies/elgoumx
(add-hook 'mu4e-headers-mode-hook
          (defun my/mu4e-change-headers ()
	         (interactive)
	         (setq mu4e-headers-fields
	               `((:human-date . 25) ;; alternatively, use :date
		              (:flags . 6)
		              (:from . 22)
		              (:thread-subject . ,(- (window-body-width) 70)) ;; alternatively, use :subject
		              (:size . 7)))))

;; if you use date instead of human-date in the above, use this setting
;; give me ISO(ish) format date-time stamps in the header list
                                        ;(setq mu4e-headers-date-format "%Y-%m-%d %H:%M")

;; spell check
;; (add-hook 'mu4e-compose-mode-hook
;;     (defun my-do-compose-stuff ()
;;        "My settings for message composition."
;;        (visual-line-mode)
;;        ;;(org-mu4e-compose-org-mode)
;;            (use-hard-newlines -1)
;;            ;;(flyspell-mode)
;;            ))

(require 'smtpmail)

;;rename files when moving
;;NEEDED FOR MBSYNC
(setq mu4e-change-filenames-when-moving t)

;;set up queue for offline email
;;use mu mkdir  ~/mail/acc/queue to set up first
(setq smtpmail-queue-mail nil)  ;; start in normal mode

;;from the info manual
(setq mu4e-attachment-dir  "~/dls")

(setq message-kill-buffer-on-exit t)
(setq mu4e-compose-dont-reply-to-self t)

(require 'org-mu4e)

;; convert org mode to HTML automatically
(setq org-mu4e-convert-to-html t)

;;from vxlabs config
;; show full addresses in view message (instead of just names)
;; toggle per name with M-RET
(setq mu4e-view-show-addresses 't)

;; don't ask when quitting
(setq mu4e-confirm-quit nil)

;; mu4e-context
(setq mu4e-context-policy 'pick-first)
(setq mu4e-compose-context-policy 'always-ask)
(setq mu4e-contexts
      (list
       (make-mu4e-context
        :name "gmail" ;;for gmail
        :enter-func (lambda () (mu4e-message "Entering context gmail"))
        :leave-func (lambda () (mu4e-message "Leaving context gmail"))
        :match-func (lambda (msg)
		                (when msg
		                  (mu4e-message-contact-field-matches
		                   msg '(:from :to :cc :bcc) "garekdyszel@gmail.com")))
        :vars '((user-mail-address . "garekdyszel@gmail.com")
	             (user-full-name . "Garek Dyszel")
	             (mu4e-sent-folder . "/gmail/[Gmail]/Sent Mail")
	             (mu4e-drafts-folder . "/gmail/[Gmail]/Drafts")
	             (mu4e-trash-folder . "/gmail/[Gmail]/Bin")
	             (mu4e-compose-signature . (concat "Formal Signature\n" "Emacs 25, org-mode 9, mu4e 1.0\n"))
	             (mu4e-compose-format-flowed . t)
	             (smtpmail-queue-dir . "~/mail/gmail/queue/cur")
	             (message-send-mail-function . smtpmail-send-it)
	             (smtpmail-smtp-user . "garekdyszel@gmail.com")
	             (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
	             (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
	             (smtpmail-default-smtp-server . "smtp.gmail.com")
	             (smtpmail-smtp-server . "smtp.gmail.com")
	             (smtpmail-smtp-service . 587)
	             (smtpmail-debug-info . t)
	             (smtpmail-debug-verbose . t)
                (setq mu4e~get-mail-password-regexp "^Enter password for account 'gmail': $")
	             (mu4e-maildir-shortcuts . ( ("/gmail/inbox"            . ?i)
					                             ("/gmail/[Gmail]/Sent Mail" . ?s)
					                             ("/gmail/[Gmail]/Bin"       . ?t)
					                             ("/gmail/[Gmail]/All Mail"  . ?a)
					                             ("/gmail/[Gmail]/Starred"   . ?r)
					                             ("/gmail/[Gmail]/Drafts"    . ?d)
					                             ))))
       
       (make-mu4e-context
        :name "mtu" ;;for mtu
        :enter-func (lambda () (mu4e-message "Entering context mtu"))
        :leave-func (lambda () (mu4e-message "Leaving context mtu"))
        :match-func (lambda (msg)
		                (when msg
		                  (mu4e-message-contact-field-matches
		                   msg '(:from :to :cc :bcc) "gjdyszel@mtu.edu")))
        :vars '((user-mail-address . "gjdyszel@mtu.edu")
	             (user-full-name . "Garek Dyszel")
	             (mu4e-sent-folder . "/mtu/[Gmail]/Sent Mail")
	             (mu4e-drafts-folder . "/mtu/[Gmail]/Drafts")
	             (mu4e-trash-folder . "/mtu/[Gmail]/Trash")
	             (mu4e-compose-signature . (concat "Informal Signature\n" "Emacs is awesome!\n"))
	             (mu4e-compose-format-flowed . t)
	             (smtpmail-queue-dir . "~/mail/mtu/queue/cur")
	             (message-send-mail-function . smtpmail-send-it)
	             (smtpmail-smtp-user . "gjdyszel@mtu.edu")
	             (smtpmail-starttls-credentials . (("smtp.gmail.com" 587 nil nil)))
	             (smtpmail-auth-credentials . (expand-file-name "~/.authinfo.gpg"))
	             (smtpmail-default-smtp-server . "smtp.gmail.com")
	             (smtpmail-smtp-server . "smtp.gmail.com")
	             (smtpmail-smtp-service . 587)
	             (smtpmail-debug-info . t)
	             (smtpmail-debug-verbose . t)
                (setq mu4e~get-mail-password-regexp "^Enter password for account 'mtu': $")
	             (mu4e-maildir-shortcuts . ( ("/mtu/inbox"            . ?i)
					                             ("/mtu/[Gmail]/Sent Mail" . ?s)
					                             ("/mtu/[Gmail]/Trash"     . ?t)
					                             ("/mtu/[Gmail]/All Mail"  . ?a)
					                             ("/mtu/[Gmail]/Starred"   . ?r)
					                             ("/mtu/[Gmail]/Drafts"    . ?d)
					                             ))))))


(bind-key "C-n" 'mu4e)

;; --- end mu4e config ---

;; Outgoing email (msmtp + msmtpq)
;; (setq send-mail-function 'sendmail-send-it
;;       sendmail-program "/usr/bin/msmtp"
;;       mail-specify-envelope-from t
;;       message-sendmail-envelope-from 'header
;;       mail-envelope-from 'header)

;; turn off automatic buffer narrowing in message-mode
;; so you can edit the whole file without that gross column of text
(add-hook 'message-mode-hook 'widen)

;; org-reveal for reveal.js presentations
(use-package ox-reveal)

;; add matlab mode for reading Chebfun files
;;(use-package matlab)

;; add php mode for editing dynamic webpages
(use-package php-mode)

;; all sorts of neat little bloops
(use-package csound-mode)

;; Set the default mode of the scratch buffer to Org
(setq initial-major-mode 'org-mode)
;; and change the message accordingly. No scratch message
(setq initial-scratch-message " ")



;;; typing-speed.el --- Minor mode which displays your typing speed

;; Copyright (C) 2008 Wangdera Corporation

;; Permission is hereby granted, free of charge, to any person
;; obtaining a copy of this software and associated documentation
;; files (the "Software"), to deal in the Software without
;; restriction, including without limitation the rights to use,
;; copy, modify, merge, publish, distribute, sublicense, and/or sell
;; copies of the Software, and to permit persons to whom the
;; Software is furnished to do so, subject to the following
;; conditions:

;; The above copyright notice and this permission notice shall be
;; included in all copies or substantial portions of the Software.

;; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
;; EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
;; OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
;; NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
;; HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
;; WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
;; FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
;; OTHER DEALINGS IN THE SOFTWARE.

;; Author: Craig Andera <candera@wangdera.com>

;; Commentary: Invoke this minor mode to have your typing speed
;; continuously displayed in the mode line, in the format [75 WPM]
;; To use, just load this file and invoke (typing-speed-mode) or
;; (turn-on-typing-speed-mode)

(define-minor-mode typing-speed-mode
  "Displays your typing speed in the status bar."
  :lighter typing-speed-mode-text
  :group 'typing-speed
  (if typing-speed-mode
      (progn
        (add-hook 'post-command-hook 'typing-speed-post-command-hook)
        (setq typing-speed-event-queue '())
        (setq typing-speed-update-timer (run-with-timer 0 typing-speed-update-interval 'typing-speed-update)))
    (progn
      (remove-hook 'post-command-hook 'typing-speed-post-command-hook)
      (cancel-timer typing-speed-update-timer))))

(defcustom typing-speed-window 5
  "The window (in seconds) over which typing speed should be evaluated."
  :group 'typing-speed)

(defcustom typing-speed-mode-text-format " [%s/%s WPM]"
  "A format string that controls how the typing speed is displayed in the mode line.
Must contain at least one %s delimeter. Typing speed will be inserted at the first
delimiter, and peak typing speed at the second."
  :group 'typing-speed)

(defcustom typing-speed-update-interval 1
  "How often the typing speed will update in the mode line, in seconds.
It will always also update after every command."
  :group 'typing-speed)

(defvar typing-speed-mode-text (format typing-speed-mode-text-format 0 0))
(defvar typing-speed-event-queue '())
(defvar typing-speed-update-timer nil)
(defvar typing-speed-peak-speed 0)
(defvar typing-speed-previous-mode-text "")

(make-variable-buffer-local 'typing-speed-peak-speed)
(make-variable-buffer-local 'typing-speed-previous-mode-text)
(make-variable-buffer-local 'typing-speed-mode-text)
(make-variable-buffer-local 'typing-speed-event-queue)

(defun typing-speed-post-command-hook ()
  "When typing-speed-mode is enabled, fires after every command. If the
command is self-insert-command, log it as a keystroke and update the
typing speed."
  (cond ((eq this-command 'self-insert-command)
         (let ((current-time (float-time)))
           (push current-time typing-speed-event-queue)
           (typing-speed-update)))
        ((member this-command '(delete-backward-char backward-delete-char-untabify))
         (progn
           (pop typing-speed-event-queue)
           (typing-speed-update)))))

(defun typing-speed-update ()
  "Calculate and display the typing speed."
  (let ((current-time (float-time)))
    (setq typing-speed-event-queue
          (typing-speed-remove-old-events
           (- current-time typing-speed-window)
           typing-speed-event-queue))
    (typing-speed-message-update)))

(defun typing-speed-message-update ()
  "Updates the status bar with the current typing speed"
  (let* ((chars-per-second (/ (length typing-speed-event-queue) (float typing-speed-window)))
         (chars-per-min (* chars-per-second 60))
         (words-per-min (/ chars-per-min 5)))
    (setq typing-speed-peak-speed (max words-per-min typing-speed-peak-speed))
    (setq typing-speed-mode-text
          (if (minibufferp (current-buffer))
              ""
            (format typing-speed-mode-text-format (floor words-per-min) (floor typing-speed-peak-speed))))
    ;; Attempt to prevent unnecessary flicker in the menu bar. Doesn't seem to help, though.
    (if (not (string-equal typing-speed-mode-text typing-speed-previous-mode-text))
        (progn
          (setq typing-speed-previous-mode-text typing-speed-mode-text)
          (force-mode-line-update)))))


(defun typing-speed-remove-old-events (threshold queue)
  "Removes events older than than the threshold (in seconds) from the specified queue"
  (if (or (null queue)
          (> threshold (car queue)))
      nil
    (cons (car queue)
          (typing-speed-remove-old-events threshold (cdr queue)))))

(defun turn-on-typing-speed ()
  "Turns on typing-speed-mode"
  (if (not typing-speed-mode)
      (typing-speed-mode)))

(defun turn-off-typing-speed ()
  "Turns off typing-speed-mode"
  (if typing-speed-mode
      (typing-speed-mode)))
