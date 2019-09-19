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
(if (eq system-type 'darwin)
    (add-to-list 'company-c-headers-path-system "/usr/local/include/c++/v1"))

(if (eq system-type 'gnu/linux)
    (add-to-list 'company-c-headers-path-system "/usr/local/gcc-5.4.0/include/c++/5.4.0"))

;;(add-to-list 'company-backends #'company-tabnine)

(add-to-list 'company-backends 'company-c-headers)

;; (add-to-list 'company-backends 'company-yasnippet)
(add-to-list 'company-backends 'company-files)


(defun company//sort-by-tabnine (candidates)
  (if (or (functionp company-backend)
          (not (and (listp company-backend) (memq 'company-tabnine company-backend))))
      candidates
    (let ((candidates-table (make-hash-table :test #'equal))
          candidates-1
          candidates-2)
      (dolist (candidate candidates)
        (if (eq (get-text-property 0 'company-backend candidate)
                'company-tabnine)
            (unless (gethash candidate candidates-table)
              (push candidate candidates-2))
          (push candidate candidates-1)
          (puthash candidate t candidates-table)))
      (setq candidates-1 (nreverse candidates-1))
      (setq candidates-2 (nreverse candidates-2))
      (nconc (seq-take candidates-1 2)
             (seq-take candidates-2 2)
             (seq-drop candidates-1 2)
             (seq-drop candidates-2 2)))))

(add-to-list 'company-transformers 'company//sort-by-tabnine t)
;; `:separate`  使得不同 backend 分开排序
(add-to-list 'company-backends '(company-yasnippet :with company-tabnine :separate))

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
