;; Copyright (C) 2010 ahei

;; Author: ahei <ahei0802@gmail.com>
;; URL: http://code.google.com/p/dea/source/browse/trunk/my-lisps/doxymacs-settings.el
;; Time-stamp: <2013-09-26 19:37:35 Thursday by zhangguhua>

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

(autoload 'doxymacs-mode "doxymacs"
  ;; All of the following text shows up in the "mode help" (C-h m)
  "Minor mode for using/creating Doxygen documentation.
To submit a problem report, request a feature or get support, please
visit doxymacs' homepage at http://doxymacs.sourceforge.net/.

To see what version of doxymacs you are running, enter
`\\[doxymacs-version]'.

In order for `doxymacs-lookup' to work you will need to customise the
variable `doxymacs-doxygen-dirs'.

Key bindings:
\\{doxymacs-mode-map}" t)

(am-add-hooks
 `(c-mode-common-hook php-mode-hook py-mode-hook python-mode-hook)
 (lambda ()
   (doxymacs-mode 1)
   (doxymacs-font-lock)))

(setq doxymacs-doxygen-dirs
      '(("/home/users/zhangguhua/Document"
         "/home/users/zhangguhua/Document/zgh.xml"
         "file:///home/users/zhangguhua/Document/html")))
(defun doxymacs-settings ()
  "Settings for `doxymacs'.")

(eval-after-load "doxymacs"
  `(doxymacs-settings))

(provide 'doxymacs-settings)
