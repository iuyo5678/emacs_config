;;; helm-settings.el --- 

;; Copyright 2016 张鼓华
;;
;; Author: iuyo5678@gmail.com
;; Version: $Id: helm-settings.el,v 0.0 2016/03/09 02:31:07 zhangguhua Exp $
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

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'helm-settings)

;;; Code:

(provide 'helm-settings)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################


(setq helm-adaptive-history-file             "~/.emacs.d/helm-history"
      helm-move-to-line-cycle-in-source      t
      helm-buffers-fuzzy-matching            t
      helm-ff-auto-update-initial-value      t)


(add-hook 'eshell-mode-hook
          #'(lambda ()
                (define-key eshell-mode-map (kbd "TAB")     'helm-esh-pcomplete)
                (define-key eshell-mode-map (kbd "C-c C-l") 'helm-eshell-history)))

(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-c M-x") #'helm-M-x)
;;(global-set-key (kbd "C-x C-f") #'helm-find-files)
(global-set-key (kbd "C-x C-r") #'helm-recentf)
(global-set-key (kbd "C-x r l") #'helm-filtered-bookmarks)
(global-set-key (kbd "M-y")     #'helm-show-kill-ring)

(require 'helm)
(require 'helm-config)
(helm-adaptive-mode t)


(define-key helm-map (kbd "M-o") 'helm-previous-source)

(when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))



(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)



;;; helm-settings.el ends here
