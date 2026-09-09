(define-module (doomemacs services doomemacs)
  #:use-module (gnu services)
  #:use-module (gnu services configuration)
  #:use-module (guix gexp)
  #:use-module (guix modules)
  #:use-module (gnu home services)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages emacs-build)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages version-control)
  #:use-module (doomemacs packages doomemacs)
  #:use-module (guix download)
  #:use-module (guix git-download)
  #:use-module (guix build-system copy)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module (ice-9 match)
  #:export (doomemacs-org-config
            doomemacs-example-config
            doomemacs-configuration
            home-doomemacs-service-type))

(define doomemacs-example-config
  (computed-file "doom-config"
    (with-imported-modules
        (source-module-closure '((guix build utils) (ice-9 string-fun)))
      #~(begin
          (use-modules (guix build utils) (ice-9 string-fun))
          (mkdir-p #$output)
          (for-each
           (lambda (f)
             (let* ((name (basename f))
                    (target (string-replace-substring name "example." "")))
               (copy-file f (string-append #$output "/" target))))
           (find-files (string-append #$doomemacs "/share/doomemacs/static")
                       "\\.example\\.el"))))))

(define* (doomemacs-org-config #:key src inputs)
  (package
    (name "doomemacs-config")
    (version "0")
    (source src)
    (build-system copy-build-system)
    (arguments
     (list
      #:install-plan
      #~'(("." "./" #:include-regexp ("\\.el$")))
      #:phases
      #~(modify-phases %standard-phases
          (add-before 'install 'tangle
            (lambda* (#:key inputs #:allow-other-keys)
              (invoke "emacs" "-Q" "--batch" "--eval"
                      (simple-format #f "~s"
                        '(progn
                          (require 'ob-tangle)
                          (setq org-confirm-babel-evaluate nil)
                          (with-current-buffer
                           (find-file-noselect "config.org")
                           (org-babel-tangle nil nil "elisp")))))

              (substitute* (find-files (getcwd) "\\.el$")
                (("\\(guix/pkg '([^ )]+)" all pkg)
                 (format #f "(concat ~s"
                         (or (assoc-ref inputs pkg)
                             (error (format #f "~a is required for emacs config but not present in inputs" pkg)))))))))))
    (native-inputs (list emacs-minimal))
    (inputs inputs)
    (description "doom config")
    (home-page #f) (synopsis #f) (license #f)))

(define-public (doomemacs-profile emacs doom config inputs)
  (package
    (name "doomemacs-profile")
    (version "0")
    (source (local-file "build-profile.el"))
    (build-system emacs-build-system)
    (arguments
     (list
      #:tests? #f
      #:emacs emacs
      #:modules `((ice-9 ftw) (srfi srfi-26)
                  ((ice-9 match) #:select (match-lambda))
                  (guix build utils)
                  (guix build emacs-utils)
                  (guix build emacs-build-system))
      #:phases
      #~(modify-phases %standard-phases
          (delete 'make-autoloads)
          (delete 'build)

          (add-before 'install 'build-profile
            (lambda* (#:key inputs #:allow-other-keys)
              (setenv "DOOMLOCALDIR" ".")
              (setenv "DOOMDIR" #$config)
              ;; shows otherwise suppressed output
              ;; i.e. the MISSING PACKAGES message of build-profile.el
              (setenv "DEBUG" "1")

              (setenv "DOOM_MODULE_PATH"
                      (string-join
                       (filter directory-exists?
                               (map (match-lambda
                                      ((name . directory)
                                       (string-append directory "/share/doomemacs/modules")))
                                    inputs))
                       ":"))
              (invoke "emacs" "-q" "--no-site-file" "--batch"
                      "--load" (search-input-file inputs "/share/doomemacs/early-init.el")
                      "--load" "build-profile.el")))
          (replace 'install
            (lambda _
              (install-file
               (string-append "etc/@/" (car (scandir "etc/@" (cut string-suffix? ".el" <>))))
               #$output))))))
    (inputs (cons* doom config inputs))
    (native-inputs (list git))
    (description "doom profile")
    (home-page #f) (synopsis #f) (license #f)))

(define-configuration/no-serialization doomemacs-configuration
  (emacs
   file-like
   "Emacs package to use.")
  (doomemacs
   file-like
   "Doomemacs package to use.")
  (config
   file-like
   "Doom config package.")
  (inputs
   (list-of-packages '())
   "Additional packages to install."))

(define home-doomemacs-service-type
  (service-type
    (name 'doomemacs)
    (extensions
     (list
      (service-extension
       home-profile-service-type
       (lambda (config) (list (doomemacs-configuration-doomemacs config))))
      (service-extension
       home-activation-service-type
       (match-lambda
         (($ <doomemacs-configuration> emacs doomemacs config inputs)
          #~(begin
              (use-modules (guix build utils))
              (define profile-dir (string-append (getenv "HOME") "/.local/doom/etc/@"))
              (mkdir-p (dirname profile-dir))
              (when (directory-exists? profile-dir)
                (delete-file-recursively profile-dir))
              (switch-symlinks
               profile-dir
               #$(doomemacs-profile emacs doomemacs config inputs))))))
      (service-extension
       home-environment-variables-service-type
       (const '(("DOOMLOCALDIR" . "$HOME/.local/doom/"))))
      (service-extension
       home-xdg-configuration-files-service-type
       (match-lambda
         (($ <doomemacs-configuration> emacs doomemacs config inputs)
          `(("emacs" ,(file-append doomemacs "/share/doomemacs"))
            ("doom" ,config)))))))
    (description "Doomemacs and its config.")))

;;; Local Variables:
;;; eval: (put 'computed-file 'scheme-indent-function 1)
;;; eval: (put 'simple-format 'scheme-indent-function 2)
;;; End:
