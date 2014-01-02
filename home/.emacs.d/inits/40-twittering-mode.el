;; twittering-mode(EmacsでTwitter)
(require 'twittering-mode)
;; 起動時パスワード認証
(setq twittering-use-master-password t)
;; パスワード暗号ファイル保存先変更
(setq twittering-private-info-file "~/.emacs.d/twittering-mode.gpg")
;; 表示する書式
(setq twittering-status-format "%i %S @%s %p : %C{%H:%M:%S} : tweet by %f %R\n %T ")
;; アイコンを表示する
(setq twittering-icon-mode t)
;; アイコンサイズを変更(default 48px)
(setq twittering-convert-fix-size 40)
;; 更新頻度[s]
(setq twittering-timer-interval 40)
;; ツイート取得数
(setq twittering-number-of-tweets-on-retrieval 50)
;; oで次のURLをブラウザでオープン
(add-hook 'twittering-mode-hock
  (lambda()
    (local-set-key (kbd "o")
      (lambda()
	(interactive)
	(twittering-got-next-uri)
	(execute-kbd-macro (kbd "C-m"))
))))
