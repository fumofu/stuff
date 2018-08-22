  (require 'package)
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  (package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-quickhelp-color-background "#4F4F4F")
 '(company-quickhelp-color-foreground "#DCDCCC")
 '(custom-enabled-themes (quote (solarized-dark)))
 '(custom-safe-themes
   (quote
    ("15348febfa2266c4def59a08ef2846f6032c0797f001d7b9148f30ace0d08bcf" "c3d4af771cbe0501d5a865656802788a9a0ff9cf10a7df704ec8b8ef69017c68" "e11569fd7e31321a33358ee4b232c2d3cf05caccd90f896e1df6cab228191109" "a8245b7cc985a0610d71f9852e9f2767ad1b852c2bdea6f4aadc12cce9c4d6d0" "9a155066ec746201156bb39f7518c1828a73d67742e11271e4f24b7b178c4710" "599f1561d84229e02807c952919cd9b0fbaa97ace123851df84806b067666332" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "4f2ede02b3324c2f788f4e0bad77f7ebc1874eff7971d2a2c9b9724a50fb3f65" "43c1a8090ed19ab3c0b1490ce412f78f157d69a29828aa977dae941b994b4147" default)))
 '(display-battery-mode t)
 '(ede-project-directories
   (quote
    ("/home/gkwan/Dropbox/School/CISA/CISA1220 - R&S I")))
 '(hl-paren-background-colors (quote ("#2492db" "#95a5a6" nil)))
 '(org-agenda-files
   (quote
    ("~/Nextcloud/orgNotes/school.org" "~/Nextcloud/orgNotes/personal.org" "~/Nextcloud/orgNotes/church.org")))
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-docview org-gnus org-info org-irc org-mhe org-rmail org-w3m org-drill)))
 '(package-selected-packages
   (quote
    (minimap org-download auto-complete flatui-theme monokai-theme latex-extra evil-org w3 w32-browser solarized-theme heroku-theme tramp-theme leuven-theme org-bullets helm-spotify zenburn-theme helm org-evil evil)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(global-ede-mode t)

(require 'evil)
(evil-mode 1)
;<setq org-agenda-timegrid-useampm 1>
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)

;; -*- mode: elisp -*-

;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;;;Org mode configuration
;; Enable Org mode
(require 'org)
;; Make Org mode work with files ending in .org
;; (add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
;; The above is the default in recent emacsen

(require 'org-bullets)
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

(setq org-capture-templates
 '(("j" "journal" entry (file+datetree "~/Nextcloud/orgNotes/journal.org")
        "* %U %?\n %a")
   ("S" "Church: Sunday School" entry (file+headline "~/Nextcloud/orgNotes/church.org" "Sunday School")
    "* %?\n")
   ("a" "Church: Awana" entry (file+headline "~/Nextcloud/orgNotes/church.org" "Awana")
    "* %?\n")
   ("i" "Church: IT" entry (file+headline "~/Nextcloud/orgNotes/church.org" "IT")
    "* %?\n")
   ("p" "Personal: General" entry (file+headline "~/Nextcloud/orgNotes/personal.org" "General")
    "* %?\n")
   ("h" "School: Homework" entry (file+headline "~/Nextcloud/orgNotes/school.org" "Homework")
    "* %?\n")
   ("e" "School: Examination" entry (file+headline "~/Nextcloud/orgNotes/school.org" "Examination/quiz") "* %?\n")
   ("s" "School: General" entry (file+headline "~/Nextcloud/orgNotes/School.org" "General") "* %?\n")
   ))

(require 'helm-config)

(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

(helm-mode 1)


(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(add-to-list 'default-frame-alist
	     '(font . "DejaVu Sans Mono-13"))

(when (version<= "26.0.50" emacs-version )
  (global-display-line-numbers-mode))
