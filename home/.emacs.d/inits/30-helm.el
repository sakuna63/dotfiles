(require 'helm-config)

;(helm-mode t)

;; helm-descbindsを別ウィンドウで開くようにする
(setq helm-descbinds-window-style 'split-window)

(require 'helm-migemo)
;; migemo検索を有効化する
(setq helm-use-migemo)

;; recentfの記憶数を50にする
(setq recentf-max-menu-items 50)
(setq recentf-max-saved-items 50)

(define-key helm-map (kbd "C-a") 'move-beginning-of-line)
(define-key helm-map (kbd "C-h") 'delete-backward-char)

;; tabでファイルのプレビュー
(define-key helm-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-map (kbd "M-n") (kbd "C-n C-n C-n C-n C-n"))
(define-key helm-map (kbd "M-p") (kbd "C-p C-p C-p C-p C-p"))

(require 'ac-helm)
(define-key ac-complete-mode-map (kbd "C-i") 'ac-complete-with-helm)

(setq shell-file-name "/usr/local/Cellar/zsh/5.0.2/bin/zsh")
(require 'helm-dired-recent-dirs)

;; helm-imenu : メソッドを一覧にしてくれる
;; helm-ag    : 指定ディレクトリ以下のほぼすべてのファイル内の文字を文字列検索
;; helm-resume: helmメニューを復元表示してくれる
