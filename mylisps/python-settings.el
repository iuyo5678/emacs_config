;; Copyright (C) 2010 ahei

;; Author: ahei <ahei0802@gmail.com>
;; URL: http://code.google.com/p/dea/source/browse/trunk/my-lisps/python-settings.el
;; Time-stamp: <2015-01-23 00:07:59 Friday by nilin>
;; Time-stamp: <2013-11-29 18:53:39 Friday by zhangguhua>

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

;;(require 'pdb-settings)
;;(require 'pydb)
;;(setq pydb-many-windows t)

(when (featurep 'python) (unload-feature 'python t))

(setq py-install-directory (concat my-emacs-lisps-path "python-mode/"))
(require 'python-mode)
(require 'ipython)


(setq-default py-shell-name "ipython")
(setq py-python-command-args
      '("--gui=wx" "--pylab=wx" "--colors" "Linux"))

(when (executable-find "pyflakes")
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "pyflakes" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init)))

(setq python-indent-guess-indent-offset nil)
(provide 'python-settings)
