;; 対応する括弧を光らせる。
(show-paren-mode t)

;; 選択部分のハイライト
(transient-mark-mode t)

;; ツールバー、メニューバーを非表示
(cond
 (window-system (tool-bar-mode -1))
 (t             (menu-bar-mode -1)))

;; 行番号,桁番号を表示する
(global-linum-mode t)
(setq linum-format "%3d ")
(column-number-mode t)

;; 編集行のハイライト
;; list-colors-display
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "color-235"))
    (((class color)
      (background light))
     (:background  "#98FB98"))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)

;; mode-lineのモード情報設定を短くする
(defvar mode-line-cleaner-alist
  '( ;; For minor-mode, first char is 'space'
    (auto-complete-mode . " Ac")
    (anzu-mode . " An")
    (undo-tree-mode . " Ut")
    (helm-mode . " He")
    (ruby-block-mode . " RBl")
    (ruby-electric-mode . " REl")
    (flycheck-mode . " FlyC")
    ;; Major modes
    (fundamental-mode . "Text")
;    (YaTeX-japan . "Tex")
    (lisp-interaction-mode . "Li")
    (php-mode . "Php")
    (python-mode . "Py")
    (ruby-mode   . "Rb")
    (emacs-lisp-mode . "El")
    (markdown-mode . "Md")))

(defun clean-mode-line ()
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;; (setq mode-line-format
;;       (list "-"
            
;;             'minor-mode-alist ))

;; current directory 表示
;; (let ((ls (member 'mode-line-buffer-identification
;;                   mode-line-format)))
;;   (setcdr ls
;;           (cons '(:eval (concat " ("
;;                                 (abbreviate-file-name default-directory)
;;                                 ")"))
;;                 (cdr ls))))

(require 'color-theme)
(color-theme-initialize)
(color-theme-molokai)

;(set-face-foreground 'minibuffer-prompt nil)
