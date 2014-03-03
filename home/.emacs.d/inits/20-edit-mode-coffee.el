(require 'coffee-mode)

(define-key coffee-mode-map (kbd "C-c C-c") 'coffee-compile-buffer)

(defun coffee-mode-hooks ()
  (hs-minor-mode 1)
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2))
  )

(add-hook 'coffee-mode-hook 'coffee-mode-hooks)

