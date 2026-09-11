(define-module (doomemacs packages emacs-xyz)
  #:use-module (guix download)
  #:use-module (guix gexp)
  #:use-module (guix git-download)
  #:use-module (guix build-system emacs)
  #:use-module (guix packages)
  #:use-module ((guix licenses) #:prefix license:)
  #:use-module (guix utils)
  #:use-module (gnu packages)
  #:use-module (gnu packages emacs)
  #:use-module (gnu packages emacs-build)
  #:use-module (gnu packages emacs-xyz)
  #:use-module (gnu packages texinfo))

(define-public emacs-let-completion
  (package
    (name "emacs-let-completion")
    (version "20260407.1428")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/gggion/let-completion.el")
              (commit "460cdd5a73d857d6d91469e28f84f02465db8dac")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1k5xh50frvsjrzqzckca877fj5j6s6nmnxnf2jc7mz5rc4xvw6bp"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/gggion/let-completion.el")
    (synopsis "Show let-binding values in Elisp completion")
    (description
     "let-completion-mode makes Emacs Lisp in-buffer completion aware of
lexically enclosing binding forms.")
    (license license:gpl3)))

(define-public emacs-vi-tilde-fringe
  (package
    (name "emacs-vi-tilde-fringe")
    (version "20141028.242")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/syl20bnr/vi-tilde-fringe")
             (commit "f1597a8d54535bb1d84b442577b2024e6f910308")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wdm8k49zl6i6wnh7vjkswdh5m9lix56jv37xvc90inipwgs402z"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/syl20bnr/vi-tilde-fringe")
    (synopsis "Displays tildes in the fringe on empty lines a la Vi")
    (description
     "Display tildes on empty lines in the fringe, similar to Vim.")
    (license license:gpl3)))

(define-public emacs-auto-minor-mode
  (package
    (name "emacs-auto-minor-mode")
    (version "20180527.1123")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/joewreschnig/auto-minor-mode")
             (commit "17cfa1b54800fdef2975c0c0531dad34846a5065")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jgq9b262pjr6npza3k0p2glb6mpp0dfpslgx3i2p8a5ipwhwaqa"))))
    (build-system emacs-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://github.com/joewreschnig/auto-minor-mode")
    (synopsis "Enable minor modes by file name and contents")
    (description
     "Automatically enable minor modes based on file name and contents, similar to
@code{auto-mode-alist} but for minor modes.")
    (license license:gpl3)))

(define-public emacs-evil-quick-diff
  (package
    (name "emacs-evil-quick-diff")
    (version "20141028.242")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/rgrinberg/evil-quick-diff")
             (commit "69c883720b30a892c63bc89f49d4f0e8b8028908")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "15cww264lhddxh0d2ca5qd5nq5pda8hs4nj8mcpb5xlnmkayav50"))))
    (arguments '(#:tests? #f))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-evil))
    (home-page "https://github.com/rgrinberg/evil-quick-diff")
    (synopsis "Quick diff against selected text using Evil")
    (description
     "Provide quick diff functionality for Evil, allowing comparison of selected text
with other buffers or regions.")
    (license license:gpl3)))

