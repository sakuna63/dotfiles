(require 'auto-complete-config)
(require 'auto-complete-nxml) 
(ac-config-default)                                        ; auto-completeの標準設定を有効にする
(global-auto-complete-mode t)                              ; 常にauto-complete-modeをonにする
(add-to-list 'ac-dictionary-directories "~/.emacs.d/dict") ; 補完候補の辞書ディレクトリ
(add-to-list 'ac-modes 'python-2-mode)
(setq ac-ignore-case t)                                    ; 大文字小文字を区別しない
;;(setq ac-use-quick-help t)                               ; クイックヘルプを有効化
;;(setq ac-quick-help-delay 0.2)                           ; クイッiクヘルプ表示の遅延時間

(setq ac-deley 0.1)                                        ; 補完可能になるまでの遅延時間
(setq ac-auto-show-menu 0.2)                               ; 補完メニューの表示速度

(setq ac-use-menu-map t)                                   ; 候補メニュー表示次のカーソル移動の割り当て

(define-key ac-menu-map (kbd "C-n") 'ac-next)
(define-key ac-menu-map (kbd "C-p") 'ac-previous)
;; (define-key ac-menu-map (kbd "M-n") (kbd "C-u 5 C-n"))
;; (define-key ac-menu-map (kbd "M-p") (kbd "C-u 5 C-p"))
