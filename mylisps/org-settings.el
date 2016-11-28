;;; org-settings.el --- 

;; Copyright 2016 your name
;;
;; Author: youremail@host.com
;; Version: $Id: org-settings.el,v 0.0 2016/07/22 19:36:05 zhangguhua Exp $
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
;;   (require 'org-settings)

;;; Code:

(provide 'org-settings)
(eval-when-compile
  (require 'cl))

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(defun org-insert-src-block (src-code-type)
    "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
    (interactive
     (let ((src-code-types
            '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
              "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
              "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
              "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
              "scheme" "sqlite")))
         (list (ido-completing-read "Source code type: " src-code-types))))
    (progn
        (newline-and-indent)
        (insert (format "#+BEGIN_SRC %s\n" src-code-type))
        (newline-and-indent)
        (insert "#+END_SRC\n")
        (previous-line 2)
        (org-edit-src-code)))

(add-hook 'org-mode-hook '(lambda ()
                              ;; turn on flyspell-mode by default
                              (flyspell-mode 1)
                              ;; C-TAB for expanding
                              (local-set-key (kbd "C-<tab>")
                                             'yas/expand-from-trigger-key)
                              ;; keybinding for editing source code blocks
                              (local-set-key (kbd "C-c s e")
                                             'org-edit-src-code)
                              ;; keybinding for inserting code blocks
                              (local-set-key (kbd "C-c s i")
                                             'org-insert-src-block)
                              ))

(setq org-src-fontify-natively t)



;;; org-settings.el ends here