(define-public emacs-better-jumper
  (package
    (name "emacs-better-jumper")
    (version "20241009.1517")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/gilbertw1/better-jumper")
             (commit "b1bf7a3c8cb820d942a0305e0e6412ef369f819c")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0cq99w9lpd9sg7hb6i9r6qirq626xcgzyjbk438h8qrjgm3xigh4"))))
    (build-system emacs-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://github.com/gilbertw1/better-jumper")
    (synopsis "Configurable jump list")
    (description
     "Configurable jump list for Emacs with optional Evil integration, allowing quick
navigation back to previous locations.")
    (license license:gpl2+)))

(define-public emacs-embark-consult
  (package
    (name "emacs-embark-consult")
    (version "20250622.535")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/oantolin/embark")
              (commit "7b3b2fa239c34c2e304eab4367a4f5924c047e2b")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hn4x5smylqviaqw35j9wccffsvfxp0q5jlnw0ynxny5c7pnp66l"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-compat emacs-embark emacs-consult))
    (arguments
     '(#:tests? #f #:include '("^embark-consult.el$")
       #:exclude '()))
    (home-page "https://github.com/oantolin/embark")
    (synopsis "Consult integration for Embark")
    (description
     "Integration between Embark and Consult, providing Consult-specific actions and
preview support in Embark Collect buffers.")
    (license license:gpl3)))

(define-public emacs-evil-easymotion
  (package
    (name "emacs-evil-easymotion")
    (version "20200424.135")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/PythonNut/evil-easymotion")
              (commit "f96c2ed38ddc07908db7c3c11bcd6285a3e8c2e9")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0xsva9bnlfwfmccm38qh3yvn4jr9za5rxqn4pwxbmhnx4rk47cch"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-avy))
    (inputs (list emacs-evil))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/pythonnut/evil-easymotion")
    (synopsis "A port of vim's easymotion to emacs")
    (description
     "Port of Vim's EasyMotion to Emacs, highlighting possible jump targets and
allowing single-key navigation to any position.")
    (license license:gpl3)))

(define-public emacs-evil-snipe
  (package
    (name "emacs-evil-snipe")
    (version "20250505.508")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/hlissner/evil-snipe")
              (commit "16317d7e54313490a0fe8642ed9a1a72498e7ad2")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0rg677wdybgjqz8kfr8v7xrcqw53qm1kxcsdsqqq8z0wklb0s29d"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-evil))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/hlissner/evil-snipe")
    (synopsis "Emulate vim-sneak & vim-seek")
    (description
     "Emulate vim-seek and vim-sneak in Evil, providing 2-character f/F/t/T motions
with incremental highlighting for precise jumping.")
    (license license:gpl3)))

(define-public emacs-evil-textobj-anyblock
  (package
    (name "emacs-evil-textobj-anyblock")
    (version "20170905.1907")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/willghatch/evil-textobj-anyblock")
              (commit "29280cd71a05429364cdceef2ff595ae8afade4d")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1009nmwkdk97hl6pnhlay234gx3krpgapqxj9nqfr7cwl3z89pc0"))))
    (arguments (list #:tests? #f))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-evil))
    (home-page "https://github.com/noctuid/evil-textobj-anyblock")
    (synopsis "Textobject for the closest user-defined blocks")
    (description
     "Text object for the nearest user-defined block from a configurable list,
similar to vim-textobj-anyblock.")
    (license license:gpl3)))

(define-public emacs-vimish-fold
  (package
    (name "emacs-vimish-fold")
    (version "20251023.1551")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/matsievskiysv/vimish-fold")
              (commit "f71f374d28a83e5f15612fa64aac1b2e78be2dcd")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0jsfp9kz1ydxck8ds5rghw1aqpmlz0k3l39glzcs8gq0jvb0q8fl"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-f))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/mrkkrp/vimish-fold")
    (synopsis "Fold text like in Vim")
    (description
     "Fold text like in Vim, with persistence, visual feedback, and avy integration.")
    (license license:gpl3)))

(define-public emacs-evil-vimish-fold
  (package
    (name "emacs-evil-vimish-fold")
    (version "20200122.117")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/alexmurray/evil-vimish-fold")
              (commit "b6e0e6b91b8cd047e80debef1a536d9d49eef31a")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "14qhfhk3d4c7v4jhr909dbxy8222flpqwk73bwg0pqwpkcifyv7n"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-evil emacs-vimish-fold))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/alexmurray/evil-vimish-fold")
    (synopsis "Integrate vimish-fold with evil")
    (description
     "Integrate vimish-fold with Evil, providing zf/zd bindings for fold creation and
deletion, and zj/zk for navigation between folds.")
    (license license:gpl3)))

(define-public emacs-exato
  (package
    (name "emacs-exato")
    (version "20200524.1319")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/ninrod/exato")
              (commit "aee7af7b7a0e7551478f453d1de7d5b9cb2e06c4")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0m98bwj8dy90ifck8rsda6zfgbjrv5z0166pp7qzvwls9rqa695m"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-evil))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/ninrod/exato")
    (synopsis "EXATO: Evil XML/HTML Attributes Text Object")
    (description
     "Evil text object for manipulating HTML/XML tag attributes, port of
vim-textobj-xmlattr.")
    (license license:gpl3)))

(define-public emacs-markdown-toc
  (package
    (name "emacs-markdown-toc")
    (version "20251210.2018")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/ardumont/markdown-toc")
              (commit "29e5c0f33ed026a5f993e4211f52debd7c02b3ba")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "12p9i6sah599lzpki4276g0lla137klnq796n11wkr0cas1rgbyg"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-markdown-mode emacs-dash emacs-s))
    (arguments '(#:tests? #f))
    (home-page "http://github.com/ardumont/markdown-toc")
    (synopsis "A simple TOC generator for markdown file")
    (description
     "Generate and update table of contents in Markdown files.")
    (license license:gpl3)))

(define-public emacs-highlight-quoted
  (package
    (name "emacs-highlight-quoted")
    (version "20140916.1822")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Fanael/highlight-quoted")
              (commit "24103478158cd19fbcfb4339a3f1fa1f054f1469")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gq8inxfni9zgz2brqm4nlswgr8b0spq15wr532xfrgr456g10ks"))))
    (build-system emacs-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://github.com/Fanael/highlight-quoted")
    (synopsis "Highlight Lisp quotes and quoted symbols")
    (description
     "Minor mode for highlighting Lisp quotes and quoted symbols.")
    (license license:gpl3)))

(define-public emacs-flycheck-popup-tip
  (package
    (name "emacs-flycheck-popup-tip")
    (version "20170812.2351")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/flycheck/flycheck-popup-tip")
              (commit "ef86aad907f27ca076859d8d9416f4f7727619c6")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1bi6f9nm4bylsbjv4qnkar35s6xzdf2cc2cxi3g691p9527apdz6"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-flycheck emacs-popup))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/flycheck/flycheck-popup-tip/")
    (synopsis "Display Flycheck error messages using popup.el")
    (description
     "Display Flycheck error messages in popup tooltips using popup.el.")
    (license license:gpl3)))

(define-public emacs-embrace
  (package
    (name "emacs-embrace")
    (version "20231027.419")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/cute-jumper/embrace.el")
              (commit "c7e748603151d7d91c237fd2d9cdf56e9f3b1ea8")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1c6fbkw1hl9bhdy62g782js8i9kgjr0pr132mpga12jd4cwf8mmz"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-expand-region))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/cute-jumper/embrace.el")
    (synopsis "Add/Change/Delete pairs based on `expand-region'")
    (description
     "Add, change, or delete paired delimiters using expand-region for selective
region expansion.")
    (license license:gpl3)))

(define-public emacs-yasnippet-capf
  (package
    (name "emacs-yasnippet-capf")
    (version "20250520.1105")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/elken/yasnippet-capf")
              (commit "f53c42a996b86fc95b96bdc2deeb58581f48c666")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1hwsra5w150dfswkvw3jryhkg538nm3ig74xzfplzbg0n6v7qs19"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-yasnippet))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/elken/yasnippet-capf")
    (synopsis "Yasnippet Completion At Point Function")
    (description
     "Yasnippet completion-at-point function for looking up snippets by name.")
    (license license:gpl3)))

(define-public emacs-ox-clip
  (package
    (name "emacs-ox-clip")
    (version "20240310.1513")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/jkitchin/ox-clip")
              (commit "a549cc8e1747beb6b7e567ffac27e31ba45cb8e8")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1i94p0nzhx1h181z6whkc3gbja85qk97xvmhx3p03a7b1pjswrhn"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-org emacs-htmlize))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/jkitchin/ox-clip")
    (synopsis "Cross-platform formatted copying for org-mode")
    (description
     "Cross-platform formatted clipboard copying for Org mode and other buffers using
HTML, with support for images and LaTeX equations.")
    (license license:gpl2+)))

(define-public emacs-overseer
  (package
    (name "emacs-overseer")
    (version "20240109.800")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/tonini/overseer.el")
              (commit "7fdcf1a6fba6b1569a09c1666b4e51bcde266ed9")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1f0nm253n0k2rcx0zydj8c4nn5gmvhabzraajxdqycb2ak77nbif"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-dash emacs-pkg-info emacs-f))
    (arguments '(#:tests? #f))
    (home-page "http://www.github.com/tonini/overseer.el")
    (synopsis "Ert-runner Integration Into Emacs")
    (description "Ert-runner integration for running ERT tests from Emacs.")
    (license license:gpl3)))

(define-public emacs-evil-embrace
  (package
    (name "emacs-evil-embrace")
    (version "20230820.445")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/cute-jumper/evil-embrace.el")
              (commit "3081d37811b6a3dfaaf01d578c7ab7a746c6064d")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "13rqkdhhzvnw3s49zm3v9xska8j8l1mr85czcfaf5vrm99lx8rl3"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-embrace emacs-evil-surround))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/cute-jumper/evil-embrace.el")
    (synopsis "Evil integration of embrace.el")
    (description
     "Integrate embrace.el with Evil surround, adding support for embrace
functionality in Evil's surround operations.")
    (license license:gpl3)))

(define-public emacs-bind-key
  (package
    (name "emacs-bind-key")
    (version "2.4.1")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://elpa.gnu.org/packages/bind-key-" version
                           ".tar"))
       (sha256
        (base32 "0jrbm2l6h4r7qjcdcsfczbijmbf3njzzzrymv08zanchmy7lvsv2"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/jwiegley/use-package")
    (synopsis "A simple way to manage personal keybindings")
    (description "Manage personal keybindings with a simple API.")
    (license license:gpl3+)))

(define-public emacs-nerd-icons-corfu
  (package
    (name "emacs-nerd-icons-corfu")
    (version "20250729.1544")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/LuigiPiucco/nerd-icons-corfu")
              (commit "f821e953b1a3dc9b381bc53486aabf366bf11cb1")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "036p45wqwrqhn5xv5sn3gsm2mb79gj6fk24zpkfa7wrv45qqgb21"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-nerd-icons))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/LuigiPiucco/nerd-icons-corfu")
    (synopsis "Icons for Corfu via nerd-icons")
    (description
     "Add Nerd Font icons to Corfu completion margins via nerd-icons.")
    (license license:gpl3)))

(define-public emacs-nav-flash
  (package
    (name "emacs-nav-flash")
    (version "20220726.1117")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/rolandwalker/nav-flash")
              (commit "5d4b48567862f6be0ca973d6b1dca90e4815cb9b")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0l6zamrh3n3416pgr2jhqabldl180zg0n4651g42jn8xcbwg4w6c"))))
    (build-system emacs-build-system)
    (arguments '(#:tests? #f))
    (home-page "http://github.com/rolandwalker/nav-flash")
    (synopsis "Briefly highlight the current line")
    (description
     "Briefly highlight the current line after navigation for visual orientation.")
    (license license:bsd-2)))

(define-public emacs-treemacs-nerd-icons
  (package
    (name "emacs-treemacs-nerd-icons")
    (version "20251024.1914")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/rainstormstudio/treemacs-nerd-icons")
              (commit "0c5ddcb978da639f01ddb023febc40fc755171e5")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0kmgxzskfkv6rz0s60p6pvwsp68c040060i9nnxx1fx5q2zjgzjd"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-nerd-icons emacs-treemacs))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/rainstormstudio/treemacs-nerd-icons")
    (synopsis "Emacs Nerd Font Icons theme for treemacs")
    (description
     "Nerd Font icons theme for treemacs.")
    (license license:gpl3)))

(define-public emacs-browse-at-remote
  (package
    (name "emacs-browse-at-remote")
    (version "20251223.2328")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/rmuslimov/browse-at-remote")
              (commit "cf0269f3db9e968c819b1d85b33d791c20c2e495")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ps67qpcbmr2csgjy9cs0934vv108da1gbs0n219l8visvjjcb34"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-f emacs-s))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/rmuslimov/browse-at-remote")
    (synopsis
     "Open github/gitlab/bitbucket/stash/gist/phab/sourcehut page from Emacs")
    (description
     "Open GitHub, GitLab, Bitbucket, and other repository pages from Emacs.")
    (license license:gpl3)))

(define-public emacs-consult-dash
  (package
    (name "emacs-consult-dash")
    (version "20250114.1511")
    (source
     (origin
       (method url-fetch)
       (uri (string-append "https://melpa.org/packages/consult-dash-" version
                           ".tar"))
       (sha256
        (base32 "1sb74hcq0k684a2ah4iv250qwpmlyw592hc00iww37c2gmdhjfvl"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-dash-docs emacs-consult))
    (arguments '(#:tests? #f))
    (home-page "https://codeberg.org/ravi/consult-dash")
    (synopsis "Consult front-end for dash-docs")
    (description
     "Consult front-end for dash-docs with automatic Embark integration.")
    (license license:gpl3)))

(define-public emacs-makefile-executor
  (package
    (name "emacs-makefile-executor")
    (version "20230224.1329")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Olivia5k/makefile-executor.el")
              (commit "d1d98eaf522a767561f6c7cbd8d2526be58b3ec5")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0wm0i2m124dglwq0szp6pdh2r0dln0xpgscw2immi9cchcmgcy4f"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-dash emacs-f emacs-s))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/Olivia5k/makefile-executor.el")
    (synopsis "Commands for conveniently running makefile targets")
    (description
     "Convenient tools for running Makefile targets interactively.")
    (license license:gpl3)))

(define-public emacs-gptel-magit
  (package
    (name "emacs-gptel-magit")
    (version "20250520.833")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/ragnard/gptel-magit")
              (commit "f27c01821b67ed99ddf705c2b995f78b71394d8b")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1jsq6jjka0visrm0fdvxd05p78d3n4gkl4i0pc1g825swcfqd182"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-magit emacs-gptel))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/ragnard/gptel-magit")
    (synopsis "Generate commit messages for magit using gptel")
    (description
     "Generate commit messages for Magit using gptel LLM integration.")
    (license license:gpl3)))

(define-public emacs-clojure-ts-mode
  (package
    (name "emacs-clojure-ts-mode")
    (version "20251202.1521")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/clojure-emacs/clojure-ts-mode")
              (commit "96fdffcbe9e1b8ebf9ad14e23b06f62cc3422e22")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1j78j9ig2x3g8qgsdrs38r3v0rva48c074d7kyag1aa0p7s37kr0"))))
    (build-system emacs-build-system)
    (arguments '(#:tests? #f))
    (home-page "http://github.com/clojure-emacs/clojure-ts-mode")
    (synopsis "Major mode for Clojure code")
    (description
     "Major mode for Clojure using Tree-sitter for font-lock, indentation, and
navigation.")
    (license license:gpl3)))

(define-public emacs-jet
  (package
    (name "emacs-jet")
    (version "20240730.1228")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/ericdallo/jet.el")
              (commit "c9a92675efd802f37df5e3eab7858dbbeced6ea4")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0vza4qwbvj8cz5jsjpz5ysvbk782zsgimxfqyz3h4pygwaxisxqj"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-transient))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/ericdallo/jet.el")
    (synopsis "Emacs integration for jet Clojure tool")
    (description
     "Emacs integration for the jet Clojure transformation tool via transient
interface.")
    (license license:gpl3)))

(define-public emacs-code-review
  (package
    (name "emacs-code-review")
    (version "20221206.113")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/doomelpa/code-review")
              (commit "303edcfbad8190eccb9a9269dfc58ed26d386ba5")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "09i2y2zc2cfwgl024flfz2jfzqbcarxrll9mwyn28s0ycjqy4j9n"))))
    (build-system emacs-build-system)
    (arguments
     (list #:test-command #~(list "buttercup" "-L" "test")
           #:emacs emacs                ; full for sqlite and libxml
           #:phases
           #~(modify-phases %standard-phases
               (add-after 'unpack 'enable-lexical-binding
                 (lambda _
                   (for-each
                    (lambda (file)
                      (emacs-batch-edit-file file
                        '(progn
                          (add-file-local-variable-prop-line 'lexical-binding t)
                          (basic-save-buffer))))
                    (find-files "test" "\\.el$"))))
               (add-before 'check 'set-home
                 (lambda _ (setenv "HOME" (getenv "TMPDIR")))))))
    (native-inputs (list emacs-buttercup))
    (propagated-inputs
     (list emacs-closql
           emacs-magit
           emacs-transient
           emacs-a
           emacs-ghub
           emacs-uuidgen
           emacs-deferred
           emacs-markdown-mode
           emacs-forge
           emacs-emojify))
    (home-page "https://github.com/wandersoncferreira/code-review")
    (synopsis "Perform code review from Github, Gitlab, and Bitbucket Cloud")
    (description
     "Review Pull Request in Emacs using a modern interface based on Magit Section and
Transient.  Currently supports Github, Gitlab, and Bitbucket Cloud.")
    (license license:gpl3)))

