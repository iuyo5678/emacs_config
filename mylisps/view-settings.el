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

(use-package good-scroll
  :init (good-scroll-mode))

(define-minor-mode centaur-read-mode
  "Minor Mode for better reading experience."
  :init-value nil
  :group centaur
  (if centaur-read-mode
      (progn
        (and (fboundp 'olivetti-mode) (olivetti-mode 1))
        (and (fboundp 'mixed-pitch-mode) (mixed-pitch-mode 1))
        (text-scale-set +2))
    (progn
      (and (fboundp 'olivetti-mode) (olivetti-mode -1))
      (and (fboundp 'mixed-pitch-mode) (mixed-pitch-mode -1))
      (text-scale-set 0))))

;; Browse URL
(defun centaur-webkit-browse-url (url &optional pop-buffer new-session)
  "Browse URL with xwidget-webkit' and switch or pop to the buffer.

POP-BUFFER specifies whether to pop to the buffer.
NEW-SESSION specifies whether to create a new xwidget-webkit session."
  (interactive (progn
                 (require 'browse-url)
                 (browse-url-interactive-arg "xwidget-webkit URL: ")))
  (or (featurep 'xwidget-internal)
      (user-error "Your Emacs was not compiled with xwidgets support"))

  (xwidget-webkit-browse-url url new-session)
  (let ((buf (xwidget-buffer (xwidget-webkit-current-session))))
    (when (buffer-live-p buf)
      (and (eq buf (current-buffer)) (quit-window))
      (if pop-buffer
          (pop-to-buffer buf)
        (switch-to-buffer buf)))))

;; PDF reader
(when (display-graphic-p)
  (use-package pdf-view
    :ensure pdf-tools
    :diminish (pdf-view-themed-minor-mode
               pdf-view-midnight-minor-mode
               pdf-view-printer-minor-mode)
    :defines pdf-annot-activate-created-annotations
    :hook ((pdf-tools-enabled . pdf-view-auto-slice-minor-mode)
           (pdf-tools-enabled . pdf-isearch-minor-mode))
    :mode ("\\.[pP][dD][fF]\\'" . pdf-view-mode)
    :magic ("%PDF" . pdf-view-mode)
    :bind (:map pdf-view-mode-map
           ("C-s" . isearch-forward))
    :init (setq pdf-view-use-scaling t
                pdf-view-use-imagemagick t
                pdf-annot-activate-created-annotations t)
    :config
    (pdf-tools-install t nil t nil)
    (use-package saveplace-pdf-view
      :autoload (saveplace-pdf-view-find-file-advice saveplace-pdf-view-to-alist-advice)
      :init
      (advice-add 'save-place-find-file-hook :around #'saveplace-pdf-view-find-file-advice)
      (advice-add 'save-place-to-alist :around #'saveplace-pdf-view-to-alist-advice))) )

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

(use-package json-navigator)

;; Atom/RSS reader
(use-package elfeed
  :pretty-hydra
  ((:title (pretty-hydra-title "Elfeed" 'faicon "rss-square" :face 'all-the-icons-orange :height 1.1 :v-adjust -0.05)
    :color amaranth :quit-key ("q" "C-g"))
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
         ("q" . delete-window))
  :hook (elfeed-show-mode . centaur-read-mode)
  :init (setq url-queue-timeout 30
              elfeed-db-directory (locate-user-emacs-file ".elfeed")
              elfeed-show-entry-switch #'pop-to-buffer
              elfeed-show-entry-delete #'delete-window
              elfeed-feeds '(
                ("https://www.huxiu.com/rss/0.xml" 虎嗅)
                ("https://36kr.com/feed" 36ker)
                ("https://www.ifanr.com/feed" ifanr)
                ("https://www.pingwest.com/feed/" pingwest)
                ("https://www.zhihu.com/rss" 知乎)
                ("https://www.feng.com/rss.xml" 威锋网)
                ))
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
    (advice-add #'elfeed-search-browse-url :override #'my-elfeed-search-browse-url)))

(provide 'view-settings)
;;; view-settings.el ends here
