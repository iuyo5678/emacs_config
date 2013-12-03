;; Copyright (C) 2010 ahei

;; Author: ahei <ahei0802@gmail.com>
;; URL: http://code.google.com/p/dea/source/browse/trunk/my-lisps/python-settings.el
;; Time-stamp: <2013-12-03 23:45:53 Tuesday by nilin>

;; This  file is free  software; you  can redistribute  it and/or
;; modify it under the terms of the GNU General Public License as
;; published by  the Free Software Foundation;  either version 3,
;; or (at your option) any later version.

;; This file is  distributed in the hope that  it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR  A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You  should have  received a  copy of  the GNU  General Public
;; License along with  GNU Emacs; see the file  COPYING.  If not,
;; write  to  the Free  Software  Foundation,  Inc., 51  Franklin
;; Street, Fifth Floor, Boston, MA 02110-1301, USA.

(require 'pdb-settings)
(require 'pydb)
;;(require 'ipython)

(setq py-install-directory (concat my-emacs-lisps-path "python-mode.el-6.1.2/"))
(require 'python-mode)

(when (executable-find "pyflakes")
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init))
  ;; (require 'flymake-cursor)
  ;; (add-hook 'find-file-hook 'flymake-find-file-hook)
  ;; (load-library "flymake-cursor")  ;在minibuffer显示错误信息
  ;; (global-set-key (kbd "<f11>") 'flymake-start-syntax-check)
  ;; (global-set-key (kbd "<s-up>") 'flymake-goto-prev-error)
  ;; (global-set-key (kbd "<s-down>") 'flymake-goto-next-error)

  ;; (custom-set-faces
  ;;  '(flymake-errline ((((class color)) (:underline "red"))))
  ;;  '(flymake-warnline ((((class color)) (:underline "yellow1")))))
  ;; (setq flymake-no-changes-timeout 600)
  )

(load "python-mode")

(provide 'python-settings)
