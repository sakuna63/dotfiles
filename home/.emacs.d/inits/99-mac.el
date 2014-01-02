;; Mac依存の設定はここに書く
(when (or darwin-p carbon-p)
  
  ;; keyboard設定
  (global-set-key (kbd "M-o") 'set-mark-command)
  (global-set-key (kbd "M-i") 'other-window-or-split)
  (define-key helm-map (kbd "M-i") 'other-window-or-split)

  ;; Emacs と Mac のクリップボード共有
  (defun copy-from-osx ()
    (shell-command-to-string "pbpaste"))

  (defun paste-to-osx (text &optional push)
    (let ((process-connection-type nil))
      (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
        (process-send-string proc text)
        (process-send-eof proc))))

  (setq interprogram-cut-function 'paste-to-osx)
  (setq interprogram-paste-function 'copy-from-osx))
