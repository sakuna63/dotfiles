;; Packages to install from package.el
(defvar my/packages
  '(
    auto-complete-nxml
    anzu
    color-theme
    flycheck
    helm
    helm-migemo
    init-loader
    jedi
    markdown-mode
    migemo
    open-junk-file
    php-mode
    ruby-block
    ruby-electric
    smart-compile
    smartrep
    twittering-mode
    undo-tree
    undohist
    )
  "A list of packages to install from package.el at launch.")

(dolist (package my/packages)
  (when (or (not (package-installed-p package)))
    (package-install package)))
