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
     "Usage ----- To toggle the mode locally: M-x vi-tilde-fringe-mode To toggle the
mode globally: M-x global-vi-tilde-fringe-mode To turn it on automatically only
for programming modes: (add-hook prog-mode-hook vi-tilde-fringe-mode)
Customization ------------- Open the customization group buffer: M-x
customize-group RET vi-tilde-fringe RET There you can change the bitmap array or
the face of the symbol drawn in the fringe.  By default the symbol is a tilde
:-) and its face simply inherits from `default'.")
    (license #f)))

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
     "This package lets you enable minor modes based on file name and contents.  To
find the right modes, it checks filenames against patterns in
‘auto-minor-mode-alist’ and file contents against ‘auto-minor-mode-magic-alist’.
 These work like the built-in Emacs variables ‘auto-mode-alist’ and
‘magic-mode-alist’.  Unlike major modes, all matching minor modes are enabled,
not only the first match.  A reason you might want to use it: (add-to-list
auto-minor-mode-alist (\"-theme\\\\.el\\\\'\" .  rainbow-mode)) There’s intentionally
no equivalent of ‘interpreter-mode-alist’.  Interpreters should determine the
major mode.  Relevant minor modes can then be enabled by major mode hooks.
Minor modes are set whenever ‘set-auto-mode’, the built-in function responsible
for handling automatic major modes, is called.  If you also use ‘use-package’,
two new keywords are added, ‘:minor’ and ‘:magic-minor’, which register entries
in these alists.  You must load (and not defer) ‘auto-minor-mode’ before using
these keywords for other packages.")
    (license #f)))

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
    (synopsis "#f")
    (description "#f")
    (license #f)))

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
     "Better-jumper is configurable jump list implementation for Emacs that can be
used to easily jump back to previous locations.  That provides optional
integration with evil.  To enable globally: (require better-jumper)
(better-jumper-mode 1) See included README.md for more information.")
    (license #f)))

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
     "This package provides integration between Embark and Consult.  The package will
be loaded automatically by Embark.  Some of the functionality here was
previously contained in Embark itself: - Support for consult-buffer, so that you
get the correct actions for each type of entry in consult-buffer's list. -
Support for consult-line, consult-outline, consult-mark and consult-global-mark,
so that the insert and save actions don't include a weird unicode character at
the start of the line, and so you can export from them to an occur buffer (where
occur-edit-mode works!).  Just load this package to get the above functionality,
no further configuration is necessary.  Additionally this package contains some
functionality that has never been in Embark: access to Consult preview from
auto-updating Embark Collect buffer that is associated to an active minibuffer
for a Consult command.  For information on Consult preview, see Consult's info
manual or its readme on @code{GitHub}.  If you always want the minor mode
enabled whenever it possible use: (add-hook embark-collect-mode-hook
#'consult-preview-at-point-mode) If you don't want the minor mode automatically
on and prefer to trigger the consult previews manually use this instead:
(keymap-set embark-collect-mode-map \"C-j\" #'consult-preview-at-point).")
    (license #f)))

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
     "This is a clone of the popular easymotion package for vim, which describes
itself in these terms: > @code{EasyMotion} provides a much simpler way to use
some motions in vim. > It takes the <number> out of <number>w or <number>f{char}
by > highlighting all possible choices and allowing you to press one key > to
jump directly to the target.  If you're having trouble picturing this, please
visit the github repo for a screencast.  Usage/status ============
evil-easymotion, rather unsurprisingly can use evil.  However, you don't _need_
evil to use it.  evil-easymotion can happily define motions for regular emacs
commands.  With that said, evil is recommended, not least because it's awesome.
Currently most motions are supported, and it's easy to define your own
easymotions. (evilem-define (kbd \"SPC w\") evil-forward-word-begin) To define
easymotions for all motions that evil defines by default, add
(evilem-default-keybindings \"SPC\") This binds all motions under the prefix `SPC`
in `evil-motion-state-map`.  This is not done by default for motions defined
manually.  You will need to supply the prefix.  More advanced use-cases are
detailed in the github README.")
    (license #f)))

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
     "Evil-snipe emulates vim-seek and/or vim-sneak in evil-mode.  It provides
2-character versions of evil's f/F/t/T motions, for quick and more accurately
jumping around text, plus incremental highlighting (for f/F/t/T as well).  To
enable globally: (require evil-snipe) (evil-snipe-mode 1) To replace evil-mode's
f/F/t/T functionality with (1-character) sniping: (evil-snipe-override-mode 1)
See included README.md for more information.")
    (license #f)))

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
     "This package is a port of vim-textobj-anyblock.  It gives text objects for the
closest block of those defined in the evil-anyblock-blocks alist.  By default it
includes (), {}, [], <>, , \"\", ``, and “”.  This is convenient for operating on
the closest block without having to choose between typing something like i{ or
i<.  This package allows for the list of blocks to be changed.  They can be more
complicated regexps.  A simple expand-region like functionality is also provided
when in visual mode, though this is not a primary focus of the plugin and does
not exist in vim-textobj-anyblock.  Also, in the case that the point is not
inside of a block, anyblock will seek forward to the next block.  The required
version of evil is based on the last change I could find to evil-select-paren,
but the newest version of evil is probably preferable.  For more information see
the README in the github repo.")
    (license #f)))

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
     "This is a package to perform text folding like in Vim.  It has the following
features: * folding of active regions; * good visual feedback: it's obvious
which part of text is folded; * persistence by default: when you kill a buffer
your folds don't disappear; * persistence scales well, you can work on hundreds
of files with lots of folds without adverse effects; * it does not break
indentation; * folds can be toggled from folded state to unfolded and back very
easily; * quick navigation between existing folds; * you can use mouse to unfold
folds (good for beginners and not only for them); * for fans of `avy package:
you can use `avy to fold text with minimal number of key strokes!")
    (license #f)))

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
     "Integrate `vimish-fold with `evil'.  Provides bindings to create and delete
folds via \"zf\" and \"zd\" respectively, and provides integration of usual vim fold
commands via `vimish-fold`.  Also supports navigation between folds using \"zj\" /
\"zk\" respectively.")
    (license #f)))

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
     "This package provides the `x` text object to manipulate html/xml tag attributes.
 it is a port of https://github.com/whatyouhide/vim-textobj-xmlattr vim plugin.
Try using `dax`, `vix` and `@code{gUix`}.  You can customize the binding.  To
install the package, Just use https://melpa.org.  Here's an oneliner using
https://github.com/jwiegley/use-package: (use-package exato :ensure t)
*customization*: to change the bind from `x` to your liking, you can customize
exato-key: (use-package exato :ensure t :init (setq exato-key \"h\")).")
    (license #f)))

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
     "Generate a TOC from a markdown file: M-x markdown-toc-generate-toc This will
compute the TOC at insert it at current position.  Update existing TOC: C-u M-x
markdown-toc-generate-toc Here is a possible output: <!-- markdown-toc start -
Don't edit this section.  Run M-x markdown-toc-refresh-toc --> **Table of
Contents** - [some markdown page title](#some-markdown-page-title) - [main
title](#main-title) - [Sources](#sources) - [Marmalade
(recommended)](#marmalade-recommended) - [Melpa-stable](#melpa-stable) - [Melpa
(~snapshot)](#melpa-~snapshot) - [Install](#install) - [Load
org-trello](#load-org-trello) - [Alternative](#alternative) - [Git](#git) -
[Tar](#tar) - [another title](#another-title) - [with](#with) - [some](#some) -
[heading](#heading) <!-- markdown-toc end --> Install - M-x package-install RET
markdown-toc RET.")
    (license #f)))

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
     "Minor mode proving highlight of Lisp quotes and quoted symbols.")
    (license #f)))

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
     "This is extension for Flycheck.  It displays Flycheck error messages in buffer
using `popup.el library.  For more information about Flycheck:
http://www.flycheck.org/ https://github.com/flycheck/flycheck For more
information about this Flycheck extension:
https://github.com/flycheck/flycheck-popup-tip ;; Setup Add to your `init.el':
(with-eval-after-load flycheck (add-hook flycheck-mode-hook
flycheck-popup-tip-mode)).")
    (license #f)))

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
    (description "TODO")
    (license #f)))

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
     "Yasnippet Completion at Point Function to lookup snippets by name Simply add to
the list of existing `completion-at-point-functions thus: (add-to-list
completion-at-point-functions #'yasnippet-capf) If you prefer to have the lookup
done by name rather than key, set `yasnippet-capf-lookup-by'.")
    (license #f)))

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
     "This module copies selected regions in org-mode as formatted text on the
clipboard that can be pasted into other applications.  When not in org-mode, the
htmlize library is used instead.  For Windows the html-clip-w32.py script will
be installed.  It works pretty well, but I noticed that the hyperlinks in the
TOC to headings don't work, and strike-through doesn't seem to work.  I have no
idea how to fix either issue.  Mac OSX needs textutils and pbcopy, which should
be part of the base install.  Linux needs a relatively modern xclip, preferrably
a version of at least 0.12.  https://github.com/astrand/xclip The main command
is `ox-clip-formatted-copy that should work across Windows, Mac and Linux.  By
default, it copies as html.  Note: Images/equations may not copy well in html.
Use `ox-clip-image-to-clipboard to copy the image or latex equation at point to
the clipboard as an image.  The default latex scale is too small for me, so the
default size for this is set to 3 in `ox-clip-default-latex-scale'.  This
overrides the settings in `org-format-latex-options'.")
    (license #f)))

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
    (description "Ert-runner Integration Into Emacs.")
    (license #f)))

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
    (description "TODO")
    (license #f)))

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
    (description synopsis)
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
     "Introduces a margin formatter for Corfu which adds icons.  The icons are
configurable, but should be text icons provided by the icons fonts in
`nerd-icons'.  To use, install the package and add the following to your init:
(add-to-list corfu-margin-formatters #'nerd-icons-corfu-formatter).")
    (license #f)))

(define-public emacs-nerd-icons-completion
  (package
    (name "emacs-nerd-icons-completion")
    (version "20251029.2106")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
              (url "https://github.com/rainstormstudio/nerd-icons-completion")
              (commit "d09ea987ed3d2cc64137234f27851594050e2b64")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "022yfkfvcywgjplvsj5xajmc24q1c7yx0l5mvnzagjfdg4iajidv"))))
    (build-system emacs-build-system)
    (propagated-inputs (list emacs-nerd-icons emacs-compat))
    (arguments '(#:tests? #f))
    (home-page "https://github.com/rainstormstudio/nerd-icons-completion")
    (synopsis "Add icons to completion candidates")
    (description
     "Add nerd-icons to completion candidates.  nerd-icons-completion is inspired by
`all-the-icons-completion': https://github.com/iyefrat/all-the-icons-completion.")
    (license #f)))

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
     "Quickstart (require nav-flash) (nav-flash-show) Explanation Nav-flash
temporarily highlights the line containing the point, which is sometimes useful
for orientation after a navigation command.  To use nav-flash, place the
nav-flash.el library somewhere Emacs can find it, and add the following to your
~/.emacs file: (require nav-flash) There is no user-level interface for this
library; it is only used by other Lisp libraries.  However, you might find it
useful to call `nav-flash-show in your ~/.emacs file.  For example, the
following hook causes a flash to appear after navigating via imenu: (add-hook
imenu-after-jump-hook nav-flash-show nil t) See Also M-x customize-group RET
nav-flash RET M-x customize-group RET pulse RET Notes This library reuses a
timer and overlay defined in compile.el, but should not affect the normal use of
compile.el / `next-error'.  Pulse.el provides similar functionality and is
included with Emacs.  This library can use pulse.el, but does not do so by
default, because pulse.el uses `sit-for', breaking this type of construction:
(nav-flash-show) (with-temp-message \"message here\" (sit-for 2)) When using an
overlay and timer for cleanup (as nav-flash does by default) the flash and
message appear simultaneously.  Nav-flash.el is also simpler than pulse.el.
Compatibility and Requirements GNU Emacs version 25.1-devel : not tested GNU
Emacs version 24.5 : not tested GNU Emacs version 24.4 : yes GNU Emacs version
24.3 : yes GNU Emacs version 23.3 : yes GNU Emacs version 22.2 : yes, with some
limitations GNU Emacs version 21.x and lower : unknown No external dependencies
Bugs No known bugs.  TODO Check pulse period on other platforms. ; License
Simplified BSD License: Redistribution and use in source and binary forms, with
or without modification, are permitted provided that the following conditions
are met: 1.  Redistributions of source code must retain the above copyright
notice, this list of conditions and the following disclaimer.  2.
Redistributions in binary form must reproduce the above copyright notice, this
list of conditions and the following disclaimer in the documentation and/or
other materials provided with the distribution.  This software is provided by
Roland Walker \"AS IS\" and any express or implied warranties, including, but not
limited to, the implied warranties of merchantability and fitness for a
particular purpose are disclaimed.  In no event shall Roland Walker or
contributors be liable for any direct, indirect, incidental, special, exemplary,
or consequential damages (including, but not limited to, procurement of
substitute goods or services; loss of use, data, or profits; or business
interruption) however caused and on any theory of liability, whether in
contract, strict liability, or tort (including negligence or otherwise) arising
in any way out of the use of this software, even if advised of the possibility
of such damage.  The views and conclusions contained in the software and
documentation are those of the authors and should not be interpreted as
representing official policies, either expressed or implied, of Roland Walker.")
    (license #f)))

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
    (description "nerd-icons theme for treemacs.")
    (license #f)))

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
     "Easily open target page on github/gitlab (or bitbucket) from Emacs.  by calling
`browse-at-remote` function.  Support dired buffers and opens them in tree mode
at destination.")
    (license #f)))

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
     "consult-dash is the only interface function, a consult front-end for dash-docs.
Embark integration is automatically provided. ; To do - Avoid concatenating
commands through the shell.")
    (license #f)))

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
     "This package provides a set of tools aimed at working with Makefiles on a
project level.  Currently available: - Interactively selecting a make target and
running it.  Bound to C-c C-e when makefile-executor-mode is enabled. -
Re-running the last execution.  We usually run things in Makefiles many times
after all! Bound to `C-c C-c'` in `makefile-mode` when makefile-executor-mode'`
is enabled. - Running a makefile target in a dedicated buffer.  Useful when
starting services and other long-running things! Bound to `C-c C-d'` in
`makefile-mode` when makefile-executor-mode'` is enabled. - Calculation of
variables et.c.; $(BINARY) will show up as what it evaluates to. - Via
`project.el', execution from any buffer in a project.  If more than one makefile
is found, an interactive prompt for one is shown.  If `projectile is installed,
this is added to the `projectile-commander on the m key.  To enable it, use the
following snippet to add the hook into makefile-mode': (add-hook
makefile-mode-hook makefile-executor-mode).")
    (license #f)))

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
     "This package uses the gptel library to add LLM integration into magit.
Currently, it adds functionality for generating commit messages.")
    (license #f)))

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
     "This package provides font-lock, indentation, and navigation for the Clojure
programming language (http://clojure.org).  For the Tree-sitter grammar this
mode is based on, see https://github.com/sogaiu/tree-sitter-clojure.  Using
clojure-ts-mode with paredit or smartparens is highly recommended.  Here are
some example configurations: ;; require or autoload paredit-mode (add-hook
clojure-ts-mode-hook #'paredit-mode) ;; require or autoload smartparens
(add-hook clojure-ts-mode-hook #'smartparens-strict-mode) See inf-clojure
(http://github.com/clojure-emacs/inf-clojure) for basic interaction with Clojure
subprocesses.  See CIDER (http://github.com/clojure-emacs/cider) for better
interaction with subprocesses via @code{nREPL}.")
    (license #f)))

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
     "Emacs integration for jet Clojure tool: https://github.com/borkdude/jet The main
entrypoint is the `jet command which will use `transient to display a smooth
interface to customize the command to be executed.  The other public functions
are available to be used as quick commands or to keybind.")
    (license #f)))

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
     "Minor mode proving highlight of Lisp quotes and quoted symbols.")
    (license #f)))

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
     "This module copies selected regions in org-mode as formatted text on the
clipboard that can be pasted into other applications.  When not in org-mode, the
htmlize library is used instead.  For Windows the html-clip-w32.py script will
be installed.  It works pretty well, but I noticed that the hyperlinks in the
TOC to headings don't work, and strike-through doesn't seem to work.  I have no
idea how to fix either issue.  Mac OSX needs textutils and pbcopy, which should
be part of the base install.  Linux needs a relatively modern xclip, preferrably
a version of at least 0.12.  https://github.com/astrand/xclip The main command
is `ox-clip-formatted-copy that should work across Windows, Mac and Linux.  By
default, it copies as html.  Note: Images/equations may not copy well in html.
Use `ox-clip-image-to-clipboard to copy the image or latex equation at point to
the clipboard as an image.  The default latex scale is too small for me, so the
default size for this is set to 3 in `ox-clip-default-latex-scale'.  This
overrides the settings in `org-format-latex-options'.")
    (license #f)))

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
     "This library provides a Go repl interactive development environment for Emacs,
built on top of Gore (https://github.com/motemen/gore).")
    (license #f)))

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
     "Edit field tags for golang struct fields, based on gomodifytags.  This package
is inspired by @code{GoAddTags} of vim-go and go-add-tags.")
    (license #f)))

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
     "This package is simple wrapper for https://github.com/cweill/gotests You should
install `gotests for use it.")
    (license #f)))

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
     "Flycheck checker for golangci-lint Usage: (eval-after-load flycheck (add-hook
flycheck-mode-hook #'flycheck-golangci-lint-setup)).")
    (license #f)))

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
     "This is a companion to restclient.el to add support for setting variables from
results using jq expressions.")
    (license #f)))

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
     "This packages integrates plantuml with flycheck to automatically check the
syntax of your plantuml files on the fly ;; Setup (with-eval-after-load flycheck
(require flycheck-plantuml) (flycheck-plantuml-setup)).")
    (license #f)))

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
     "This is a major mode for editing pip requirements files, with the following
features: * Syntax highlighting * Togglable comments * Auto completion of
package names from @code{PyPI} TODO: Steal shamelessly all the fantasic ideas in
https://github.com/wuub/requirementstxt.")
    (license #f)))

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
    (description "See https://github.com/pwalsh/pipenv.el for documentation.")
    (license #f)))

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
     "This package provides helpers to run pytest.  See README for details.")
    (license #f)))

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
     "Because Haml's indentation schema is similar to that of YAML and Python, many
indentation-related functions are similar to those in yaml-mode and python-mode.
 To install, save this on your load path and add the following to your .emacs
file: (require haml-mode).")
    (license #f)))

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
     "Because Slim's indentation schema is similar to that of YAML and Python, many
indentation-related functions are similar to those in yaml-mode and python-mode.
 To install, save this on your load path and add the following to your .emacs
file: (require slim-mode).")
    (license #f)))

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
     "Because Sass's indentation schema is similar to that of YAML and Python, many
indentation-related functions are similar to those in yaml-mode and python-mode.
 To install, save this on your load path and add the following to your .emacs
file: (require sass-mode) sass-mode requires haml-mode, which can be found at
http://github.com/nex3/haml-mode.")
    (license #f)))

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
     "Major mode for the Stylus templating language (https://stylus-lang.com/).")
    (license #f)))

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
    (description "Common code for the jade-mode and stylus-mode.")
    (license #f)))

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
    (description "fold using treesit")
    (license license:gpl3+)))

(define-public emacs-grip-mode
  (package
    (name "emacs-grip-mode")
    (version "20260324.1109")
    (source
     (origin
       (method git-fetch)
       (uri (git-reference
             (url "https://github.com/seagle0128/grip-mode")
             (commit "d2d27240d0150c00f0b9a5d7d840357e84d4728d")))
       (file-name (git-file-name name version))
       (sha256
        (base32 "1x0r8zcblbzzjx9w192mygndga6qp4baq4xkyvsny121vifdb9za"))))
    (build-system emacs-build-system)
    (home-page "https://github.com/seagle0128/grip-mode")
    (synopsis "Instant GitHub-flavored Markdown/Org preview")
    (description "Instant GitHub-flavored Markdown/Org preview using
@code{grip}, @code{mdopen} or @code{go-grip}.")
    (license license:gpl3)))

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
    (description "No description available.")
    (license #f)))

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
     "This is a naive implementation of RFC4122 Universally Unique IDentifier
generation in elisp.  Currently implemented are UUID v1 v3, v4 and v5
generation.  The resolution of the time based UUID is microseconds, which is 10
times of the suggested 100-nanosecond resolution, but should be enough for
general usage.")
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
     "This package allows you set environment variables loaded from a file with bash
style variable declarations.  Supported syntax: export KEY=VALUE KEY=VALUE
KEY='VALUE KEY=\"VALUE\" # Comment lines are ignored KEY=VALUE # Inline comments
are ignored KEY: VALUE.")
    (license #f)))

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
