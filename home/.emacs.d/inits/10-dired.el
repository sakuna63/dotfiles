(require 'dired-x)

;; dired-find-alternate-file の有効化
(put 'dired-find-alternate-file 'disabled nil)
(define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
(define-key dired-mode-map (kbd "a") 'dired-find-file)

;; 親ディレクトリ移動時に新しいバッファを作成しない
(define-key dired-mode-map (kbd "^")
  (lambda () (interactive) (find-alternate-file "..")))
