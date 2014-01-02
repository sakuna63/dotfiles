;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; python mode ;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq jedi:complete-on-dot t)
(setq jedi:setup-keys t)
(setq jedi:key-goto-definition (kbd "C-M-j"))

;; helm-jedi-related-name

(defun python-mode-hooks ()
  (setq indent-tabs-mode nil)
  (setq indent-level 4)
  (setq python-indent 4)
  (jedi:setup))

(add-hook 'python-mode-hook 'python-mode-hooks)
  
