(setq el-get-dir "~/.emacs.d/elisp/el-get/")
(setq el-get-generate-autoloads nil)

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (goto-char (point-max))
    (eval-print-last-sexp)))

;; define el-get repository
(setq el-get-sources
      '(
        (:name yatex
               :website "http://www.yatex.org/"
               :description "Yet Another TeX mode for Emacs"
               :branch "default"
               :type hg
               :url "http://www.yatex.org/hgrepos/yatex/")
         ))

(defvar my/el-get-packages
  '(
    yatex
    evil
    smartchr
    coffee-mode
    auto-complete-latex
    )
  "A list of packages to install from el-get at launch")

(el-get 'sync my/el-get-packages)