(define-public emacs-gorepl-mode
  (package
    (name "emacs-gorepl-mode")
    (version "20170905.945")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/manute/gorepl-mode")
              (commit "6a73bf352e8d893f89cad36c958c4db2b5e35e07")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0ydiq55ylm8ph2r5nlv9p7a5bnnxk3c9731l7mbzdhd43f734dld"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-s emacs-f emacs-hydra))
    (arguments '(#:tests? #f))
    (home-page "http://www.github.com/manute/gorepl-mode")
    (synopsis "Go REPL Interactive Development in top of Gore")
    (description
     "Go REPL interactive development environment for Emacs built on Gore.")
    (license license:gpl3)))

(define-public emacs-go-tag
  (package
    (name "emacs-go-tag")
    (version "20230111.651")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/brantou/emacs-go-tag")
              (commit "33f2059551d5298ca228d90f525b99d1a8d70364")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1nmxw99xqhr9sg5lafqjs7x033br8xz9106zc96gxf07v6zgbxy2"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-go-mode))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/brantou/emacs-go-tag")
    (synopsis "Edit Golang struct field tag")
    (description
     "Edit Golang struct field tags using gomodifytags.")
    (license license:gpl3)))

(define-public emacs-go-gen-test
  (package
    (name "emacs-go-gen-test")
    (version "20230616.2053")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/s-kostyaev/go-gen-test")
              (commit "af00a9abbaba2068502327ecdef574fd894a884b")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0q81zkyrl1njwxq29rx7gq9m9w3jags6akxzl7jd9yrnl4k2l27p"))))
    (build-system emacs-build-system)
    (arguments
     '(#:tests? #f #:include '("^go-gen-test.el$")
       #:exclude '()))
    (home-page "https://github.com/s-kostyaev/go-gen-test")
    (synopsis "Generate tests for go code with gotests")
    (description
     "Generate Go tests using gotests.")
    (license license:gpl3)))

(define-public emacs-flycheck-golangci-lint
  (package
    (name "emacs-flycheck-golangci-lint")
    (version "20251203.2053")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/weijiangan/flycheck-golangci-lint")
              (commit "f7e36e19d6af39d098b94a2e7524dbd7b585ce67")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1h77vyrx0cswwmqww0ac75vfw9v8ylxfr715rfh3c30920gb2ip8"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-flycheck))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/weijiangan/flycheck-golangci-lint")
    (synopsis "Flycheck checker for golangci-lint")
    (description
     "Flycheck checker for golangci-lint.")
    (license license:gpl3)))

