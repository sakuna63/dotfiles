;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;; 通常操作 ;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; バックスペース
(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "M-h") 'backward-kill-word)
(global-set-key (kbd "M-C-h") 'backward-kill-word)
(global-set-key (kbd "M-d") 'kill-word)
(define-key isearch-mode-map (kbd "C-h") 'isearch-delete-char)

;; 改行
(global-set-key (kbd "C-m") 'newline-and-indent)

;; 整列
(global-set-key (kbd "C-c a") 'align)
(global-set-key (kbd "C-c C-a") 'align-regexp)

;; コメント
(global-set-key (kbd "M-/") 'comment-or-uncomment-region)

;; 複数行移動
(global-set-key (kbd "M-n") (kbd "C-u 5 C-n"))
(global-set-key (kbd "M-p") (kbd "C-u 5 C-p"))

;; スクロール
(global-set-key (kbd "C-M-n") 'scroll-up-line) 
(global-set-key (kbd "C-M-p") 'scroll-down-line)

;; ウィンドウ分割
(global-set-key (kbd "C-c C-v") 'split-window-right)
(global-set-key (kbd "C-c C-h") 'split-window-below)

;; ウィンドウ削除
(global-set-key (kbd "C-c C-w") 'delete-window)

;; コードブロック操作
(global-set-key (kbd "M--") 'hs-hide-block)
(global-set-key (kbd "M-_") 'hs-hide-all)
(global-set-key (kbd "M-=") 'hs-show-block)
(global-set-key (kbd "M-+") 'hs-show-all)

;; buffer評価
(global-set-key (kbd "C-x C-e") 'eval-current-buffer)

;;;;;;;;;;;
;; elisp ;;
;;;;;;;;;;;

;; helm
(global-set-key (kbd "C-x C-h") 'helm-descbinds)
(global-set-key (kbd "C-x C-b") 'helm-for-files) 
(global-set-key (kbd "C-M-y") 'helm-show-kill-ring)

;; auto-complete
(global-unset-key (kbd "C-@"))
(global-unset-key (kbd "C-SPC"))
(define-key ac-mode-map (kbd "C-SPC") 'auto-complete)

;; open-junk-file
(global-set-key (kbd "C-x j") 'open-junk-file)

;; undo-tree
(global-set-key (kbd "M-z") 'undo-tree-undo)
(global-set-key (kbd "M-Z") 'undo-tree-redo)

;; anzu-mode
(global-set-key (kbd "M-C-s") 'anzu-query-replace)

;; smart-compile
(global-set-key (kbd "C-c c") 'smart-compile)
(global-set-key (kbd "C-c C-c") (kbd "C-c c C-m"))


;; flycheck


;;;;;;;;;;;;
;; マクロ ;;
;;;;;;;;;;;;

;; ウィンドウが無いときにはC-tabでウィンドウを分割する
(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))


































;; ウィンドウ移動
;; (global-set-key (kbd "C-c C-f")  'windmove-left)
;; (global-set-key (kbd "C-c C-n")  'windmove-down)
;; (global-set-key (kbd "C-c C-p")    'windmove-up)
;; (global-set-key (kbd "C-c C-b") 'windmove-right)
;; (setq windmove-wrap-around t)

(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        c)
    (catch 'end-flag
      (while t
        (message "size[%dx%d]"
                 (window-width) (window-height))
        (setq c (read-char))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (message "Quit")
               (throw 'end-flag t)))))))
(global-set-key (kbd "C-c C-r") 'window-resizer)
