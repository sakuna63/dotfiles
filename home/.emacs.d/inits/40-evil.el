(require 'evil)
;; (evil-mode 1)

(define-key evil-normal-state-map (kbd "n") (kbd "C-u 5 j"))
(define-key evil-normal-state-map (kbd "m") (kbd "C-u 5 k"))

;; M-C-gをESCに
(defun evil-escape-or-quit (&optional prompt)
  (interactive)
  (cond
   ((or (evil-normal-state-p) (evil-insert-state-p) (evil-visual-state-p)
        (evil-replace-state-p) (evil-visual-state-p)) [escape])
   (t (kbd "C-g"))))
(define-key key-translation-map (kbd "M-C-g") #'evil-escape-or-quit)
(define-key evil-operator-state-map (kbd "M-C-g") #'evil-escape-or-quit)
(define-key evil-normal-state-map [escape] #'keyboard-quit)