(define-public emacs-restclient-jq
  (package
    (name "emacs-restclient-jq")
    (version "20250803.2119")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/emacsorphanage/restclient")
              (commit "1800a4e367c250051617d0b8c16a7cbd7f47da69")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "02yphcli11j0p6144rwh7l5whx4ahxm3y15nz0b7r3y04fm25w6g"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-restclient emacs-jq-mode))
    (arguments
     '(#:tests? #f #:include '("^restclient-jq.el$")
       #:exclude '()))
    (home-page "https://github.com/pashky/restclient.el")
    (synopsis "Support for setting restclient vars from jq expressions")
    (description
     "Set restclient variables from jq expressions applied to response bodies.")
    (license license:gpl3)))

(define-public emacs-flycheck-plantuml
  (package
    (name "emacs-flycheck-plantuml")
    (version "20171018.111")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/alexmurray/flycheck-plantuml")
              (commit "183be89e1dbba0b38237dd198dff600e0790309d")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1fbdbpwrlkvbgv693ndr3zamkf3gp28v94jg911fsav8bk08f6pq"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-flycheck emacs-plantuml-mode))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/alexmurray/flycheck-plantuml")
    (synopsis "Integrate plantuml with flycheck")
    (description
     "Automatically check PlantUML file syntax with Flycheck.")
    (license license:gpl3)))

