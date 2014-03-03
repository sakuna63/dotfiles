(require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))

(define-key web-mode-map (kbd "C-c C-w") 'delete-window)
(define-key web-mode-map (kbd "M--") 'web-mode-fold-or-unfold)
(define-key web-mode-map (kbd "M-=") 'web-mode-fold-or-unfold)

(setq web-mode-enable-current-element-highlight t)

(defun web-mode-hooks ()
  (emmet-mode)
  (ac-emmet-html-setup)
  (setq web-mode-html-offset   2)
  (setq web-mode-css-offset    2)
  (setq web-mode-script-offset 2)
  (setq web-mode-php-offset    2)
  (setq web-mode-java-offset   2)
  (setq web-mode-asp-offset    2))

(add-hook 'web-mode-hook 'web-mode-hooks)
