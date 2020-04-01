(setq inhibit-startup-message t)

(tool-bar-mode -1)

(menu-bar-mode -1)

(scroll-bar-mode -1)

(global-hl-line-mode -1)

(delete-selection-mode 1)

(setq backup-directory-alist '(("." . "~/.saves")))

(add-hook 'prog-mode-hook 'display-line-numbers-mode)

(show-paren-mode 1)

(setq bookmark-default-file "~/.emacs.d/init/bookmarks")

(setq bookmarks-save-flag 1)

;;Doom Theme
(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-one t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (setq doom-themes-treemacs-enable-variable-pitch nil)
  (doom-themes-treemacs-config)

  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

;;;; Doom modeline
(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1))

;;;; all the icons for the doom package
(use-package all-the-icons
  :ensure t
)

(setq ido-everywhere t)
(setq ido-enable-flex-matching t)
(ido-mode t)

;(use-package helm
;  :ensure t
;  :config (helm-mode 1))

(use-package which-key
   :ensure t
   :config (which-key-mode))

(use-package projectile
    :ensure t
    :config
(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
(projectile-mode +1))

(use-package helm-projectile
    :ensure t
    :config (helm-projectile-on))

(use-package dashboard
    :ensure t
    :init
    (progn
        (setq dashboard-items '((recents  . 5)
			(bookmarks . 5)
			(projects . 5)
			(agenda . 5)
			(registers . 5)))
        (setq dashboard-show-shortcuts nil)
        (setq dashboard-center-content nil)
	(setq dashboard-banner-logo-title "Programming is funny")
	(setq dashboard-set-heading-icons t)
	(setq dashboard-set-file-icons t)
	(setq dashboard-startup-banner "~/Documents/foto.png")
     (setq dashboard-set-navigator t)
     (setq dashboard-navigator-buttons
        `(;; line1
         ((,(all-the-icons-octicon "mark-github" :height 1.1 :v-adjust 0.0)
             "Fvasquezl"
             "Browse homepage"
             (lambda (&rest _) (browse-url "https://github.com/fvasquezl")))
             ("★" "Star" "Browse homepage" (lambda (&rest _) (browse-url "http://practice.test/")) warning))
             ;; line 2
         ((,(all-the-icons-faicon "linkedin" :height 1.1 :v-adjust 0.0)
             "Linkedin"
             ""
             (lambda (&rest _) (browse-url "homepage")))
         ("⚑" nil "Show flags" (lambda (&rest _) (message "flag")) error))))

   )
   :config
       (dashboard-setup-startup-hook))

(use-package treemacs
    :ensure t
    :defer t
    :init
    (with-eval-after-load 'winum
        (define-key winum-keymap (kbd "M-0") #'treemacs-select-window))
    :config
    (progn
        (setq treemacs-is-never-other-window t
	    treemacs-collapse-dirs (if treemacs-python-executable 3 0)
	    treemacs-display-in-side-window        t
            treemacs-eldoc-display                 t
	    treemacs-show-hidden-files             t
	    treemacs-space-between-root-nodes      t
            treemacs-tag-follow-cleanup            t
            treemacs-tag-follow-delay              1.5
	    treemacs-file-name-transformer         #'identity
            treemacs-user-mode-line-format         nil
	))
     (treemacs-resize-icons 44)
     (treemacs-follow-mode t)
     (treemacs-filewatch-mode t)
     (treemacs-fringe-indicator-mode t)
     :bind
     (:map global-map
         ("M-0"       . treemacs-select-window)
         ("C-x t 1"   . treemacs-delete-other-windows)
         ("C-x t t"   . treemacs)
         ("C-x t B"   . treemacs-bookmark)
         ("C-x t C-t" . treemacs-find-file)
         ("C-x t M-t" . treemacs-find-tag))
     )

(use-package treemacs-projectile
    :after treemacs projectile
    :ensure t)

(use-package treemacs-icons-dired
    :after treemacs dired
    :ensure t
    :config (treemacs-icons-dired-mode))

(use-package treemacs-persp
    :after treemacs persp-mode
    :ensure t
    :config (treemacs-set-scope-type 'Perspectives))