(define-public emacs-pip-requirements
  (package
    (name "emacs-pip-requirements")
    (version "20240621.2151")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/Wilfred/pip-requirements.el")
              (commit "31e0dc62abb2d88fa765e0ea88b919d756cc0e4f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "08q225h8kahh632qkzpb1ih3jqg5imlzgrrh8ynkyxrr710madkl"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-dash))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/Wilfred/pip-requirements.el")
    (synopsis "A major mode for editing pip requirements files")
    (description
     "Major mode for editing pip requirements files with syntax highlighting and
completion.")
    (license license:gpl3)))

(define-public emacs-pipenv
  (package
    (name "emacs-pipenv")
    (version "20220514.123")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/pwalsh/pipenv.el")
              (commit "3af159749824c03f59176aff7f66ddd6a5785a10")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ak9dvjqhdm12i7yamgbqjmc4zmvy2f0gd1nia1q9dy3n6576ryq"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-s emacs-pyvenv emacs-load-env-vars))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/pwalsh/pipenv.el")
    (synopsis "A Pipenv porcelain")
    (description
     "Pipenv porcelain for Emacs, integrating virtual environment management.")
    (license license:gpl3)))

(define-public emacs-python-pytest
  (package
    (name "emacs-python-pytest")
    (version "20250726.1726")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/wbolster/emacs-python-pytest")
              (commit "ed2ecee09d1cccb4245842860d91940cb2fda769")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1787bks1zi47qglib42vnlqa7m4899n5vh1ics0013ldd89jqrr1"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-dash emacs-transient emacs-s))
    (arguments '(#:tests? #f #:exclude '()))
    (home-page "https://github.com/wbolster/emacs-python-pytest")
    (synopsis "Helpers to run pytest")
    (description
     "Helpers to run pytest with convenient keybindings and compilation integration.")
    (license license:gpl3)))

