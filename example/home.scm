(use-modules
 (gnu packages)
 (gnu home services)
 (gnu home)
 (gnu packages nss)
 (gnu packages version-control)
 (gnu packages emacs)
 (gnu packages fonts)

 (doomemacs packages doomemacs)
 (doomemacs services doomemacs))

(let* ((home-emacs emacs-next-pgtk)
       (all-pkgs
        (map specification->package+output
             (list
              "doomemacs-modules"

              "emacs-anzu"
              "emacs-auto-yasnippet"
              "emacs-avy"
              "emacs-bash-completion"
              "emacs-buttercup"
              "emacs-cape"
              "emacs-cond-let"
              "emacs-consult"
              "emacs-consult-dir"
              "emacs-consult-flycheck"
              "emacs-consult-yasnippet"
              "emacs-corfu"
              "emacs-diff-hl"
              "emacs-diredfl"
              "emacs-dirvish"
              "emacs-doom-modeline"
              "emacs-doom-snippets"
              "emacs-doom-themes"
              "emacs-dtrt-indent"
              "emacs-dumb-jump"
              "emacs-edit-indirect"
              "emacs-elisp-def"
              "emacs-embark"
              "emacs-embark-consult"
              "emacs-eros"
              "emacs-evil"
              "emacs-evil-anzu"
              "emacs-evil-args"
              "emacs-evil-collection"
              "emacs-evil-easymotion"
              "emacs-evil-embrace"
              "emacs-evil-escape"
              "emacs-evil-exchange"
              "emacs-evil-goggles"
              "emacs-evil-indent-plus"
              "emacs-evil-lion"
              "emacs-evil-markdown"
              "emacs-evil-nerd-commenter"
              "emacs-evil-numbers"
              "emacs-evil-org"
              "emacs-evil-quick-diff"
              "emacs-evil-snipe"
              "emacs-evil-surround"
              "emacs-evil-textobj-anyblock"
              "emacs-evil-traces"
              "emacs-evil-vimish-fold"
              "emacs-evil-visualstar"
              "emacs-exato"
              "emacs-flycheck"
              "emacs-flycheck-package"
              "emacs-flycheck-popup-tip"
              "emacs-git-link"
              "emacs-git-modes"
              "emacs-git-timemachine"
              "emacs-helpful"
              "emacs-highlight-quoted"
              "emacs-hl-todo"
              "emacs-htmlize"
              "emacs-let-completion"
              "emacs-link-hint"
              "emacs-macrostep"
              "emacs-magit"
              "emacs-marginalia"
              "emacs-markdown-toc"
              "emacs-ob-async"
              "emacs-orderless"
              "emacs-org-cliplink"
              "emacs-org-contrib"
              "emacs-orgit"
              "emacs-overseer"
              "emacs-ox-clip"
              "emacs-persp-mode"
              "emacs-quickrun"
              "emacs-request"
              "emacs-solaire-mode"
              "emacs-toc-org"
              "emacs-undo-fu"
              "emacs-undo-fu-session"
              "emacs-vertico"
              "emacs-vi-tilde-fringe"
              "emacs-vimish-fold"
              "emacs-vundo"
              "emacs-wgrep"
              "emacs-ws-butler"
              "emacs-yasnippet"
              "emacs-yasnippet-capf"))))
  (home-environment
    (packages (cons* font-nerd-symbols
                     git nss-certs home-emacs
                     all-pkgs))
    (services
     (list
      (service home-doomemacs-service-type
               (doomemacs-configuration
                (emacs home-emacs)
                (doomemacs doomemacs)
                (config doomemacs-example-config)
                (inputs all-pkgs)))))))
