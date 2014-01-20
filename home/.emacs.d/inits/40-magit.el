(require 'magit)

(eval-after-load 'magit
  '(progn
     (set-face-foreground 'magit-diff-add "color-172")
     (set-face-background 'magit-diff-del "color-53")
     (set-face-foreground 'magit-diff-del "color-160")
     (set-face-background 'magit-diff-file-header "color-236")
     (set-face-foreground 'magit-diff-file-header "#4040ff")
     (set-face-background 'magit-diff-hunk-header "color-236")
     ))
