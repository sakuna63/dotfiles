;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;  sgml(html) mode  ;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'sgml-mode)
;; (add-to-list 'auto-mode-alist '("\\.[sx]?html?\\(\\.[a-zA-Z_]+\\)?\\'" . sgml-mode))

;; (defun sgml-mode-hooks ()
;;   (emmet-mode)
;;   (ac-emmet-html-setup)
;;   (hs-minor-mode 1)
;;   )

;; (add-hook 'sgml-mode-hook 'sgml-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;  scss mode  ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'scss-mode)

(defun scss-mode-hooks ()
  (emmet-mode t)
  (ac-emmet-css-setup)
  (setq css-indent-offset 2)
  (scss-compile-at-save nil)
  (hs-minor-mode 1)
  )

(add-hook 'scss-mode-hook 'scss-mode-hooks)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;  css mode  ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun css-mode-hooks ()
  (emmet-mode t)
  (ac-emmet-css-setup)
  (hs-minor-mode 1)
  )

(add-hook 'css-mode-hook 'css-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;  js mode  ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq js-indent-level 2)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;  c mode  ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(defun c-mode-hooks ()
  (c-set-style "linux")
  (setq c-basic-offset 4)
  (local-unset-key (kbd "C-c C-c"))
  (define-key c-mode-map (kbd "C-c C-w") 'delete-window)
  (hs-minor-mode 1)
  ;; 演算子が複数行にまたがるときのオフセット
  (c-set-offset 'statement-cont 'c-lineup-math))

(add-hook 'c-mode-common-hook 'c-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; c++ mode ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun c++-mode-hooks ()
  (c-set-style "linux")
  (setq c-basic-offset 4)
  (hs-minor-mode 1)
  (c-set-offset 'statement-cont 'c-lineup-math))

(add-hook 'c++-mode-hook 'c++-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; sh mode ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist  '("\.zshrc*" . sh-mode))
(add-to-list 'auto-mode-alist  '("\.zsh*" . sh-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;; markdown mode ;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md$" . markdown-mode))
(define-key markdown-mode-map (kbd "M-n") (kbd "C-u 5 C-n"))
(define-key markdown-mode-map (kbd "M-p") (kbd "C-u 5 C-p"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; php mode ;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun php-mode-hooks ()
  (define-key php-mode-map (kbd "C-c C-w") 'delete-window)
  )

(add-hook 'php-mode-hook 'php-mode-hooks)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;; java mode ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun java-mode-hooks ()
  (define-key java-mode-map (kbd "C-c C-w") 'delete-window)
  )

(add-hook 'java-mode-hook 'java-mode-hooks)

