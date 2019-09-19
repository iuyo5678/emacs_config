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
            '("bash" "emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
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
                              ;; keybinding for inserting time-stamp
                              (local-set-key (kbd "C-c s t")
                                             'org-time-stamp)
                              ))

(setq org-src-fontify-natively t)
;; 先将 org-capture-templates 设置为空
(setq org-capture-templates nil)
(add-to-list 'org-capture-templates '("t" "Tasks"))
(add-to-list 'org-capture-templates
             '("tw" "Work Task" entry
               (file+headline "~/Dropbox/docs/org/workplan.org" "遗留工作")
               "* TODO %^{任务名}\n%u\n%a\n" :clock-in t :clock-resume t))
(add-to-list 'org-capture-templates
             '("n" "Notes" entry (file "~/Dropbox/docs/org/lifebook.org")
               "* %^{heading} %t %^g\n  %?\n"))


(require 'org-protocol)
(add-to-list 'org-capture-templates '("p" "Protocol"))
(add-to-list 'org-capture-templates
             '("pn" "Protocol Bookmarks" entry
               (file+headline "~/Dropbox/docs/org/web.org" "Notes")
               "* %U - %:annotation %^g\n\n  %?" :empty-lines 1 :kill-buffer t))
(add-to-list 'org-capture-templates
             '("pb" "Protocol Bookmarks" entry
               (file+headline "~/Dropbox/docs/org/web.org" "Bookmarks")
               "* %U - %:annotation" :immediate-finish t :kill-buffer t))
(add-to-list 'org-capture-templates
             '("pa" "Protocol Annotation" plain
               (file+function "~/Dropbox/docs/org/web.org" org-capture-template-goto-link)
               "  %U - %?\n\n  %:initial" :empty-lines 1))
(defun make-orgcapture-frame ()
  "Create a new frame and run org-capture."
  (interactive)
  (make-frame '((name . "remember") (width . 80) (height . 16)
                (top . 400) (left . 300)
                (font . "-apple-Monaco-medium-normal-normal-*-13-*-*-*-m-0-iso10646-1")
                ))
  (select-frame-by-name "remember")
  (org-capture))
(defun org-capture-template-goto-link ()
  (org-capture-put :target (list 'file+headline
                                 (nth 1 (org-capture-get :target))
                                 (org-capture-get :annotation)))
  (org-capture-put-target-region-and-position)
  (widen)
  (let ((hd (nth 2 (org-capture-get :target))))
    (goto-char (point-min))
    (if (re-search-forward
         (format org-complex-heading-regexp-format (regexp-quote hd)) nil t)
        (org-end-of-subtree)
      (goto-char (point-max))
      (or (bolp) (insert "\n"))
      (insert "* " hd "\n"))))


(global-set-key (kbd "C-c c") 'org-capture)

(setq org-todo-keywords '((sequence "TODO(t)" "PLAN(p@)" "DOING(i)" "|" "DONE(d@)" "ABORT(a@)")))

(setq org-todo-keyword-faces '(("TODO" . "red")
                               ("PLAN" . "purple")
                               ("DOING" . "yellow")
                               ("DONE" . "green")
                               ("ABORT" . "blue")))
;;; org-settings.el ends here
