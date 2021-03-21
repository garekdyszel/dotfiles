(define-package "jupyter" "20210116.255" "Jupyter"
  '((emacs "26")
    (zmq "0.10.3")
    (cl-lib "0.5")
    (simple-httpd "1.5.0")
    (websocket "1.9"))
  :commit "6ce8d01e3a550a3268b415bf9d9b635d4dba5940" :authors
  '(("Nathaniel Nicandro" . "nathanielnicandro@gmail.com"))
  :maintainer
  '("Nathaniel Nicandro" . "nathanielnicandro@gmail.com")
  :url "https://github.com/dzop/emacs-jupyter")
;; Local Variables:
;; no-byte-compile: t
;; End:
