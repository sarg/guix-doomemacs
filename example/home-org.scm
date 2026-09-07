(use-modules
 (gnu packages)
 (gnu home services)
 (gnu home)
 (guix gexp)
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
              "emacs-buttercup"
              "emacs-cape"
              "emacs-cond-let"
              "emacs-consult"
              "emacs-consult-dir"
              "emacs-consult-yasnippet"
              "emacs-corfu"
              "emacs-diredfl"
              "emacs-dirvish"
              "emacs-doom-modeline"
              "emacs-doom-snippets"
              "emacs-doom-themes"
              "emacs-elisp-def"
              "emacs-embark"
              "emacs-embark-consult"
              "emacs-evil"
              "emacs-evil-anzu"
              "emacs-evil-args"
              "emacs-evil-collection"
              "emacs-evil-easymotion"
              "emacs-evil-embrace"
              "emacs-evil-escape"
              "emacs-evil-exchange"
              "emacs-evil-indent-plus"
              "emacs-evil-lion"
              "emacs-evil-nerd-commenter"
              "emacs-evil-numbers"
              "emacs-evil-org"
              "emacs-evil-quick-diff"
              "emacs-evil-snipe"
              "emacs-evil-surround"
              "emacs-evil-textobj-anyblock"
              "emacs-evil-traces"
              "emacs-evil-visualstar"
              "emacs-exato"
              "emacs-helpful"
              "emacs-highlight-quoted"
              "emacs-htmlize"
              "emacs-let-completion"
              "emacs-link-hint"
              "emacs-macrostep"
              "emacs-magit"
              "emacs-marginalia"
              "emacs-ob-async"
              "emacs-orderless"
              "emacs-org-cliplink"
              "emacs-org-contrib"
              "emacs-orgit"
              "emacs-overseer"
              "emacs-ox-clip"
              "emacs-solaire-mode"
              "emacs-toc-org"
              "emacs-vertico"
              "emacs-wgrep"
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
                (config
                 (directory-union "config"
                                  (list
                                   (local-file "files" #:recursive? #t)
                                   (doomemacs-org-config
                                    #:src (local-file "config.org")
                                    #:inputs (list (specification->package+output
                                                    "cowsay"))))))
                (inputs all-pkgs)))))))
