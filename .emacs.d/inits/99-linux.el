(when linux-p
  (setq ns-alt-modifier (quote meta))
  
  ;; キーボード設定
  (globel-set-key (kbd "C-z") 'undo))
