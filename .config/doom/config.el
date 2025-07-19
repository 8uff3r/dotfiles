;;; config.el -*- lexical-binding: t; -*-
(setq user-full-name "Rylan"
      user-mail-address "8uff3r@gmail.com")
;;(setq native-comp-speed 3)

(setq doom-theme 'doom-acario-dark)

;;(use-package package-lint :defer t)
(setq font-lock-maximum-decoration 3)
(setq display-line-numbers-type 'relative)
(setq scroll-margin 8)
(setq maximum-scroll-margin 8)

(setq org-directory "~/org/")

;; (set-popup-rules!
;; '(("^ \\*" :slot -1)
;;  ("\\*Org Agenda\\*")
;;  ("\\*Equake*" :quit t)))
;; (set-popup-rule! "^\\*Geiser" :ignore t :ttl 'nil :quit 'nil)
(after! geiser
  (set-popup-rules!
   '(("^\\*Geiser"
      :width 100
      :quit nil
      :select 't
      :ttl nil))))
(after! sly
  (set-popup-rules!
   '(("^\\*sly-mrepl"
      :width 100
      :quit nil
      :select 't
      :ttl nil))))
(custom-set-faces
 `(mode-line ((t (:background ,"#1C1B21")))))
;(+global-word-wrap-mode)
(setq fancy-splash-image "~/.config/doom/doom.png")
(setq doom-modeline-major-mode-color-icon t)
(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")
(setq doom-modeline-major-mode-icon t)
(map! :map +doom-dashboard-mode-map
      :ne "f" #'find-file
      :ne "j n" #'org-journal-new-entry
      :ne "j d" (cmd! (doom-project-find-file "/home/mk/Documents/journal"))
      :ne "r" #'consult-recent-file
      :ne "a" #'org-agenda
      :ne "p" #'doom/open-private-config
      :ne "c" (cmd! (find-file (expand-file-name "config.org" doom-private-dir)))
      :ne "." (cmd! (doom-project-find-file "~/.config/")) ; . for dotfiles
      ;;:ne "b" #'+vertico/switch-workspace-buffer
      :ne "B" #'consult-buffer
      :ne "h" (cmd! (find-file "/home/mk/"))
      :ne "e" #'emms-run
      :ne "d" (cmd! (pdf-tools-install) (calibredb))
      :ne "b" #'benchmark-init/show-durations-tabulated
      :ne "q" #'save-buffers-kill-terminal
      (:leader
       :nme "e" #'eval-last-sexp
       :nm "w f" (cmd! (run-in-background "~/Desktop/WIFI-fix"))))
;; (add-hook '+doom-dashboard-functions #'doom-dashboard-widget-shortmenu)
(add-hook! '+doom-dashboard-mode-hook (hide-mode-line-mode 1) (hl-line-mode -1))
(setq-hook! '+doom-dashboard-mode-hook evil-normal-state-cursor (list nil))
(add-hook! 'doom-switch-buffer-hook (+nav-flash-blink-cursor-maybe))

(tool-bar-mode -1)
(menu-bar-mode -1)
(savehist-mode -1)

(setq scroll-step 1)
(setq confirm-kill-processes nil)

;; (add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font"))

(dolist (mode '(org-mode-hook
                term-mode-hook
                shell-mode-hook
                treemacs-mode-hook
                eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))

(setq doom-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 17)

      doom-big-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 20)
      ;; doom-variable-pitch-font (font-spec :family "Overpass" :size 20)
      doom-variable-pitch-font (font-spec :family "JetBrainsMono Nerd Font Mono" :size 19)
      ;; doom-unicode-font (font-spec :family "Overpass Mono")
      doom-unicode-font (font-spec :family "JetBrainsMono Nerd Font Mono")
      ;; doom-serif-font (font-spec :family "IBM Plex Mono" :weight 'light)
      doom-serif-font (font-spec :family "JetBrainsMono Nerd Font Mono" :weight 'light)
      )

;; (setq-default shell-file-name "/usr/bin/nu")
;; (setq! vterm-shell "/usr/bin/fish")
(setenv "PATH"
  (concat
   "$HOME/.local/bin:/usr/local/bin:$HOME/.local/bin:/$HOME/go/bin/:$HOME/.emacs.d/bin/:$HOME/.flutter/bin/:$HOME/.cabal/bin/:$HOME/.pub-cache/bin:$HOME/.roswell/bin"
   (getenv "PATH")
  )
)

(defun kill-buffer-and-window()
  "Kill both buffer and its window"
  (interactive)
  (kill-current-buffer)
  (delete-window))

(setq mouse-autoselect-window t
      focus-follows-mouse t)
(define-key evil-normal-state-map "\C-h" nil)
(define-key evil-normal-state-map "\C-l" nil)
(define-key evil-normal-state-map "H" nil)
(define-key evil-normal-state-map "L" nil)
(map!
 "M-p" #'forward-char
 "M-n" #'backward-char
 "s-v" #'consult-yank-from-kill-ring
 (:map vterm-mode-map
  :nmi "C-M-l" #'vterm-clear
  :nm "C-g" #'+vterm/toggle)
 (:map equake-mode-map
  :nm "C-g" #'quit-window
  :nm "<escape>" (cmd! (delete-frame nil t)))
 (:map term-mode-map
  :nm "<escape>" (cmd! (delete-window))
  :nm "C-g" (cmd! (delete-window)))
 "C-:" #'comment-region
 "C-:" #'uncomment-region
 (:leader
  :nmi "z z" #'zoom-window-zoom
  :nmi "z n" #'zoom-window-next
  :nm "l" #'evil-delete-whole-line
  :nm "b v" (cmd! (switch-to-buffer "► Doom"))
  :nm "k" #'kill-buffer-and-window
  :nm "m" #'consult-buffer
  :nm "r" #'consult-recent-file
  :nm "o e" (cmd!
             (multi-term-dedicated-toggle)
             (multi-term-dedicated-select))
  :nm "f g" #'consult-ripgrep
  :nm "v" #'frog-jump-buffer
  :nm "c n" (cmd! (run-in-background "dcnnt start")))
 :ne "C-n" #'evil-next-visual-line
 :ne "C-p" #'evil-previous-visual-line
 :i "C-a" #'move-beginning-of-line
 :i "C-e" #'end-of-line
 :nm "C-h" #'evil-window-left
 :nm "C-l" #'evil-window-right
 :nm "C-j" #'evil-window-down
 :nm "C-k" #'evil-window-up
 :nm "L" #'centaur-tabs-forward
 :nm "H" #'centaur-tabs-backward
 :map Info-mode-map
 :ne "k" #'Info-next-preorder
 :ne "j"
 #'Info-last-preorder)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(define-key key-translation-map (kbd "<escape>") (kbd "C-g"))
;; (global-set-key (kbd "s-<escape>") (cmd! (shell-command "qdbus org.kde.ActivityManager /ActivityManager/Activities SetCurrentActivity 24552918-fa9b-44e9-b837-13bf57f0be40" nil nil)))
;; (global-set-key (kbd "s-w") (cmd! (shell-command "qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut Overview" nil nil)))
;; (global-set-key (kbd "s-x") (cmd! (shell-command "qdbus org.kde.kglobalaccel /component/kwin org.kde.kglobalaccel.Component.invokeShortcut ShowDesktopGrid" nil nil)))
(define-key key-translation-map (kbd "C-p") (kbd "<up>"))
(define-key key-translation-map (kbd "C-n") (kbd "<down>"))
(define-key key-translation-map (kbd "M-p") (kbd "<right>"))
(define-key key-translation-map (kbd "M-n") (kbd "<left>"))

(use-package! evil
  :custom
  (evil-disable-insert-state-bindings t))

(use-package! centaur-tabs
  :demand t
  :init (setq centaur-tabs-enable-key-bindings t)
  :hook ((projectile . centaur-tabs-group-by-projectile-project))
  :custom
  (centaur-tabs-set-icons t)
  (centaur-tabs-set-bar 'under)
  (x-underline-at-descent-line t)
  (centaur-tabs-style "slant")
  (centaur-tabs-cycle-scope 'tabs)
  (centaur-tabs-set-modified-marker t)
  (centaur-tabs-show-count nil)
  (centaur-tabs-left-edge-margin "")
  (centaur-tabs-height 32)
  :bind
  ("M-o" . centaur-tabs-forward)
  ("M-O" . centaur-tabs-backward)
  ("s-M-o" . centaur-tabs-move-current-tab-to-right)
  ("s-M-O" . centaur-tabs-move-current-tab-to-left)
  :config
  (add-to-list 'centaur-tabs-excluded-prefixes "*Async-native")
  (add-to-list 'centaur-tabs-excluded-prefixes "*Async-native")
  (add-to-list 'centaur-tabs-excluded-prefixes "*ts-ls")
  (centaur-tabs-mode t)
  (centaur-tabs-headline-match)
  (centaur-tabs-change-fonts "arial" 140)
  (defun centaur-tabs-buffer-groups ()
  (list
   (cond
    ((or (string-equal "*" (substring (buffer-name) 0 1))
     (memq major-mode '(magit-process-mode
                magit-status-mode
                magit-diff-mode
                magit-log-mode
                magit-file-mode
                magit-blob-mode
                magit-blame-mode))) "Emacs")
    ((derived-mode-p 'prog-mode) "Editing")
    ((memq major-mode
          '(org-mode
            org-agenda-clockreport-mode
            org-src-mode
            org-agenda-mode
            org-beamer-mode
            org-indent-mode
            org-bullets-mode
            org-cdlatex-mode
            org-agenda-log-mode
            diary-mode)) "Editing")
     (t (centaur-tabs-get-group-name (current-buffer))))))
  )

(use-package! dired
  :defer t
  :hook '((dired-mode . dired-hide-details-mode))
  :custom
  (dired-open-extensions '(("pdf" . "okular")
                           ("doc" . "libreoffice")
                           ("odt" . "libreoffice")
                           ("docx" . "libreoffice")
                           ("ppt" . "libreoffice")
                           ("pptx" . "libreoffice")
                           ("xls" . "libreoffice")
                           ("xlsx" . "libreoffice")
                           ("jpg" . "gwenview")
                           ("png" . "gwenview")
                           ("cbr" . "YACReader")
                           ("cbz" . "YACReader")
                           ("mkv" . "smplayer")
                           ("mp4" . "smplayer")
                           ("webm" . "smplayer")))
  ;; (:also-load dired-x dired-open dired-avfs dired-hacks-utils dired-filter dired-narrow dired-collapse dired-ranger dired-images)
  ;;TODO configure `dired-open-extensions-elisp' for opening lectures with VLC (the filename, including its path, is passed as the only argument.)
  :config

  (setq! global-mode-string (append global-mode-string '("" dired-rsync-modeline-status)))
  (defun dired-open-mimeopen_gui ()
    "Try to run `xdg-open' to open the file under point."
    (interactive)
    (if (executable-find "mimeopen-gui")
        (let ((file (ignore-errors (dired-get-file-for-visit))))
          (start-process "dired-open" nil
                         "mimeopen-gui" (file-truename file))) nil))
  (map!
   :map dired-mode-map
   :ne "<mouse-1>"  #'dire-open-file
   :ne "e" (cmd! (find-alternate-file ".."))
   :ne "." #'dired-hide-dotfiles-mode
   (:leader :ne "f x" #'dired-open-mimeopen_gui))
  (require 'dired-x)
  (require 'dired-open)
  (require 'dired-avfs)
  (require 'dired-hacks-utils)
  (require 'dired-filter)
  (require 'dired-narrow)
  (require 'dired-collapse)
  (require 'dired-ranger)
  (require 'dired-images)
  (dired-async-mode 1)
  (setq dired-open-functions '(dired-open-guess-shell-alist )))

(use-package! peep-dired
  :defer t
  :bind
  (("s-p" . peep-dired)
   ("C-<right>" . peep-dired-next-file)
   ("C-<left>" . peep-dired-prev-file)))

(use-package! recentf
  :defer t
  :custom
  (recentf-max-menu-items 5)
  (recentf-max-saved-items 5))

(use-package! ibuffer
  :defer t
  :custom
  (ibuffer-saved-filter-groups
    '(("home"
      ("Configuration" (or (filename . ".emacs.d")
                           (filename . "emacs-config")))
      ("Org" (or (mode . org-mode)
                 (filename . "OrgMode")))
      ("Code" (or  (derived-mode . prog-mode)
                   (mode . ess-mode)
                   (mode . compilation-mode)))
      ("Text" (and (derived-mode . text-mode)
                   (not  (starred-name))))
      ("TeX"  (or (derived-mode . tex-mode)
                  (mode . latex-mode)
                  (mode . context-mode)
                  (mode . ams-tex-mode)
                  (mode . bibtex-mode)))
      ("Help" (or (name . "\*Help\*")
                  (name . "\*Apropos\*")
                  (name . "\*info\*"))))))
  (ibuffer-show-empty-filter-groups nil)
  (ibuffer-display-summary nil)
  (ibuffer-use-header-line nil)
  (ibuffer-formats
   '(("  "  mark " "(name 24 24 :left :elide) "  " modified)
    (mark " " (name 16 -1) " " filename))))

(use-package! org-superstar
  :defer t
  :hook
  '((org-mode . (lambda () (org-superstar-mode 1))))
  :config)

(use-package! org-roam
  :defer t
  :init
  (setq org-roam-v2-ack t)
  :custom
  (org-roam-directory "~/Documents/RoamNotes/")
  (org-id-locations-file "~/Documents/RoamNotes/.orgids")
  (org-roam-db-location "~/Emacs/Doom/.emacs.d/.local/org-roam.db")
  :bind
  (("C-c n f" . org-roam-node-find)
   ("C-c n l" . org-roam-buffer-toggle)
   ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-setup))

(use-package! org-agenda
  :defer t
  :custom
  (org-agenda-start-on-weekday 6)
  (org-agenda-files '("$HOME/Agenda/College.org"))
  (org-log-done 'time))

(defun set-bidi-env ()
  (interactive)
  (setq bidi-paragraph-direction 'nil))
(defun set-bidi-right()
  (interactive)
  (setq bidi-paragraph-direction 'right-to-left))
(defun set-bidi-left()
  (interactive)
  (setq bidi-paragraph-direction 'left-to-right))
(defun zz/org-reformat-buffer ()
  (interactive)
  (when (y-or-n-p "Really format current buffer? ")
    (let ((document (org-element-interpret-data (org-element-parse-buffer))))
      (erase-buffer)
      (insert document)
      (goto-char (point-min)))))

(use-package! org
  :mode ("\\.org\\'" . org-mode)
  :hook ((org-mode . visual-line-mode)
         (org-mode . org-indent-mode)
         (org-mode . show-smartparens-mode)
         ;; (org-mode . org-auto-tangle-mode)
         (org-mode . variable-pitch-mode))
  :custom
  (org-directory "~/Documents/org/")
  (org-hide-emphasis-markers t)
  (bidi-paragraph-direction nil)
  (org-support-shift-select t)
  (org-auto-tangle-default t)
  :config
  (set-bidi-env)
  (map! :map org-mode-map
        :niem "C-s-p" #'org-shiftup
        :niem "C-s-n" #'org-shiftdown)
  (defface org-level-1 '((t :inherit outline-1 :height 1.75 :family "Vazir" :weight bold))
    "Face used for level 1 headlines."
    :group 'org-faces)
  (defface org-level-2 '((t :inherit outline-2 :height 1.5))
    "Face used for level 2 headlines."
    :group 'org-faces)
  (defface org-level-3 '((t :inherit outline-3 :height 1.25))
    "Face used for level 3 headlines."
    :group 'org-faces)
  (defface org-level-4 '((t :inherit outline-4 :height 1.1))
    "Face used for level 4 headlines."
    :group 'org-faces)
  (set-face-attribute
   'org-level-1 nil
   :height 1.3)
  (set-face-attribute
   'org-level-2 nil
   :height 1.2)
  (set-face-attribute
   'org-level-3 nil
   :height 1.1)

  (deftheme org)
  (custom-theme-set-faces
   'org
   '(variable-pitch ((t (:family "JetBrainsMono Nerd Font Mono" :height 180 :weight regular))))
   '(fixed-pitch ((t ( :family "JetBrainsMono Nerd Font Mono" :height 160)))))
  (custom-theme-set-faces
   'org
   '(org-block ((t (:inherit fixed-pitch :height 0.9))))
   '(org-code ((t (:inherit (shadow fixed-pitch)))))
   '(org-document-info ((t (:foreground "dark orange"))))
   '(org-document-info-keyword ((t (:inherit (shadow fixed-pitch)))))
   '(org-indent ((t (:inherit (org-hide fixed-pitch)))))
   '(org-link ((t (:foreground "royal blue" :underline t))))
   '(org-meta-line ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-property-value ((t (:inherit fixed-pitch))) t)
   '(org-special-keyword ((t (:inherit (font-lock-comment-face fixed-pitch)))))
   '(org-table ((t (:inherit fixed-pitch :foreground "#83a598"))))
   '(org-tag ((t (:inherit (shadow fixed-pitch) :weight bold :height 0.8))))
   '(org-verbatim ((t (:inherit (shadow fixed-pitch))))))
  (add-hook 'org-mode-hook (lambda () (eldoc-mode -1)))
  (defun ts-no-hook-mode ()
    (let ((typescript-ts-mode-hook nil))
      (message typescript-ts-mode-hook)
      (typescript-ts-mode)))
  (require 'ob-typescript)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((typescript . t)))
  (define-derived-mode org-ts-mode ts-no-hook-mode "org-ts")
  (add-to-list 'org-src-lang-modes (cons "tsc" 'org-ts)))

(use-package! flycheck
  :config
  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(json-jsonlist)))
  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers (append flycheck-disabled-checkers '(javascript-jshint))))

(use-package! cus-edit
  :custom
  (custom-file null-device "Don't store customizations"))

(use-package! orderless
  :custom
  (completion-styles '(orderless flex partial-completion basic))
  ;; (completion-category-defaults nil)
  ;; (completion-category-overrides nil)
  :config
  ;; (push '(eglot (styles . (orderless flex))) completion-category-overrides ))
;; (load (substitute-in-file-name "$ELSHOME/elisp/emacs-ludicrous-speed.el")
  )

(use-package! vertico
  :defer 1
  :custom
  ;; (vertico-count 13)                    ; Number of candidates to display
  (vertico-resize t)
  (vertico-cycle nil) ; Go from last to first candidate and first to last (cycle)?
  :config
  (map! :map vertico-map
        :i "<tab>" #'vertico-insert    ; Choose selected candidate
        :inm "<escape>" #'minibuffer-keyboard-quit ; Close minibuffer
        ;; NOTE 2022-02-05: Cycle through candidate groups
        :inm "C-M-n" #'vertico-next-group
        :inm "C-M-p" #'vertico-previous-group)
  (vertico-mode))

(use-package! vertico-directory
  :after vertico
  ;; More convenient directory navigation commands
  :bind (:map vertico-map
              ("RET" . vertico-directory-enter)
              ("DEL" . vertico-directory-delete-char)
              ("M-DEL" . vertico-directory-delete-word))
  ;; Tidy shadowed file names
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy))
(use-package! vertico-indexed
  :after vertico)
(use-package! vertico-directory
  :after vertico)
(use-package! vertico-buffer
  :after vertico)
(use-package! vertico-grid
  :after vertico)
;; (use-package! vertico-posframe
;;   :after vertico
;;   :config
;;   (vertico-posframe-mode 1))

(use-package! zoom
  :hook (doom-first-input . zoom-mode)
  :config
  (setq zoom-size '(0.7 . 0.7)
        zoom-ignored-major-modes '(dired-mode vterm-mode help-mode helpful-mode rxt-help-mode help-mode-menu org-mode)
        zoom-ignored-buffer-names '("*doom:scratch*" "*info*" "*helpful variable: argv*")
        zoom-ignored-buffer-name-regexps '("^\\*calc" "\\*helpful variable: .*\\*" "\\*helpful")
        zoom-ignore-predicates (list (lambda () (> (count-lines (point-min) (point-max)) 20)))))

(use-package! company
  :custom
  (company-minimum-prefix-length 1)
  :hook ((after-init . global-company-mode)))

(use-package! company-quickhelp
  :hook ((company-mode . company-quickhelp-mode)))

(use-package! company-box
  :hook (company-mode . company-box-mode)
  :custom
  (company-box-icons-unknown 'fa_question_circle)
  (company-box-icons-elisp
   '((fa_tag :face font-lock-function-name-face) ;; Function
     (fa_cog :face font-lock-variable-name-face) ;; Variable
     (fa_cube :face font-lock-constant-face) ;; Feature
     (md_color_lens :face font-lock-doc-face)))
  (company-box-icons-yasnippet 'fa_bookmark)
  (company-box-icons-lsp
   '((1 . fa_text_height) ;; Text
     (2 . (fa_tags :face font-lock-function-name-face)) ;; Method
     (3 . (fa_tag :face font-lock-function-name-face)) ;; Function
     (4 . (fa_tag :face font-lock-function-name-face)) ;; Constructor
     (5 . (fa_cog :foreground "#FF9800")) ;; Field
     (6 . (fa_cog :foreground "#FF9800")) ;; Variable
     (7 . (fa_cube :foreground "#7C4DFF")) ;; Class
     (8 . (fa_cube :foreground "#7C4DFF")) ;; Interface
     (9 . (fa_cube :foreground "#7C4DFF")) ;; Module
     (10 . (fa_cog :foreground "#FF9800")) ;; Property
     (11 . md_settings_system_daydream) ;; Unit
     (12 . (fa_cog :foreground "#FF9800")) ;; Value
     (13 . (md_storage :face font-lock-type-face)) ;; Enum
     (14 . (md_closed_caption :foreground "#009688")) ;; Keyword
     (15 . md_closed_caption) ;; Snippet
     (16 . (md_color_lens :face font-lock-doc-face)) ;; Color
     (17 . fa_file_text_o) ;; File
     (18 . md_refresh) ;; Reference
     (19 . fa_folder_open) ;; Folder
     (20 . (md_closed_caption :foreground "#009688")) ;; EnumMember
     (21 . (fa_square :face font-lock-constant-face)) ;; Constant
     (22 . (fa_cube :face font-lock-type-face)) ;; Struct
     (23 . fa_calendar) ;; Event
     (24 . fa_square_o) ;; Operator
     (25 . fa_arrows)) ;; TypeParameter
   )) ;; Face)

;; (define-derived-mode vue-mode web-mode "Vue"
;;   "A major mode derived from web-mode, for editing .vue files with LSP support.")
;; (add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . vue-ts-mode))
;; (add-hook 'vue-ts-mode-hook #'eglot-ensure)
;; (add-to-list 'eglot-server-programs '(vue-ts-mode "~/.local/share/pnpm/vue-language-server" "--node-ipc"))
(use-package! lsp-tailwindcss
  :init
  (setq lsp-tailwindcss-add-on-mode t)
  (setq lsp-tailwindcss-skip-config-check t)
  :config
  (setq lsp-tailwindcss-skip-config-check t)
  (setq lsp-tailwindcss-major-modes '("vue-ts-mode" "prog-mode" "html-mode"
                                      "html-ts-mode")))

(map!
 (:leader :desc "Initialize or toggle treemacs" :nver "e" #'+treemacs/toggle))
(use-package! treemacs
  :init
  :custom
  (treemacs-text-scale 0.1)
  (treemacs--icon-size 17)
  (treemacs-show-cursor t)
  :config
  (treemacs-load-theme "doom-colors"))

(use-package! treemacs-projectile
  :after (treemacs projectile))

(use-package! treemacs-icons-dired
  :hook (dired-mode . treemacs-icons-dired-enable-once))
(use-package! treemacs-magit
  :after (treemacs magit))

(use-package! treemacs-all-the-icons)

(use-package! treesit
  :defer 5
  :custom
  (treesit-font-lock-level 4))

(use-package! treesit-auto
  :hook (on-first-input . global-treesit-auto-mode)
  :custom (treesit-auto-install 'prompt)
  :config
  (add-to-list 'treesit-language-source-alist `(typescript . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "typescript/src" nil nil)))
  (add-to-list 'treesit-language-source-alist `(tsx . ("https://github.com/tree-sitter/tree-sitter-typescript" nil "tsx/src" nil nil)))
  (add-to-list 'treesit-language-source-alist `(elixir . ("https://github.com/elixir-lang/tree-sitter-elixir" nil nil nil nil)))
  (add-to-list 'treesit-language-source-alist `(heex-ts-mode . ("https://github.com/phoenixframework/tree-sitter-heex" nil nil nil nil)))
  (add-to-list 'treesit-language-source-alist `(bash . ("https://github.com/tree-sitter/tree-sitter-bash" nil nil nil nil)))
  (add-to-list 'treesit-language-source-alist `(vue . ("https://github.com/ikatyang/tree-sitter-vue" nil nil nil nil)))
  (add-to-list 'treesit-language-source-alist `(css . ("https://github.com/tree-sitter/tree-sitter-css" nil nil nil nil)))
  (add-to-list 'treesit-language-source-alist `(scss . ("https://github.com/serenadeai/tree-sitter-scss" nil nil nil nil))))

(set-face-foreground 'font-lock-variable-name-face "violet")
(set-face-foreground 'font-lock-property-name-face "dark orange")
(set-face-foreground 'font-lock-operator-face "dodger blue")
(set-face-foreground 'font-lock-punctuation-face "deep sky blue")
;; (use-package! combobulate
;;   :hook ((python-ts-mode . combobulate-mode)
;;          (js-ts-mode . combobulate-mode)
;;          (css-ts-mode . combobulate-mode)
;;          (yaml-ts-mode . combobulate-mode)
;;          (typescript-ts-mode . combobulate-mode)
;;          (tsx-ts-mode . combobulate-mode)))

(use-package! tide
  :after (company flycheck)
  :hook ((typescript-ts-mode . tide-setup)
         (tsx-ts-mode . tide-setup)
         (typescript-ts-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))

(use-package! rainbow-delimiters
  :hook ((typescript-ts-mode . rainbow-delimiters-mode)))

(use-package! apheleia
  :config
  (setf (alist-get 'vue-ts-mode apheleia-mode-alist)
      '(prettier))
  )

(setq sly-lisp-implementations
      '((qlot ("qlot" "exec" "sbcl") :coding-system utf-8-unix)
        (sbcl ("sbcl") :coding-system utf-8-unix)))
(setq slime-lisp-implementations
      '((sbcl ("sbcl") :coding-system utf-8-unix)
        (qlot ("/home/rylan/.qlot/bin/qlot" "exec" "sbcl") :coding-system utf-8-unix)))

(defun gerbil-setup-buffers ()
    "Change current buffer mode to gerbil-mode and start a REPL"
    (interactive)
    (gerbil-mode)
    (split-window-right)
    (shrink-window-horizontally 2)
    (let ((buf (buffer-name)))
      (other-window 1)
      (run-scheme "gxi")
      (switch-to-buffer-other-window "*scheme*" nil)
      (switch-to-buffer buf)))

  (global-set-key (kbd "C-c C-g") 'gerbil-setup-buffers)
