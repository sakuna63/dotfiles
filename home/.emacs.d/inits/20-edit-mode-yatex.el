;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; yatex mode ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq auto-mode-alist
      (append '(("\\.tex$" . yatex-mode)
                ("\\.ltx$" . yatex-mode)
                ("\\.cls$" . yatex-mode)
                ("\\.sty$" . yatex-mode)
                ("\\.clo$" . yatex-mode)
                ("\\.bbl$" . yatex-mode)) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LateX mode" t)

;; auto-complete-latex
(require 'auto-complete-latex)
(setq ac-l-dict-directory "~/.emacs.d/elisp/el-get/auto-complete-latex/ac-l-dict/")
(add-to-list 'ac-modes 'yatex-mode) ; yatex-mode時に有効化x

(defun yatex-mode-hooks ()
  (ac-l-setup)
  (local-set-key (kbd "k") (smartchr '("k" "\\"))))

(add-hook 'yatex-mode-hook 'yatex-mode-hooks)
