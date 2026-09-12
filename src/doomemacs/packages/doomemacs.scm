(define-module (doomemacs packages doomemacs)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages rust-apps)
  #:use-module (gnu packages emacs-build)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (doomemacs packages emacs-xyz))

(define-public doomemacs
  (package
   (name "doomemacs")
   (version "2.2.4")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/doomemacs/core")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "036pzb8p4mz17yjsb3qmcwz0qh6ds2drqrl2kf4jqlc6kwq26akj"))))
   (build-system copy-build-system)
   (arguments
    (list
     #:install-plan #~'(("." "share/doomemacs"))
     #:phases
     #~(modify-phases %standard-phases
         (add-after 'unpack 'set-path
           (lambda* (#:key inputs #:allow-other-keys)
             (substitute* "modules/doom/compat/+projectile.el"
               (("(defvar doom-fd-executable).+" _ prefix)
                (format #f "~a ~s" prefix (search-input-file inputs "/bin/fd")))
               (("(defvar doom-ripgrep-executable).+" _ prefix)
                (format #f "~a ~s" prefix (search-input-file inputs "/bin/rg")))))))))
   (inputs (list fd ripgrep))
   (propagated-inputs
    (list
     ;; core
     emacs-nerd-icons
     emacs-project
     emacs-which-key
     emacs-compat
     emacs-gcmh

     ;; compat
     emacs-auto-minor-mode
     emacs-better-jumper
     emacs-smartparens
     emacs-projectile
     emacs-general))
   (home-page "https://github.com/doomemacs/doomemacs")
   (description "Doom emacs sources")
   (synopsis "Doom emacs")
   (license license:expat)))

(define-public doomemacs-modules
  (package
   (name "doomemacs-modules")
   (version "26.09")
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/doomemacs/modules")
           (commit (string-append "v" version))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "0cafyndjrkfkdkbggl5834zp77nxjjh4blwfz25bw4bnrsrg1rav"))))
   (build-system copy-build-system)
   (arguments '(#:install-plan '(("modules" "share/doomemacs/modules"))))
   (home-page "https://github.com/doomemacs/modules")
   (description "Doom modules")
   (synopsis "Doom modules")
   (license license:expat)))

(define-public doomemacs-module-meow
  (package
   (name "doomemacs-module-meow")
   (properties '((commit . "df4c42ae4cfc83899cf98c867ca0df633e015be9")))
   (version (git-version "0" "0" (assoc-ref properties 'commit)))
   (source
    (origin
     (method git-fetch)
     (uri (git-reference
           (url "https://github.com/meow-edit/doom-meow")
           (commit (assoc-ref properties 'commit))))
     (file-name (git-file-name name version))
     (sha256
      (base32 "15dxi3pdnvbzf4pn5pv6gfn7rawqs6pybsspjvhv1m4n0nwzk6rc"))))
   (build-system copy-build-system)
   (arguments '(#:install-plan '(("." "share/doomemacs/modules/editor/meow"))))
   (propagated-inputs (list emacs-meow))
   (home-page "https://github.com/meow-edit/doom-meow")
   (description "Doom + Meow")
   (synopsis "Doom Meow module")
   (license license:gpl3)))
