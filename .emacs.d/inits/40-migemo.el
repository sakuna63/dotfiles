(require 'migemo)
;; cmigemoを使う
(setq migemo-command "cmigemo")
;; migemoのコマンドラインオプション
(setq migemo-options '("-q" "--emacs" "-i" "\a"))
;; migemo辞書の場所
(setq migemo-dictionary "/usr/local/share/migemo/utf-8/migemo-dict")

(setq migemo-user-dictionary nil)
(setq migemo-regex-dictionary nil)


;; 検索にキャッシュを使う
(setq migemo-use-pattern-alist t)
(setq migemo-use-frequent-pattern-alist t)
(setq migemo-pattern-alist-length 1000)
(setq migemo-coding-system 'utf-8-unix)

(load-library "migemo")
(migemo-init)
