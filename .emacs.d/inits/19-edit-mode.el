(require 'smartchr)
(global-set-key (kbd "{") (smartchr '("{`!!'}" "{")))
(global-set-key (kbd "(") (smartchr '("(`!!')" "(")))
(global-set-key (kbd "[") (smartchr '("[`!!']" "[")))
(global-set-key (kbd "\"") (smartchr '("\"`!!'\"" "\"")))
(global-set-key (kbd "\'") (smartchr '("\'`!!'\'" "\'")))

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
(setq auto-mode-alist (cons '("\\.md$" . markdown-mode) auto-mode-alist))

