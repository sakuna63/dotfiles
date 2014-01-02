(require 'helm-config)
(helm-mode t)

;; helm-descbindsを別ウィンドウで開くようにする
(setq helm-descbinds-window-style 'split-window)

(require 'helm-migemo)
;; migemo検索を有効化する
(setq helm-use-migemo)

(define-key helm-map (kbd "C-h") 'delete-backward-char)

;; helm-imenu : メソッドを一覧にしてくれる
;; helm-ag    : 指定ディレクトリ以下のほぼすべてのファイル内の文字を文字列検索