(define-public emacs-haml-mode
  (package
    (name "emacs-haml-mode")
    (version "20250714.1441")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/nex3/haml-mode")
              (commit "3bb4a96535eb5c81dbe6a43bfa8d67a778d449c0")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1svnggkqi7kk2pspgqb6ciqkiypg09gvph9q48mili17xfx44ll7"))))
    (build-system emacs-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://github.com/nex3/haml-mode")
    (synopsis "Major mode for editing Haml files")
    (description
     "Major mode for editing Haml template files.")
    (license license:gpl3)))

(define-public emacs-slim-mode
  (package
    (name "emacs-slim-mode")
    (version "20240513.2118")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/slim-template/emacs-slim")
              (commit "0b1b3803290f749cb85084adc75013254b513d41")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1gzxfbz22mxp5adfyasaspjq8k3fwrpcbgywwvyh4h3c72j9x1a7"))))
    (build-system emacs-build-system)
    (arguments '(#:tests? #f))
    (home-page "http://github.com/slim-template/emacs-slim")
    (synopsis "Major mode for editing Slim files")
    (description
     "Major mode for editing Slim template files.")
    (license license:gpl3)))

(define-public emacs-sass-mode
  (package
    (name "emacs-sass-mode")
    (version "20190502.53")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/nex3/sass-mode")
              (commit "247a0d4b509f10b28e4687cd8763492bca03599b")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1nhk12lhvkwdk8s8fx33p6rssi0gcfx2zkanq23rz6k28v5zi5yp"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-haml-mode))
    (arguments '(#:tests? #f))
    (home-page "http://github.com/nex3/haml/tree/master")
    (synopsis "Major mode for editing Sass files")
    (description
     "Major mode for editing Sass files.")
    (license license:gpl3)))

(define-public emacs-stylus-mode
  (package
    (name "emacs-stylus-mode")
    (version "20211019.2113")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/brianc/jade-mode")
              (commit "1ad7c51f3c6a6ae64550d9510c5e4e8470014375")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n26jlvf0z7h5yq3w2pzznj43g5xknq1icg68pc0ysqdfm4nq51m"))))
    (build-system emacs-build-system)
    (arguments
     '(#:tests? #f #:include '("^stylus-mode.el$")
       #:exclude '()))
    (home-page "https://github.com/brianc/jade-mode")
    (synopsis "Major mode for editing .styl files")
    (description
     "Major mode for the Stylus templating language.")
    (license license:bsd-3)))

(define-public emacs-sws-mode
  (package
    (name "emacs-sws-mode")
    (version "20210908.2121")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/brianc/jade-mode")
              (commit "1ad7c51f3c6a6ae64550d9510c5e4e8470014375")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1n26jlvf0z7h5yq3w2pzznj43g5xknq1icg68pc0ysqdfm4nq51m"))))
    (build-system emacs-build-system)
    (arguments
     '(#:tests? #f #:include '("^sws-mode.el$")
       #:exclude '()))
    (home-page "https://github.com/brianc/jade-mode")
    (synopsis "(S)ignificant (W)hite(S)pace mode")
    (description "Shared significant whitespace handling for jade-mode and stylus-mode.")
    (license license:bsd-3)))

(define-public emacs-treesit-fold
  (package
    (name "emacs-treesit-fold")
    (properties '((commit . "ec7e5b02e5d0f0902e19a42e5af4801817598fa3")))
    (version (git-version "0.2.1" "1" (assoc-ref properties 'commit)))
    (home-page "https://github.com/emacs-tree-sitter/treesit-fold")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url home-page)
              (commit (assoc-ref properties 'commit))))
       (sha256
        (base32 "15vybnsw4as1sk04czxz7dq1w3q5bc7837l9gfb3hzgp4ksgg8dd"))))
    (arguments (list #:tests? #f))
    (build-system emacs-build-system)
    (synopsis "Code folding using treesit")
    (description "Code folding using Tree-sitter.")
    (license license:gpl3+)))

(define-public emacs-circe-notifications
  (package
    (name "emacs-circe-notifications")
    (version "20180102.2318")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/eqyiel/circe-notifications")
              (commit "291149ac12877bbd062da993479d3533a26862b0")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "18mva5nn919c86sgk6kdh437vdnlh9bk7fg10xqcpics1yv3viaw"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-circe emacs-alert))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/eqyiel/circe-notifications")
    (synopsis "Add desktop notifications to Circe")
    (description "Send desktop notifications for new Circe IRC messages.")
    (license license:gpl3)))

(define-public emacs-uuidgen
  (package
    (name "emacs-uuidgen")
    (version "20240201.2318")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/kanru/uuidgen-el")
              (commit "cebbe09d27c63abe61fe8c2e2248587d90265b59")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1ih6kj3inwdxypbqj2n5vnfxmc6rfrx114w8bdy60yd8klx7273d"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/kanru/uuidgen-el")
    (synopsis "Provides various UUID generating functions")
    (description
     "Generate RFC 4122 UUIDs (v1, v3, v4, and v5) in Emacs Lisp.")
    (license license:gpl3)))

(define-public emacs-load-env-vars
  (package
    (name "emacs-load-env-vars")
    (version "20180511.2210")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/diasjorge/emacs-load-env-vars")
              (commit "3808520efaf9492033f6e11a9bffd68eabf02a0f")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "0yw1ihns914k8va5mhphch1zix09x22cpgrbw968mh8hviknyvzr"))))
    (build-system emacs-build-system)
    (arguments '(#:tests? #f))
    (home-page "https://github.com/diasjorge/emacs-load-env-vars")
    (synopsis "Load environment variables from files")
    (description
     "Load environment variables from a file with bash-style variable declarations.")
    (license license:gpl3)))

;; hlissner's fork
(define-public emacs-helpful-next
  (package
    (name "emacs-helpful")
    (properties '((commit . "e3e06eab5ee93470f009d68c5d398a9619d4c382")))
    (version (git-version "0.22" "0" (assoc-ref properties 'commit)))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/hlissner/helpful")
              (commit (assoc-ref properties 'commit))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1d1z5ix6dq5iv6kjyq8a43ryyfg01vwpgqkhwvx24zw1v162s605"))))
    (build-system emacs-build-system)
    (arguments '(#:tests? #f))          ; fail
    (propagated-inputs (list emacs-elisp-refs))
    (native-inputs
     (list emacs-ert-runner emacs-undercover))
    (home-page "https://github.com/Wilfred/helpful")
    (synopsis "More contextual information in Emacs help")
    (description "More contextual information in Emacs help")
    (license license:gpl3+)))

(define-public emacs-dirvish-next
  (package
    (inherit emacs-dirvish)
    (name "emacs-dirvish")
    (properties '((commit . "300b6b2536006aaf5f803775ca93ca5f6ec35de1")))
    (version (git-version "2.3.0" "0" (assoc-ref properties 'commit)))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/latiagertrutis/dirvish")
              (commit (assoc-ref properties 'commit))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11849fiaz9vg1dwvvfwz0c5rzh01wx11rqq2r2sg71mj00yfvkb5"))))))

(define-public emacs-evil-org-next
  (package
    (inherit emacs-evil-org)
    (name "emacs-evil-org")
    (properties '((commit . "06518c65ff4f7aea2ea51149d701549dcbccce5d")))
    (version (git-version "1.0.3" "3" (assoc-ref properties 'commit)))
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/doomelpa/evil-org-mode")
              (commit (assoc-ref properties 'commit))))
       (file-name (git-file-name name version))
       (sha256
        (base32 "11r3aim8qvyddp9d7sphcd0hl3vwxl81z83aifzgx89jb5ivfn6y"))))))
