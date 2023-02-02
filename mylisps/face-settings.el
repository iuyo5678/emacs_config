;; -*- Emacs-Lisp -*-

;; Time-stamp: <2021-03-15 18:05:25 Monday by zhangguhua>
;;外观的配置

(use-package cursor-chg
  :ensure nil
  :demand t
  :if (display-graphic-p)
  :config
  (change-cursor-mode 1)
  (toggle-cursor-type-when-idle 1))


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
          (holiday-float 11 4 4 "感恩节")))
  (setq calendar-holidays
        (append cal-china-x-important-holidays
                cal-china-x-general-holidays
                holiday-other-holidays)))


(use-package ahei-face
  :ensure nil
  :demand t
  :config
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (setq scroll-bar-mode nil)
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
  (set-frame-font "Monaco")  ;;默认字体
  (face-spec-set 'default `((t (:height , 170)))) ;;默认大小
  )

(use-package hide-mode-line
  :hook (((completion-list-mode
           completion-in-region-mode
           pdf-annot-list-mode
           flycheck-error-list-mode) . hide-mode-line-mode)))

;; Icons
;; NOTE: Must run `M-x all-the-icons-install-fonts', and install fonts manually on Windows
(use-package all-the-icons
  :if (display-graphic-p)
  :init  (unless (or sys/win32p
                      (daemonp)
                      (font-installed-p "all-the-icons"))
            (zgh-install-fonts))
  :config
  ;; Support more icons
    (let ((extension-icon-alist
           '(("bat"  all-the-icons-alltheicon "terminal" :face all-the-icons-lsilver)
             ("cmd"  all-the-icons-alltheicon "terminal" :face all-the-icons-lsilver)
             ("conf" all-the-icons-octicon "settings"    :v-adjust 0.0 :face all-the-icons-yellow)
             ("eln"  all-the-icons-octicon "file-binary" :v-adjust 0.0 :face all-the-icons-dsilver)
             ("epub" all-the-icons-faicon "book"         :height 1.0 :v-adjust -0.1 :face all-the-icons-green)
             ("exe"  all-the-icons-octicon "file-binary" :v-adjust 0.0 :face all-the-icons-dsilver)
             ("make" all-the-icons-fileicon "gnu"        :face all-the-icons-dorange)
             ("rss"  all-the-icons-octicon "rss"         :height 1.1 :v-adjust 0.0 :face all-the-icons-lorange)
             ("toml" all-the-icons-octicon "settings"    :v-adjust 0.0 :face all-the-icons-yellow)
             ("tsx"  all-the-icons-fileicon "tsx"        :height 1.0 :v-adjust -0.1 :face all-the-icons-cyan-alt)
             ("xpm"  all-the-icons-octicon "file-media"  :v-adjust 0.0 :face all-the-icons-dgreen))))
      (dolist (icon extension-icon-alist)
        (add-to-list 'all-the-icons-extension-icon-alist icon)))

    (let ((regexp-icon-alist
           '(("\\.[bB][iI][nN]$"               all-the-icons-octicon "file-binary" :v-adjust 0.0 :face all-the-icons-yellow)
             ("^config$"                       all-the-icons-octicon "settings"    :v-adjust 0.0 :face all-the-icons-dorange)
             ("\\.\\(ba\\|z\\)shrc$"           all-the-icons-alltheicon "script"   :height 0.9 :face all-the-icons-dpink)
             ("\\.\\(bash\\|zsh\\)*_?profile$" all-the-icons-alltheicon "script"   :height 0.9 :face all-the-icons-dred)
             ("\\.\\(ba\\|z\\)sh_history$"     all-the-icons-alltheicon "script"   :height 0.9 :face all-the-icons-dsilver)
             ("\\.zshenv$"                     all-the-icons-alltheicon "script"   :height 0.9 :face all-the-icons-dred)
             ("Cask\\'"                        all-the-icons-fileicon "elisp"      :height 1.0 :v-adjust -0.2 :face all-the-icons-blue)
             ("NEWS$"                          all-the-icons-faicon "newspaper-o"  :height 0.9 :v-adjust -0.2)
             ("^Rakefile$"                     all-the-icons-alltheicon "ruby-alt" :face all-the-icons-red))))
      (dolist (icon regexp-icon-alist)
        (add-to-list 'all-the-icons-regexp-icon-alist icon)))

    (let ((mode-icon-alist
           '((xwidget-webkit-mode           all-the-icons-faicon "chrome"          :v-adjust -0.1 :face all-the-icons-blue)
             (bongo-playlist-mode           all-the-icons-material "queue_music"   :height 1.3 :face all-the-icons-green)
             (bongo-library-mode            all-the-icons-material "library_music" :height 1.1 :face all-the-icons-green)
             (simple-mpc-mode               all-the-icons-faicon "music"           :v-adjust -0.1 :face all-the-icons-green)
             (mingus-playlist-mode          all-the-icons-faicon "music"           :v-adjust -0.1 :face all-the-icons-green)
             (mingus-help-mode              all-the-icons-material "music_note"    :height 1.2 :face all-the-icons-green)
             (mingus-browse-mode            all-the-icons-material "library_music" :height 1.1 :face all-the-icons-green)
             (mingus-burn-mode              all-the-icons-material "queue_music"   :height 1.3 :face all-the-icons-green)
             (gnus-group-mode               all-the-icons-fileicon "gnu"           :face all-the-icons-silver)
             (gnus-summary-mode             all-the-icons-octicon "inbox"          :height 1.0 :v-adjust 0.0 :face all-the-icons-orange)
             (gnus-article-mode             all-the-icons-octicon "mail"           :height 1.1 :v-adjust 0.0 :face all-the-icons-lblue)
             (message-mode                  all-the-icons-octicon "mail"           :height 1.1 :v-adjust 0.0 :face all-the-icons-lblue)
             (diff-mode                     all-the-icons-octicon "git-compare"    :v-adjust 0.0 :face all-the-icons-lred)
             (flycheck-error-list-mode      all-the-icons-octicon "checklist"      :height 1.1 :v-adjust 0.0 :face all-the-icons-lred)
             (newsticker-mode               all-the-icons-faicon "rss-square"      :v-adjust -0.1 :face all-the-icons-orange)
             (newsticker-treeview-mode      all-the-icons-faicon "rss-square"      :v-adjust -0.1 :face all-the-icons-orange)
             (newsticker-treeview-list-mode all-the-icons-octicon "rss"            :height 1.1 :v-adjust 0.0 :face all-the-icons-orange)
             (newsticker-treeview-item-mode all-the-icons-octicon "rss"            :height 1.1 :v-adjust 0.0 :face all-the-icons-lorange)
             (conf-mode                     all-the-icons-octicon "settings"       :v-adjust 0.0 :face all-the-icons-yellow)
             (conf-space-mode               all-the-icons-octicon "settings"       :v-adjust 0.0 :face all-the-icons-yellow)
             (gitconfig-mode                all-the-icons-octicon "settings"       :v-adjust 0.0 :face all-the-icons-dorange)
             (forge-topic-mode              all-the-icons-alltheicon "git"         :face all-the-icons-blue)
             (help-mode                     all-the-icons-faicon "info-circle"     :height 1.1 :v-adjust -0.1 :face all-the-icons-purple)
             (helpful-mode                  all-the-icons-faicon "info-circle"     :height 1.1 :v-adjust -0.1 :face all-the-icons-purple)
             (Info-mode                     all-the-icons-faicon "info-circle"     :height 1.1 :v-adjust -0.1)
             (cask-mode                     all-the-icons-fileicon "elisp"         :height 1.0 :v-adjust -0.2 :face all-the-icons-blue)
             (ein:notebooklist-mode         all-the-icons-faicon "book"            :face all-the-icons-lorange)
             (ein:notebook-mode             all-the-icons-fileicon "jupyter"       :height 1.2 :face all-the-icons-orange)
             (ein:notebook-multilang-mode   all-the-icons-fileicon "jupyter"       :height 1.2 :face all-the-icons-dorange)
             (nov-mode                      all-the-icons-faicon "book"            :height 1.0 :v-adjust -0.1 :face all-the-icons-green)
             (gfm-mode                      all-the-icons-octicon "markdown"       :face all-the-icons-lblue)
             (osx-dictionary-mode           all-the-icons-material "library_books" :face all-the-icons-lblue)
             (youdao-dictionary-mode        all-the-icons-material "library_books" :face all-the-icons-lblue)
             (fanyi-mode                    all-the-icons-material "library_books" :face all-the-icons-lblue))))
      (dolist (icon mode-icon-alist)
        (add-to-list 'all-the-icons-mode-icon-alist icon)))
    )



;; Show native line numbers if possible, otherwise use `linum'
(if (fboundp 'display-line-numbers-mode)
    (use-package display-line-numbers
      :ensure nil
      :hook (prog-mode . display-line-numbers-mode))
  (use-package linum-off
    :defines linum-format
    :hook (after-init . global-linum-mode)
    :init (setq linum-format "%4d ")
    :config
    ;; Highlight current line number
    (use-package hlinum
      :defines linum-highlight-in-all-buffersp
      :custom-face (linum-highlight-face ((t (:inherit default))))
      :hook (global-linum-mode . hlinum-activate)
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


;; Make certain buffers grossly incandescent
(use-package solaire-mode
        :hook (after-load-theme . solaire-global-mode))

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'tsdh-dark t)
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme
  (doom-themes-neotree-config)  ; all-the-icons fonts must be installed!
  )

(use-package doom-modeline
  :hook (after-init . doom-modeline-mode)
  :init
  (setq doom-modeline-icon zgh-icon
        doom-modeline-height 1
        doom-modeline-modal-icon nil
        find-file-visit-truename t
        doom-modeline-project-detection 'project
        doom-modeline-minor-modes t)
  (unless after-init-time
    (setq-default doom-modeline-mode-map nil))
  :bind (:map doom-modeline-mode-map
         ("C-<f6>" . doom-modeline-hydra/body))
  :pretty-hydra
  ((:title (pretty-hydra-title "Mode Line" 'fileicon "emacs" :face 'all-the-icons-purple :v-adjust -0.1)
    :color amaranth :quit-key "q")
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
    (("g" (progn
            (message "Fetching GitHub notifications...")
            (run-with-timer 300 nil #'doom-modeline--github-fetch-notifications)
            (browse-url "https://github.com/notifications"))
      "github notifications" :exit t)
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
     ("z n" (counsel-read-setq-expression 'doom-modeline-gnus-timer) "set gnus interval")))))

(use-package dashboard
  :diminish (dashboard-mode page-break-lines-mode)
  :functions (all-the-icons-faicon
              all-the-icons-material
              winner-undo
              widget-forward)
  :custom-face (dashboard-heading ((t (:inherit (font-lock-string-face bold)))))
  :hook (dashboard-mode . (lambda () (setq-local frame-title-format "")))
  :init
  (setq
   dashboard-startup-banner (or zgh-logo 'official)
   dashboard-center-content t
   dashboard-show-shortcuts nil
   dashboard-items '((recents  . 8)
                     (bookmarks . 5)
                     (projects . 5))

   dashboard-set-init-info t
   dashboard-set-file-icons zgh-icon
   dashboard-set-heading-icons zgh-icon
   dashboard-heading-icons '((recents   . "file-text")
                             (bookmarks . "bookmark")
                             (agenda    . "calendar")
                             (projects  . "briefcase")
                             (registers . "database"))

   dashboard-set-footer t
   dashboard-footer-icon (cond ((icons-displayable-p)
                                (all-the-icons-faicon "heart"
                                                      :height 1.1
                                                      :v-adjust -0.05
                                                      :face 'error))
                               ((char-displayable-p ?🧡) "🧡 ")
                               (t (propertize ">" 'face 'dashboard-footer)))

   dashboard-set-navigator t)
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
