;;; init-elpa.el ---

;; Copyright 2016 zhangguhua
;;
;; Author: zhangguhua@baidu.com
;; Version: $Id: init-elpa.el,v 0.0 2016/02/25 12:05:58 zhangguhua Exp $
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
;;   (require 'init-elpa)

;;; Code:


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;;(setq package-archives '(("gnu"   . "https://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
;;                         ("melpa" . "https://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")))

(setq package-archives '(("gnu"   . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

;; Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))

;;(require 'maple-package)
;;(maple-package-initialize 'no-activate)

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Should set before loading `use-package'
(eval-and-compile
  (setq use-package-always-ensure t)
  (setq use-package-always-defer t)
  (setq use-package-expand-minimally t)
  (setq use-package-enable-imenu-support t))

(eval-when-compile
  (require 'use-package))
;; Required by `use-package'
(use-package diminish)
(use-package bind-key)

;; Update GPG keyring for GNU ELPA
(use-package gnu-elpa-keyring-update)

;; Initialization benchmark
(when centaur-benchmark-init
  (use-package benchmark-init
    :defines swiper-font-lock-exclude
    :commands (benchmark-init/activate)
    :hook (after-init . benchmark-init/deactivate)
    :init (benchmark-init/activate)
    :config
    (with-eval-after-load 'swiper
      (add-to-list 'swiper-font-lock-exclude 'benchmark-init/tree-mode))))

;; A modern Packages Menu
(use-package paradox
  :init
  (setq paradox-execute-asynchronously t
        paradox-github-token t
        paradox-display-star-count nil)

  ;; Replace default `list-packages'
  (defun my-paradox-enable (&rest _)
    "Enable paradox, overriding the default package-menu."
    (paradox-enable))
  (advice-add #'list-packages :before #'my-paradox-enable)
  :config
  (when (fboundp 'page-break-lines-mode)
    (add-hook 'paradox-after-execute-functions
              (lambda (&rest _)
                (let ((buf (get-buffer-create "*Paradox Report*"))
                      (inhibit-read-only t))
                  (with-current-buffer buf
                    (page-break-lines-mode 1))))
              t)))

;; Auto update packages
(use-package auto-package-update
  :init
  (setq auto-package-update-delete-old-versions t
        auto-package-update-hide-results t)
  (defalias 'upgrade-packages #'auto-package-update-now))


(provide 'init-elpa)


;; ;;; init-elpa.el ends here
