;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;; ruby mode ;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("Capfile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Gemfile$" . ruby-mode))

(require 'ruby-electric)
(require 'ruby-block)

(defun ruby-insert-end ()
  (interactive)
  (insert "end")
  (ruby-indent-line t)
  (end-of-line))


(setq rsense-home (expand-file-name "~/.emacs.d/opt/rsense-0.3"))
(add-to-list 'load-path (concat rsense-home "/etc"))
(setq rsense-rurema-home (concat rsense-home "/doc/ruby-refm-1.9.3-dynamic-20120829"))
(setq rsense-rurema-refe "refe-1_9_3")
(require 'rsense)

;; (require 'rcodetools)
;; (require 'anything-rcodetooles)
;; (setq )

(defun ruby-mode-hooks ()
  (ruby-electric-mode t)
  (setq ruby-electric-expand-delimiters-list nil)
  (ruby-block-mode t)
  (setq ruby-block-highlight-toggle t)
  (setq ruby-block-delay 0.1)
  (add-to-list 'ac-sources 'ac-source-rsense-method)
  (add-to-list 'ac-sources 'ac-source-rsense-constant)
  )


(add-hook 'ruby-mode-hook 'ruby-mode-hooks)

                                        ;(global-set-key (kbd "{") (smartchr '("{`!!'}" "{")))

(define-key ruby-mode-map (kbd "C-x class")
  (smartchr '(
"class `!!'

  def initialize
  
  end

end
")))
