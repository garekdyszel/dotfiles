(deftheme zenburn-GD
  "Created 2019-08-14.")

(custom-theme-set-variables
 'zenburn-GD
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(doc-view-continuous t)
 '(inhibit-startup-screen t)
 '(major-mode (quote pdf-view-mode))
 '(org-agenda-files (quote ("~/org/TODOlist.org")))
 '(org-ref-insert-cite-key "C-c 0")
 '(package-selected-packages (quote (zenburn-theme anki-editor gnuplot ## pdf-view-restore org-pdfview ox-bibtex-chinese org-noter org htmlize)))
 '(custom-safe-themes (quote ("a7051d761a713aaf5b893c90eaba27463c791cd75d7257d3a8e66b0c8c346e77" default))))

(provide-theme 'zenburn-GD)
