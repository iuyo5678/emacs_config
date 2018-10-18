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

(require 'helm)
(require 'helm-config)
(require 'helm-grep)

(if (version< "26.0.50" emacs-version)
        (eval-when-compile (require 'helm-lib)))

(defun helm-hide-minibuffer-maybe ()
    (when (with-helm-buffer helm-echo-input-in-header-line)
        (let ((ov (make-overlay (point-min) (point-max) nil nil t)))
            (overlay-put ov 'window (selected-window))
            (overlay-put ov 'face (let ((bg-color (face-background 'default nil)))
                                      `(:background ,bg-color :foreground ,bg-color)))
            (setq-local cursor-type nil))))

(add-hook 'helm-minibuffer-set-up-hook 'helm-hide-minibuffer-maybe)

(setq helm-adaptive-history-file             "~/.emacs.d/helm-history"
      helm-move-to-line-cycle-in-source      t
      helm-buffers-fuzzy-matching            t
      helm-ff-auto-update-initial-value      t)



(when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

(setq helm-google-suggest-use-curl-p t
      helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
      ;; helm-quick-update t ; do not display invisible candidates
      helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.

      ;; you can customize helm-do-grep to execute ack-grep
      ;; helm-grep-default-command "ack-grep -Hn --smart-case --no-group --no-color %e %p %f"
      ;; helm-grep-default-recurse-command "ack-grep -H --smart-case --no-group --no-color %e %p %f"
      helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window

      helm-echo-input-in-header-line t
      
      ;; helm-candidate-number-limit 500 ; limit the number of displayed canidates
      helm-ff-file-name-history-use-recentf t
      helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
      helm-buffer-skip-remote-checking t

      helm-mode-fuzzy-match t

      helm-buffers-fuzzy-matching t ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers
      helm-org-headings-fontify t
      helm-find-files-sort-directories t
      ;; ido-use-virtual-buffers t
      helm-semantic-fuzzy-match t
      helm-M-x-fuzzy-match t
      helm-imenu-fuzzy-match t
      helm-lisp-fuzzy-completion t
      ;; helm-apropos-fuzzy-match t
      helm-buffer-skip-remote-checking t
      helm-locate-fuzzy-match t
      helm-display-header-line nil)

(add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

 (add-hook 'eshell-mode-hook
           #'(lambda ()
;;                 (define-key eshell-mode-map (kbd "TAB")     'helm-esh-pcomplete)
                 (define-key eshell-mode-map (kbd "C-c C-l") 'helm-eshell-history)))

(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
(define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
(define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward)

(global-set-key (kbd "C-x b")   #'helm-mini)
(global-set-key (kbd "C-x M-f")   #'helm-find-files)
(global-set-key (kbd "C-x C-b") #'helm-buffers-list)
(global-set-key (kbd "C-c M-x") #'helm-M-x)
(global-set-key (kbd "C-x C-r") #'helm-recentf)
(global-set-key (kbd "C-x r l") #'helm-filtered-bookmarks)
(global-set-key (kbd "M-y")     #'helm-show-kill-ring)


(global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
(global-set-key (kbd "C-c h o") 'helm-occur)

(global-set-key (kbd "C-c h w") 'helm-wikipedia-suggest)
(global-set-key (kbd "C-c h g") 'helm-google-suggest)

(global-set-key (kbd "C-c h x") 'helm-register)

(define-key 'help-command (kbd "C-f") 'helm-apropos)
(define-key 'help-command (kbd "r") 'helm-info-emacs)
(define-key 'help-command (kbd "C-l") 'helm-locate-library)


;;; Save current position to mark ring
(add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

;; show minibuffer history with Helm
(define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
(define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

(define-key global-map [remap find-tag] 'helm-etags-select)

(define-key global-map [remap list-buffers] 'helm-buffers-list)

(helm-adaptive-mode t)

(define-key helm-map (kbd "M-o") 'helm-previous-source)

(when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))
(helm-mode 1)



;;; helm-settings.el ends here
