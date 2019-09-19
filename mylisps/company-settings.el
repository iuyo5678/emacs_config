;;; company-settings.el ---

;; Copyright 2019 Zhang Guhua
;;
;; Author: iuyo5678@gmail.com
;; Version: $Id: company-settings.el,v 0.0 2019/07/22 15:55:59 zhangguhua Exp $
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
;;   (require 'company-settings)

;;; Code:

(provide 'company-settings)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; company
(require 'company)
(global-company-mode 1)
(require 'company-tabnine)

(require 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/local/gcc-5.4.0/include/c++/5.4.0/")

(setq company-backends `((company-elisp :with
                                          company-yasnippet company-tabnine)
                           company-bbdb
                           ,@(unless (version<= "26" emacs-version)
                               '(company-nxml company-css))
                           company-semantic
                           (company-capf :with
                                         company-yasnippet company-tabnine)
                           company-tabnine
                           company-files
                           (company-dabbrev-code
                            company-gtags company-etags company-keywords)
                           company-oddmuse company-dabbrev))



;;(add-to-list 'company-backends #'company-complete)
;;(add-to-list 'company-backends #'company-tabnine)

;;(add-to-list 'company-backends 'company-c-headers)
;;(add-to-list 'company-backends 'company-yasnippet)
;(add-to-list 'company-backends #'company-files)


;; Trigger completion immediately.
(setq company-idle-delay 0)

;; Number the candidates (use M-1, M-2 etc to select completions).
(setq company-show-numbers t)

;; Use the tab-and-go frontend.
;; Allows TAB to select and complete at the same time.
(setq company-frontends
      '(company-tng-frontend
        company-pseudo-tooltip-frontend
        company-echo-metadata-frontend))


;;; company-settings.el ends here
