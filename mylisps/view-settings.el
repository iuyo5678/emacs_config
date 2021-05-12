;;; view-settings.el ---

;; Copyright 2021 Zhang Guhua
;;
;; Author: zhangguhua@DRAKEZHANG-MB1
;; Version: $Id: view-settings.el,v 0.0 2021/03/18 11:36:21 zhangguhua Exp $
;; Keywords:
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary: 阅读查看工具的配置

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'view-settings)

;;; Code:

(define-minor-mode centaur-read-mode
  "Minor Mode for better reading experience."
  :init-value nil
  :group centaur
  (if centaur-read-mode
      (progn
        (text-scale-set +2))
    (progn
      (text-scale-set 0))))
;;
;; PDF reader
(when (display-graphic-p)
  (use-package pdf-view
    :ensure pdf-tools
    :diminish (pdf-view-midnight-minor-mode pdf-view-printer-minor-mode)
    :defines pdf-annot-activate-created-annotations
    :functions (my-pdf-view-set-midnight-colors my-pdf-view-set-dark-theme)
    :commands pdf-view-midnight-minor-mode
    :mode ("\\.[pP][dD][fF]\\'" . pdf-view-mode)
    :magic ("%PDF" . pdf-view-mode)
    :bind (:map pdf-view-mode-map
           ("C-s" . isearch-forward))
    :init (setq pdf-annot-activate-created-annotations t)
    :config
    ;; Build pdfinfo if needed, locking until it's complete
    (with-no-warnings
      (defun my-pdf-tools-install ()
        (unless (file-executable-p pdf-info-epdfinfo-program)
          (let ((wconf (current-window-configuration)))
            (pdf-tools-install t)
            (message "Building epdfinfo. Please wait for a moment...")
            (while compilation-in-progress
              ;; Block until `pdf-tools-install' is done
              (sleep-for 1))
            (when (file-executable-p pdf-info-epdfinfo-program)
              (set-window-configuration wconf)))))
      (advice-add #'pdf-view-decrypt-document :before #'my-pdf-tools-install))

    ;; Set dark theme
    (defun my-pdf-view-set-midnight-colors ()
      "Set pdf-view midnight colors."
      (setq pdf-view-midnight-colors
            `(,(face-foreground 'default) . ,(face-background 'default))))

    (defun my-pdf-view-set-dark-theme ()
      "Set pdf-view midnight theme as color theme."
      (my-pdf-view-set-midnight-colors)
      (dolist (buf (buffer-list))
        (with-current-buffer buf
          (when (eq major-mode 'pdf-view-mode)
            (pdf-view-midnight-minor-mode (if pdf-view-midnight-minor-mode 1 -1))))))

    (my-pdf-view-set-midnight-colors)
    (add-hook 'after-load-theme-hook #'my-pdf-view-set-dark-theme)

    (with-no-warnings
      ;; FIXME: Support retina display on MAC
      ;; @see https://emacs-china.org/t/pdf-tools-mac-retina-display/10243/
      ;; and https://github.com/politza/pdf-tools/pull/501/
      (setq pdf-view-use-scaling t
            pdf-view-use-imagemagick nil)

      (defun my-pdf-view-use-scaling-p ()
        "Return t if scaling should be used."
        (and (or (and (eq (framep-on-display) 'ns) (>= emacs-major-version 27))
                 (memq (pdf-view-image-type) '(imagemagick image-io)))
             pdf-view-use-scaling))
      (advice-add #'pdf-view-use-scaling-p :override #'my-pdf-view-use-scaling-p)

      (defun my-pdf-view-create-page (page &optional window)
        "Create an image of PAGE for display on WINDOW."
        (let* ((size (pdf-view-desired-image-size page window))
               (width (if (not (pdf-view-use-scaling-p))
                          (car size)
                        (* 2 (car size))))
               (data (pdf-cache-renderpage
                      page width width))
               (hotspots (pdf-view-apply-hotspot-functions
                          window page size)))
          (pdf-view-create-image data
                                 :width width
                                 :scale (if (pdf-view-use-scaling-p) 0.5 1)
                                 :map hotspots
                                 :pointer 'arrow)))
      (advice-add #'pdf-view-create-page :override #'my-pdf-view-create-page)

      (defun my-pdf-util-frame-scale-factor ()
        "Return the frame scale factor depending on the image type used for display."
        (if (and pdf-view-use-scaling
                 (memq (pdf-view-image-type) '(imagemagick image-io))
                 (fboundp 'frame-monitor-attributes))
            (or (cdr (assq 'backing-scale-factor (frame-monitor-attributes)))
                (if (>= (pdf-util-frame-ppi) 180)
                    2
                  1))
          (if (and pdf-view-use-scaling (eq (framep-on-display) 'ns))
              2
            1)))
      (advice-add #'pdf-util-frame-scale-factor :override #'my-pdf-util-frame-scale-factor)

      (defun my-pdf-isearch-hl-matches (current matches &optional occur-hack-p)
        "Highlighting edges CURRENT and MATCHES."
        (cl-destructuring-bind (fg1 bg1 fg2 bg2)
            (pdf-isearch-current-colors)
          (let* ((width (car (pdf-view-image-size)))
                 (page (pdf-view-current-page))
                 (window (selected-window))
                 (buffer (current-buffer))
                 (tick (cl-incf pdf-isearch--hl-matches-tick))
                 (pdf-info-asynchronous
                  (lambda (status data)
                    (when (and (null status)
                               (eq tick pdf-isearch--hl-matches-tick)
                               (buffer-live-p buffer)
                               (window-live-p window)
                               (eq (window-buffer window)
                                   buffer))
                      (with-selected-window window
                        (when (and (derived-mode-p 'pdf-view-mode)
                                   (or isearch-mode
                                       occur-hack-p)
                                   (eq page (pdf-view-current-page)))
                          (pdf-view-display-image
                           (pdf-view-create-image data :width width))))))))
            (pdf-info-renderpage-text-regions
             page width t nil
             `(,fg1 ,bg1 ,@(pdf-util-scale-pixel-to-relative
                            current))
             `(,fg2 ,bg2 ,@(pdf-util-scale-pixel-to-relative
                            (apply 'append
                                   (remove current matches))))))))
      (advice-add #'pdf-isearch-hl-matches :override #'my-pdf-isearch-hl-matches)

      (defun pdf-annot-show-annotation (a &optional highlight-p window)
        "Make annotation A visible."
        (save-selected-window
          (when window (select-window window))
          (pdf-util-assert-pdf-window)
          (let ((page (pdf-annot-get a 'page))
                (size (pdf-view-image-size)))
            (unless (= page (pdf-view-current-page))
              (pdf-view-goto-page page))
            (let ((edges (pdf-annot-get-display-edges a)))
              (when highlight-p
                (pdf-view-display-image
                 (pdf-view-create-image
                  (pdf-cache-renderpage-highlight
                   page (car size)
                   `("white" "steel blue" 0.35 ,@edges))
                  :map (pdf-view-apply-hotspot-functions
                        window page size)
                  :width (car size))))
              (pdf-util-scroll-to-edges
               (pdf-util-scale-relative-to-pixel (car edges)))))))
      (advice-add #'pdf-annot-show-annotation :override #'my-pdf-annot-show-annotation))

    ;; Recover last viewed position
    (use-package saveplace-pdf-view
      :commands (saveplace-pdf-view-find-file-advice saveplace-pdf-view-to-alist-advice)
      :init
      (advice-add 'save-place-find-file-hook :around #'saveplace-pdf-view-find-file-advice)
      (advice-add 'save-place-to-alist :around #'saveplace-pdf-view-to-alist-advice))))

;; Epub reader
(use-package nov
  :mode ("\\.epub\\'" . nov-mode)
  :hook (nov-mode . my-nov-setup)
  :init
  (defun my-nov-setup ()
    "Setup `nov-mode' for better reading experience."
    (visual-line-mode 1)
    (centaur-read-mode)
    (face-remap-add-relative 'variable-pitch :family "Times New Roman" :height 1.5))
  :config
  (with-no-warnings
    ;; HACK: errors while opening `nov' files with Unicode characters
    ;; @see https://github.com/wasamasa/nov.el/issues/63
    (defun my-nov-content-unique-identifier (content)
      "Return the the unique identifier for CONTENT."
      (let* ((name (nov-content-unique-identifier-name content))
             (selector (format "package>metadata>identifier[id='%s']"
                               (regexp-quote name)))
             (id (car (esxml-node-children (esxml-query selector content)))))
        (and id (intern id))))
    (advice-add #'nov-content-unique-identifier :override #'my-nov-content-unique-identifier))

  ;; Fix encoding issue on Windows
  (when sys/win32p
    (setq process-coding-system-alist
          (cons `(,nov-unzip-program . (gbk . gbk))
                process-coding-system-alist))))

;; Atom/RSS reader
(when (and (>= emacs-major-version 25.2)
           (functionp #'org-version)
           (not (string-empty-p (org-version))))
  (use-package elfeed
    :pretty-hydra
    ((:title (pretty-hydra-title "Elfeed" 'faicon "rss-square" :face 'all-the-icons-orange :height 1.1 :v-adjust -0.05)
      :color amaranth :quit-key "q")
     ("Search"
      (("c" elfeed-db-compact "compact db")
       ("g" elfeed-search-update--force "refresh")
       ("G" elfeed-search-fetch "update")
       ("y" elfeed-search-yank "copy URL")
       ("+" elfeed-search-tag-all "tag all")
       ("-" elfeed-search-untag-all "untag all"))
      "Filter"
      (("l" elfeed-search-live-filter "live filter")
       ("s" elfeed-search-set-filter "set filter")
       ("*" (elfeed-search-set-filter "@6-months-ago +star") "starred")
       ("a" (elfeed-search-set-filter "@6-months-ago") "all")
       ("t" (elfeed-search-set-filter "@1-day-ago") "today"))
      "Article"
      (("b" elfeed-search-browse-url "browse")
       ("n" next-line "next")
       ("p" previous-line "previous")
       ("u" elfeed-search-tag-all-unread "mark unread")
       ("r" elfeed-search-untag-all-unread "mark read")
       ("RET" elfeed-search-show-entry "show"))))
    :bind (("C-x w" . elfeed)
           :map elfeed-search-mode-map
           ("?" . elfeed-hydra/body)
           :map elfeed-show-mode-map
           ("o" . ace-link)
           ("q" . delete-window))
    :hook (elfeed-show-mode . centaur-read-mode)
    :init (setq url-queue-timeout 30
                elfeed-db-directory (locate-user-emacs-file ".elfeed")
                elfeed-show-entry-switch #'pop-to-buffer
                elfeed-show-entry-delete #'delete-window
                elfeed-feeds '(("https://planet.emacslife.com/atom.xml" planet emacslife)
                               ("http://www.masteringemacs.org/feed/" mastering)
                               ("https://oremacs.com/atom.xml" oremacs)
                               ("https://pinecast.com/feed/emacscast" emacscast)
                               ("https://www.reddit.com/r/emacs.rss" reddit)))
    :config
    ;; Ignore db directory in recentf
    (push elfeed-db-directory recentf-exclude)

    ;; Use xwidget if possible
    (with-no-warnings
      (defun my-elfeed-show-visit (&optional use-generic-p)
        "Visit the current entry in your browser using `browse-url'.
If there is a prefix argument, visit the current entry in the
browser defined by `browse-url-generic-program'."
        (interactive "P")
        (let ((link (elfeed-entry-link elfeed-show-entry)))
          (when link
            (message "Sent to browser: %s" link)
            (cond
             ((featurep 'xwidget-internal)
              (centaur-webkit-browse-url link))
             (use-generic-p
              (browse-url-generic link))
             (t (browse-url link))))))
      (advice-add #'elfeed-show-visit :override #'my-elfeed-show-visit)

      (defun my-elfeed-search-browse-url (&optional use-generic-p)
        "Visit the current entry in your browser using `browse-url'.
If there is a prefix argument, visit the current entry in the
browser defined by `browse-url-generic-program'."
        (interactive "P")
        (let ((entries (elfeed-search-selected)))
          (cl-loop for entry in entries
                   do (elfeed-untag entry 'unread)
                   when (elfeed-entry-link entry)
                   do (cond
                       ((featurep 'xwidget-internal)
                        (centaur-webkit-browse-url it t))
                       (use-generic-p
                        (browse-url-generic it))
                       (t (browse-url it))))
          (mapc #'elfeed-search-update-entry entries)
          (unless (or elfeed-search-remain-on-entry (use-region-p))
            (forward-line))))
      (advice-add #'elfeed-search-browse-url :override #'my-elfeed-search-browse-url))))

;; Another Atom/RSS reader
(use-package newsticker
  :ensure nil
  :bind ("C-x W" . newsticker-show-news)
  :hook (newsticker-treeview-item-mode . centaur-read-mode)
  :init (setq newsticker-url-list
              '(("Planet Emacslife" "https://planet.emacslife.com/atom.xml")
                ("Mastering Emacs" "http://www.masteringemacs.org/feed/")
                ("Oremacs" "https://oremacs.com/atom.xml")
                ("EmacsCast" "https://pinecast.com/feed/emacscast")
                ("Emacs Reddit" "https://www.reddit.com/r/emacs.rss"))))


(provide 'view-settings)
;;; view-settings.el ends here
