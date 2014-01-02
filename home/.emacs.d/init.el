;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;ロードパス追加設定;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq load-path
      (append
       (list
        (expand-file-name "~/.eamcs.d/elisp/")
        (expand-file-name "~/.emacs.d/elisp/el-get/el-get/"))
       load-path))

(let ((default-directory (expand-file-name "~/.emacs.d/elisp/el-get/")))
  (add-to-list 'load-path default-directory)
  (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
      (normal-top-level-add-subdirs-to-load-path)))


;; packageを読み込む（load-pathの設定もかねる）
(require 'package)
(setq package-user-dir "~/.emacs.d/elisp/elpa");
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

;;設定ファイルはinits以下に置いていて、init-loaderによって読み込まれる
(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")
