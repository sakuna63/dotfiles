(require 'emmet-mode)
(add-hook 'emmet-mode-hook
          (lambda () (setq emmet-indentation 2))) 
(eval-after-load "emmet-mode"
  '(define-key emmet-mode-keymap (kbd "C-j") nil)) 


;; (keyboard-translate ?\C-i ?\H-i) ;;C-i と Tabの被りを回避
;; (define-key input-decode-map (kbd "C-i") (kbd "H-i"))
;; (setq emmet-mode-keymap (delq '(kp-tab . [9]) emmet-mode-keymap))
(define-key emmet-mode-keymap (kbd "M-C-i") 'emmet-expand-line) ;; C-i で展開
