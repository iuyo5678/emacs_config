;; -*- face-settings.el -*-  set face for emacs  -*- lexical-binding: t -*-

;; Time-stamp: <2021-03-15 18:05:25 Monday by zhangguhua>
;;外观的配置

(use-package cal-china-x
  :ensure t
  :commands cal-china-x-setup
  :init (cal-china-x-setup)
  :config
  ;; `S' can show the time of sunrise and sunset on Calendar
  (setq calendar-location-name "Beijing"
        calendar-latitude 39.90
        calendar-longitude 116.40)
  (setq cal-china-x-force-chinese-week-day t)
  (setq cal-china-x-always-show-jieqi t)
  ;; Holidays
  (setq calendar-mark-holidays-flag t)
  (setq cal-china-x-important-holidays cal-china-x-chinese-holidays)
  (setq cal-china-x-general-holidays
        '((holiday-lunar 1 15 "元宵节")
          (holiday-lunar 7 7 "七夕节")
          (holiday-fixed 3 8 "妇女节")
          (holiday-fixed 3 12 "植树节")
          (holiday-fixed 5 4 "青年节")
          (holiday-fixed 6 1 "儿童节")
          (holiday-fixed 9 10 "教师节")))
  (setq holiday-other-holidays
        '((holiday-fixed 2 14 "情人节")
          (holiday-fixed 4 1 "愚人节")
          (holiday-fixed 12 25 "圣诞节")
          (holiday-float 5 0 2 "母亲节")
          (holiday-float 6 0 3 "父亲节")
          (holiday-fixed 10 24 "程序员节")
          (holiday-float 11 4 4 "感恩节")))
  (setq calendar-holidays
        (append cal-china-x-important-holidays
                cal-china-x-general-holidays
                holiday-other-holidays)))


(use-package ahei-face
  :load-path my-emacs-my-lisps-path
  :demand t
  :init
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  :config
  ;;Suppress GUI features
  (setq use-file-dialog nil
	    use-dialog-box nil
	    inhibit-startup-screen t
	    inhibit-startup-echo-area-message t)

  ;; Display dividers between windows
  (setq window-divider-default-places t
        window-divider-default-bottom-width 1
        window-divider-default-right-width 1)
  (add-hook 'window-setup-hook #'window-divider-mode)
  (defun apply-args-list-to-fun (fun-list args-list)
    "Apply args list to function FUN-LIST.
FUN-LIST can be a symbol, also can be a list whose element is a symbol."
    (let ((is-list (and (listp fun-list) (not (functionp fun-list)))))
      (dolist (args args-list)
	    (if is-list
	        (dolist (fun fun-list)
	          (apply-args-to-fun fun args))
          (apply-args-to-fun fun-list args)))))
  (apply-args-list-to-fun
   'defvar
   `((beautiful-blue-face 'beautiful-blue-face)
     (darkgreen-face      'darkgreen-face)
     (darkred-face        'darkred-face)
     (darkyellow-face     'darkyellow-face)
     (darkmagenta-face    'darkmagenta-face)
     (darkcyan-face       'darkcyan-face)
     (yellow-face         'yellow-face)
     (green-face          'green-face)
     (cyan-face           'cyan-face)))
  )

(use-package unicode-fonts
  :init (unicode-fonts-setup)
  :config
  (set-frame-font "JetBrainsMono Nerd Font")  ;;默认字体
  (face-spec-set 'default `((t (:height , 150)))) ;;默认大小
  )

(use-package nerd-icons
  :demand t
  )

(use-package hide-mode-line
  :hook (((completion-list-mode
           completion-in-region-mode
           pdf-annot-list-mode
           flycheck-error-list-mode) . hide-mode-line-mode)))


;; Show native line numbers if possible, otherwise use `linum'
(if (fboundp 'display-line-numbers-mode)
    (use-package display-line-numbers
      :ensure nil
      :hook (prog-mode . display-line-numbers-mode))
  (use-package linum-off
    :defines linum-format
    :hook (after-init . global-display-line-numbers-mode)
    :init (setq linum-format "%4d ")
    :config
    ;; Highlight current line number
    (use-package hlinum
      :defines linum-highlight-in-all-buffersp
      :custom-face (linum-highlight-face ((t (:inherit default))))
      :hook (global-display-line-numbers-mode . hlinum-activate)
      :init (setq linum-highlight-in-all-buffersp t))))

(defcustom centaur-prettify-org-symbols-alist
  '(("[ ]" . ?☐)
    ("[X]" . ?☑)
    ("[-]" . ?⛝)

    ("#+ARCHIVE:" . ?📦)
    ("#+AUTHOR:" . ?👤)
    ("#+CREATOR:" . ?💁)
    ("#+DATE:" . ?📆)
    ("#+DESCRIPTION:" . ?⸙)
    ("#+EMAIL:" . ?📧)
    ("#+OPTIONS:" . ?⛭)
    ("#+SETUPFILE:" . ?⛮)
    ("#+TAGS:" . ?🏷)
    ("#+TITLE:" . ?📓)

    ("#+begin_src" . ?✎)
    ("#+end_src" . ?⌀)
    ("#+begin_quote" . ?»)
    ("#+end_quote" . ?«)
    ("#+HEADERS" . ?☰)
    ("#+RESULTS:" . ?💻))
  "Alist of symbol prettifications for `org-mode'."
  :group 'centaur
  :type '(alist :key-type string :value-type (choice character sexp)))

;; Easily adjust the font size in all frames
(use-package default-text-scale
  :hook (after-init . default-text-scale-mode)
  :bind (:map default-text-scale-mode-map
         ("s-=" . default-text-scale-increase)
         ("s--" . default-text-scale-decrease)
         ("s-0" . default-text-scale-reset)
         ("C-s-=" . default-text-scale-increase)
         ("C-s--" . default-text-scale-decrease)
         ("C-s-0" . default-text-scale-reset)))

;; Use fixed pitch where it's sensible
(use-package mixed-pitch
  :diminish)

(defcustom centaur-prettify-symbols-alist
  '(("lambda" . ?λ)
    ("<-" . ?←)
    ("->" . ?→)
    ("->>" . ?↠)
    ("=>" . ?⇒)
    ("map" . ?↦)
    ("/=" . ?≠)
    ("!=" . ?≠)
    ("==" . ?≡)
    ("<=" . ?≤)
    (">=" . ?≥)
    ("=<<" . (?= (Br . Bl) ?≪))
    (">>=" . (?≫ (Br . Bl) ?=))
    ("<=<" . ?↢)
    (">=>" . ?↣)
    ("&&" . ?∧)
    ("||" . ?∨)
    ("not" . ?¬))
  "Alist of symbol prettifications.
Nil to use font supports ligatures."
  :group 'centaur
  :type '(alist :key-type string :value-type (choice character sexp)))

;; When `centaur-prettify-symbols-alist' is `nil' use font supported ligatures
(use-package composite
  :ensure nil
  :unless centaur-prettify-symbols-alist
  :init (defvar composition-ligature-table (make-char-table nil))
  :hook (((prog-mode conf-mode nxml-mode markdown-mode help-mode)
          . (lambda () (setq-local composition-function-table composition-ligature-table))))
  :config
  ;; support ligatures, some toned down to prevent hang
  (when (>= emacs-major-version 27)
    (let ((alist
           '((33 . ".\\(?:\\(==\\|[!=]\\)[!=]?\\)")
             (35 . ".\\(?:\\(###?\\|_(\\|[(:=?[_{]\\)[#(:=?[_{]?\\)")
             (36 . ".\\(?:\\(>\\)>?\\)")
             (37 . ".\\(?:\\(%\\)%?\\)")
             (38 . ".\\(?:\\(&\\)&?\\)")
             (42 . ".\\(?:\\(\\*\\*\\|[*>]\\)[*>]?\\)")
             ;; (42 . ".\\(?:\\(\\*\\*\\|[*/>]\\).?\\)")
             (43 . ".\\(?:\\([>]\\)>?\\)")
             ;; (43 . ".\\(?:\\(\\+\\+\\|[+>]\\).?\\)")
             (45 . ".\\(?:\\(-[->]\\|<<\\|>>\\|[-<>|~]\\)[-<>|~]?\\)")
             ;; (46 . ".\\(?:\\(\\.[.<]\\|[-.=]\\)[-.<=]?\\)")
             (46 . ".\\(?:\\(\\.<\\|[-=]\\)[-<=]?\\)")
             (47 . ".\\(?:\\(//\\|==\\|[=>]\\)[/=>]?\\)")
             ;; (47 . ".\\(?:\\(//\\|==\\|[*/=>]\\).?\\)")
             (48 . ".\\(?:x[a-zA-Z]\\)")
             (58 . ".\\(?:\\(::\\|[:<=>]\\)[:<=>]?\\)")
             (59 . ".\\(?:\\(;\\);?\\)")
             (60 . ".\\(?:\\(!--\\|\\$>\\|\\*>\\|\\+>\\|-[-<>|]\\|/>\\|<[-<=]\\|=[<>|]\\|==>?\\||>\\||||?\\|~[>~]\\|[$*+/:<=>|~-]\\)[$*+/:<=>|~-]?\\)")
             (61 . ".\\(?:\\(!=\\|/=\\|:=\\|<<\\|=[=>]\\|>>\\|[=>]\\)[=<>]?\\)")
             (62 . ".\\(?:\\(->\\|=>\\|>[-=>]\\|[-:=>]\\)[-:=>]?\\)")
             (63 . ".\\(?:\\([.:=?]\\)[.:=?]?\\)")
             (91 . ".\\(?:\\(|\\)[]|]?\\)")
             ;; (92 . ".\\(?:\\([\\n]\\)[\\]?\\)")
             (94 . ".\\(?:\\(=\\)=?\\)")
             (95 . ".\\(?:\\(|_\\|[_]\\)_?\\)")
             (119 . ".\\(?:\\(ww\\)w?\\)")
             (123 . ".\\(?:\\(|\\)[|}]?\\)")
             (124 . ".\\(?:\\(->\\|=>\\||[-=>]\\||||*>\\|[]=>|}-]\\).?\\)")
             (126 . ".\\(?:\\(~>\\|[-=>@~]\\)[-=>@~]?\\)"))))
      (dolist (char-regexp alist)
        (set-char-table-range composition-ligature-table (car char-regexp)
                              `([,(cdr char-regexp) 0 font-shape-gstring]))))
    (set-char-table-parent composition-ligature-table composition-function-table)))


(use-package solaire-mode
  :defer 0.1
  :config (solaire-global-mode 1))

(use-package doom-themes
  :ensure t
  :init
  ;; Enable flashing mode-line on errors
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-Iosvkem t t)
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme
  (doom-themes-neotree-config)
  )


(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-icon zgh-icon
        ;;doom-modeline-height 1
        find-file-visit-truename t
        doom-modeline-window-width-limit 110
        doom-modeline-project-detection 'project
        doom-modeline-minor-modes t)
  (unless after-init-time
    (setq-default doom-modeline-mode-map nil))
  :bind (:map doom-modeline-mode-map
         ("C-<f6>" . doom-modeline-hydra/body))
  :pretty-hydra
  ((:title (pretty-hydra-title "Mode Line" 'sucicon "nf-custom-emacs" :face 'nerd-icons-purple)
    :color amaranth :quit-key ("q" "C-g"))
   ("Icon"
    (("i" (setq doom-modeline-icon (not doom-modeline-icon))
      "display icons" :toggle doom-modeline-icon)
     ("u" (setq doom-modeline-unicode-fallback (not doom-modeline-unicode-fallback))
      "unicode fallback" :toggle doom-modeline-unicode-fallback)
     ("m" (setq doom-modeline-major-mode-icon (not doom-modeline-major-mode-icon))
      "major mode" :toggle doom-modeline-major-mode-icon)
     ("c" (setq doom-modeline-major-mode-color-icon (not doom-modeline-major-mode-color-icon))
      "colorful major mode" :toggle doom-modeline-major-mode-color-icon)
     ("s" (setq doom-modeline-buffer-state-icon (not doom-modeline-buffer-state-icon))
      "buffer state" :toggle doom-modeline-buffer-state-icon)
     ("o" (setq doom-modeline-buffer-modification-icon (not doom-modeline-buffer-modification-icon))
      "modification" :toggle doom-modeline-buffer-modification-icon)
     ("v" (setq doom-modeline-modal-icon (not doom-modeline-modal-icon))
      "modal" :toggle doom-modeline-modal-icon))
    "Segment"
    (("M" (setq doom-modeline-minor-modes (not doom-modeline-minor-modes))
      "minor modes" :toggle doom-modeline-minor-modes)
     ("W" (setq doom-modeline-enable-word-count (not doom-modeline-enable-word-count))
      "word count" :toggle doom-modeline-enable-word-count)
     ("E" (setq doom-modeline-buffer-encoding (not doom-modeline-buffer-encoding))
      "encoding" :toggle doom-modeline-buffer-encoding)
     ("I" (setq doom-modeline-indent-info (not doom-modeline-indent-info))
      "indent" :toggle doom-modeline-indent-info)
     ("L" (setq doom-modeline-lsp (not doom-modeline-lsp))
      "lsp" :toggle doom-modeline-lsp)
     ("P" (setq doom-modeline-persp-name (not doom-modeline-persp-name))
      "perspective" :toggle doom-modeline-persp-name)
     ("G" (setq doom-modeline-github (not doom-modeline-github))
      "github" :toggle doom-modeline-github)
     ("N" (setq doom-modeline-gnus (not doom-modeline-gnus))
      "gnus" :toggle doom-modeline-gnus)
     ("U" (setq doom-modeline-mu4e (not doom-modeline-mu4e))
      "mu4e" :toggle doom-modeline-mu4e)
     ("R" (setq doom-modeline-irc (not doom-modeline-irc))
      "irc" :toggle doom-modeline-irc)
     ("F" (setq doom-modeline-irc-buffers (not doom-modeline-irc-buffers))
      "irc buffers" :toggle doom-modeline-irc-buffers)
     ("S" (progn
            (setq doom-modeline-checker-simple-format (not doom-modeline-checker-simple-format))
            (and (bound-and-true-p flycheck-mode) (flycheck-buffer)))
      "simple checker" :toggle doom-modeline-checker-simple-format)
     ("V" (setq doom-modeline-env-version (not doom-modeline-env-version))
      "version" :toggle doom-modeline-env-version))
    "Style"
    (("a" (setq doom-modeline-buffer-file-name-style 'auto)
      "auto"
      :toggle (eq doom-modeline-buffer-file-name-style 'auto))
     ("b" (setq doom-modeline-buffer-file-name-style 'buffer-name)
      "buffer name"
      :toggle (eq doom-modeline-buffer-file-name-style 'buffer-name))
     ("f" (setq doom-modeline-buffer-file-name-style 'file-name)
      "file name"
      :toggle (eq doom-modeline-buffer-file-name-style 'file-name))
     ("t u" (setq doom-modeline-buffer-file-name-style 'truncate-upto-project)
      "truncate upto project"
      :toggle (eq doom-modeline-buffer-file-name-style 'truncate-upto-project))
     ("t f" (setq doom-modeline-buffer-file-name-style 'truncate-from-project)
      "truncate from project"
      :toggle (eq doom-modeline-buffer-file-name-style 'truncate-from-project))
     ("t w" (setq doom-modeline-buffer-file-name-style 'truncate-with-project)
      "truncate with project"
      :toggle (eq doom-modeline-buffer-file-name-style 'truncate-with-project))
     ("t e" (setq doom-modeline-buffer-file-name-style 'truncate-except-project)
      "truncate except project"
      :toggle (eq doom-modeline-buffer-file-name-style 'truncate-except-project))
     ("t r" (setq doom-modeline-buffer-file-name-style 'truncate-upto-root)
      "truncate upto root"
      :toggle (eq doom-modeline-buffer-file-name-style 'truncate-upto-root))
     ("t a" (setq doom-modeline-buffer-file-name-style 'truncate-all)
      "truncate all"
      :toggle (eq doom-modeline-buffer-file-name-style 'truncate-all))
     ("t n" (setq doom-modeline-buffer-file-name-style 'truncate-nil)
      "truncate none"
      :toggle (eq doom-modeline-buffer-file-name-style 'truncate-nil))
     ("r f" (setq doom-modeline-buffer-file-name-style 'relative-from-project)
      "relative from project"
      :toggle (eq doom-modeline-buffer-file-name-style 'relative-from-project))
     ("r t" (setq doom-modeline-buffer-file-name-style 'relative-to-project)
      "relative to project"
      :toggle (eq doom-modeline-buffer-file-name-style 'relative-to-project)))
    "Project Detection"
    (("p f" (setq doom-modeline-project-detection 'ffip)
      "ffip"
      :toggle (eq doom-modeline-project-detection 'ffip))
     ("p t" (setq doom-modeline-project-detection 'projectile)
      "projectile"
      :toggle (eq doom-modeline-project-detection 'projectile))
     ("p p" (setq doom-modeline-project-detection 'project)
      "project"
      :toggle (eq doom-modeline-project-detection 'project))
     ("p n" (setq doom-modeline-project-detection nil)
      "disable"
      :toggle (eq doom-modeline-project-detection nil)))
    "Misc"
    (
     ("e" (if (bound-and-true-p flycheck-mode)
              (flycheck-list-errors)
            (flymake-show-diagnostics-buffer))
      "list errors" :exit t)
     ("B" (if (bound-and-true-p grip-mode)
              (grip-browse-preview)
            (message "Not in preview"))
      "browse preview" :exit t)
     ("z h" (counsel-read-setq-expression 'doom-modeline-height) "set height")
     ("z w" (counsel-read-setq-expression 'doom-modeline-bar-width) "set bar width")
     ("z g" (counsel-read-setq-expression 'doom-modeline-github-interval) "set github interval")
     ("z n" (counsel-read-setq-expression 'doom-modeline-gnus-timer) "set gnus interval"))))
  )

(use-package dashboard
  :diminish (dashboard-mode)
  :functions (nerd-icons-faicon
              nerd-icons-mdicon
              winner-undo
              widget-forward)
  :custom-face
  (dashboard-heading ((t (:inherit (font-lock-string-face bold)))))
  (dashboard-items-face ((t (:weight normal))))
  (dashboard-no-items-face ((t (:weight normal))))
  :hook (dashboard-mode . (lambda () (setq-local frame-title-format "")))
  :init
  (setq
   dashboard-banner-logo-title "Hello DrakeZhang - Typing Programming & Life"
   dashboard-startup-banner (or zgh-logo 'official)
   dashboard-center-content t
   dashboard-path-max-length 60
   dashboard-show-shortcuts nil
   dashboard-items '((recents  . 8)
                     (bookmarks . 5)
                     (projects . 5))
   dashboard-icon-type 'nerd-icons
   dashboard-set-file-icons t
   dashboard-set-heading-icons t
   dashboard-heading-icons '((recents   . "nf-oct-history")
                             (bookmarks . "nf-oct-bookmark")
                             (agenda    . "nf-oct-calendar")
                             (projects  . "nf-oct-briefcase")
                             (registers . "nf-oct-database"))
   dashboard-set-init-info t

   dashboard-set-footer t
   dashboard-footer-icon (if
                             (icons-displayable-p)
                             (nerd-icons-octicon "nf-oct-heart" :height 1.2 :face 'nerd-icons-lred)
                           (propertize ">" 'face 'dashboard-footer-icon-face))
   dashboard-set-navigator t
   )

  (dashboard-setup-startup-hook)
  :config
  ;; WORKAROUND: fix differnct background color of the banner image.
  ;; @see https://github.com/emacs-dashboard/emacs-dashboard/issues/203
  (defun my-dashboard-insert-image-banner (banner)
    "Display an image BANNER."
    (when (file-exists-p banner)
      (let* ((title dashboard-banner-logo-title)
             (spec (create-image banner))
             (size (image-size spec))
             (width (car size))
             (left-margin (max 0 (floor (- dashboard-banner-length width) 2))))
        (goto-char (point-min))
        (insert "\n")
        (insert (make-string left-margin ?\ ))
        (insert-image spec)
        (insert "\n\n")
        (when title
          (dashboard-insert-center title)
          (insert (format "%s\n\n" (propertize title 'face 'dashboard-banner-logo-title)))))))
  (advice-add #'dashboard-insert-image-banner :override #'my-dashboard-insert-image-banner)

  ;; FIXME: Insert copyright
  ;; @see https://github.com/emacs-dashboard/emacs-dashboard/issues/219
  (defun my-dashboard-insert-copyright ()
    "Insert copyright in the footer."
    (when dashboard-set-footer
      (dashboard-insert-center
       (propertize (format "Package by Drake Zhang, Powered by Centaur Emacs  %s\n" (format-time-string "%Y"))
                   'face font-lock-comment-face))))
  (advice-add #'dashboard-insert-footer :after #'my-dashboard-insert-copyright)
  )

;;(require 'dashboard)
(provide 'face-settings)
