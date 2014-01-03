;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;  sgml(html) mode  ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'sgml-mode)
(add-to-list 'auto-mode-alist '("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . sgml-mode))

(defun sgml-mode-hooks ()
  (emmet-mode)
  (ac-emmet-html-setup)
  )

(add-hook 'sgml-mode-hook 'sgml-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;  css mode  ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun css-mode-hooks ()
  (emmet-mode t)
  (ac-emmet-css-setup)
  )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;  c mode  ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun c-mode-hooks ()
  (c-set-style "linux")
  (setq c-basic-offset 4)
  (local-unset-key (kbd "C-c C-c"))
  ;; 演算子が複数行にまたがるときのオフセット
  (c-set-offset 'statement-cont 'c-lineup-math))

(add-hook 'c-mode-common-hook 'c-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; c++ mode ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun c++-mode-hooks ()
  (c-set-style "linux")
  (setq c-basic-offset 4)
  (c-set-offset 'statement-cont 'c-lineup-math))

(add-hook 'c++-mode-hook 'c++-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; sh mode ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist  '("\.zshrc*" . sh-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; markdown mode ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))

