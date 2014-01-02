;; system-typeを定義しておく
(setq darwin-p (eq system-type 'darwin)
      linux-p  (eq system-type 'gnu/linux)
      carbon-p (eq system-type 'mac))

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; file名の補完で大文字小文字を区別しない
(setq completion-ignore-case t)

;;yes-noの選択肢をy-nにする
(fset 'yes-or-no-p 'y-or-n-p)

;; Backup fileの場所指定
(setq make-backup-files t)
(setq backup-directory-alist
      (cons (cons "\\.*$" (expand-file-name "~/.emacs.d/.backup"))
            backup-directory-alist))

;; タブ幅を4にする
(defun set-aurora-tab-width (num &optional local redraw)
  (interactive "nTab Width: ")
  (when local
    (make-local-variable 'tab-width)
    (make-local-variable 'tab-stop-list))
  (setq tab-width num)
  (setq tab-stop-list ())
  (while (<= num 256)
    (setq tab-stop-list `(,@tab-stop-list ,num))
    (setq num (+ num tab-width)))
  (when redraw (redraw-display)) tab-width)
  
(set-aurora-tab-width (setq default-tab-width (setq-default tab-width 4)))

;;タブの代わりに半角スペースを使う
(setq-default indent-tabs-mode nil)

;; GCを減らして軽くする
(setq gc-cons-threshold (* 10 gc-cons-threshold))

;; クライアントを終了するとき終了するかどうかを聞かない
(remove-hook 'kill-buffer-query-functions 'server-kill-buffer-query-function)

;; 他クライアントからファイル変更があった際の自動再読み込み
(global-auto-revert-mode 1)

;; auto-saveを無効化
(setq auto-save-default nil)
