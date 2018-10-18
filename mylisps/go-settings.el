;;; go-settings.el --- 

;; Copyright 2017 Zhang Guhua
;;
;; Author: iuyo5678@gmail.com
;; Version: $Id: go-settings.el,v 0.0 2017/12/19 20:35:00 zhangguhua Exp $
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
;;   (require 'go-settings)

;;; Code:

(provide 'go-settings)
(eval-when-compile
    (require 'cl))

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(with-eval-after-load 'go-mode
    (require 'go-guru)
    (require 'godoctor))

(add-hook 'before-save-hook 'gofmt-before-save)
(add-hook 'go-mode-hook
          (lambda ()
              (add-hook 'before-save-hook 'gofmt-before-save)
              (setq tab-width 4)
              (setq indent-tabs-mode 1)))

(defun my-go-mode-hook ()
    (setq gofmt-command "goimports")
    (if (not (string-match "go" compile-command))
            (set (make-local-variable 'compile-command)
                 "go build -v && go test -v && go vet"))
    )
(add-hook 'go-mode-hook 'my-go-mode-hook)

;;; go-settings.el ends here
