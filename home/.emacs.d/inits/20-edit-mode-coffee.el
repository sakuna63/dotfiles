(require 'coffee-mode)
(defun coffee-mode-hooks ()
  (and (set (make-local-variable 'tab-width) 2)
       (set (make-local-variable 'coffee-tab-width) 2))
  )

(add-hook 'coffee-mode-hook 'coffee-mode-hooks)

