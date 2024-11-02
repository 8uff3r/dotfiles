;;; config --- config for emacs
;; -*- no-byte-compile: t; -*-
;;; commentary:
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
                                        ;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
                                        ;(package! another-package
                                        ;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
                                        ;(package! this-package
                                        ;  :recipe (:host github :repo "username/repo"
                                        ;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
                                        ;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
                                        ;(package! builtin-package :recipe (:nonrecursive t))
                                        ;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
                                        ;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
                                        ;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
                                        ;(unpin! pinned-package)
;; ...or multiple packages
                                        ;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
                                        ;(unpin! t)
;;; Code:

(unpin! org company)

(package! eshell-info-banner)
(package! outshine)
(package! shell-command-plus)
(package! highlight-indentation)
(package! smartparens)
(package! benchmark-init)
(package! kind-icon)
(package! origami)

(package! treemacs-projectile)
(package! treemacs-icons-dired)
(package! treemacs-all-the-icons)
(package! treemacs-magit)

(package! tide)

;; Org-mode
(package! denote)
(package! org-superstar)
(package! org-noter)
(package! org-download)
(package! org-remark)
(package! notebook-mode :recipe (:host github :repo  "rougier/notebook-mode"))
(package! weblorg)
(package! org-modern)
(package! org-journal)
(package! org-imenu :recipe (:host github :repo "rougier/org-imenu"))
(package! org-super-agenda)
(package! toc-org)
(package! olivetti)
(package! multifiles :recipe (:host github :repo "magnars/multifiles.el"))
(package! svg-tag-mode
  :recipe (:host github :repo "rougier/svg-tag-mode"
           :files ("svg-tag-mode.el")))

;;dired

(package! dired-hacks :recipe (:host github :repo "Fuco1/dired-hacks" :files ("*.el")))
(package! dired-hide-dotfiles)
(package! dired-rsync)
(package! dired+)
(package! peep-dired)


(package! multi-term)
(package! browse-kill-ring)
(package! embark)
(package! orderless)
(package! exec-path-from-shell)
(package! skewer-mode)
(package! impatient-mode)
(package! zoom)
(package! zoom-window)
(package! eimp)
(package! reformatter)
(package! apheleia :recipe (:host github :repo "radian-software/apheleia"))
(package! font-lock-studio :recipe (:host github :repo "lindydancer/font-lock-studio"))
(package! aweshell
  :recipe
  (:host github
   :repo "manateelazycat/aweshell"))
(package! lsp-tailwindcss :recipe (:host github :repo "merrickluo/lsp-tailwindcss"))
(package! vue-ts-mode :recipe (:host github :repo "8uff3r/vue-ts-mode"))
(package! treesit-auto
  :recipe
  (:host github
   :repo "renzmann/treesit-auto"
   :files ("*.el")))
(package! company-quickhelp)
;; (package! combobulate
;;   :recipe (
;;            :host github
;;            :repo "mickeynp/combobulate"
;;            :files ("*.el")))
(package! centaur-tabs)
(package! multiple-cursors)
(package! ob-typescript)
(package! gambit :recipe
  (:host github
   :repo "gambit/gambit"
   :files ("misc/gambit.el")
   :branch "master"))

(package! gerbil-mode :recipe
  (:host github
   :repo "mighty-gerbils/gerbil"
   :files ("etc/gerbil-mode.el")
   :branch "master"))
(package! evil-cleverparens)
(provide 'packages)
;;; packages.el ends here
