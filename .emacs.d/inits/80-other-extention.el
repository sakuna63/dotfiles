;; open-junk-file
(require 'open-junk-file)
(setq open-junk-file-format "~/Documents/emacs-junk/%Y-%m-%d-%H%M%S.md")


;; undo-tree
(require 'undo-tree)
(global-undo-tree-mode t)

;; undohist
(require 'undohist)
(undohist-initialize)
 
;; markdown-mode
(require 'markdown-mode)
(setq auto-mode-alist (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; anzu-mode
(require 'anzu)
(global-anzu-mode +1)
(custom-set-variables
 '(anzu-deactivate-region t)
 '(anzu-search-threshold 1000)
 '(anzu-use-migemo))
