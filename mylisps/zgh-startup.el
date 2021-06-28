;;; zgh-startup.elp.el ---

;; Copyright 2021 Zhang Guhua
;;
;; Author: iuyo5678@gmail.com
;; Version: $Id: startup.el,v 0.0 2021/03/15 08:40:43 zhangguhua Exp $
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
;;   (require 'startup)

;;; Code:

;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; Speed up startup
(defvar centaur-gc-cons-threshold (if (display-graphic-p) 16000000 16000000)
  "The default value to use for `gc-cons-threshold'. If you experience freezing,
decrease this. If you experience stuttering, increase this.")

(defvar centaur-gc-cons-upper-limit (if (display-graphic-p) 400000000 100000000)
  "The temporary value for `gc-cons-threshold' to defer it.")

(defvar centaur-gc-timer (run-with-idle-timer 20 t #'garbage-collect)
  "Run garbarge collection when idle 20s.")

(defvar default-file-name-handler-alist file-name-handler-alist)

(defconst sys/win32p
  (eq system-type 'windows-nt)
  "Are we running on a WinTel system?")

(defconst sys/linuxp
  (eq system-type 'gnu/linux)
  "Are we running on a GNU/Linux system?")

(defconst sys/macp
  (eq system-type 'darwin)
  "Are we running on a Mac system?")

(defconst sys/mac-x-p
  (and (display-graphic-p) sys/macp)
  "Are we running under X on a Mac system?")

(defconst sys/mac-ns-p
  (eq window-system 'ns)
  "Are we running on a GNUstep or Macintosh Cocoa display?")

(defconst sys/mac-cocoa-p
  (featurep 'cocoa)
  "Are we running with Cocoa on a Mac system?")

(defconst sys/mac-port-p
  (eq window-system 'mac)
  "Are we running a macport build on a Mac system?")

(defconst sys/linux-x-p
  (and (display-graphic-p) sys/linuxp)
  "Are we running under X on a GNU/Linux system?")

(defconst sys/cygwinp
  (eq system-type 'cygwin)
  "Are we running on a Cygwin system?")


(setq file-name-handler-alist nil)
(setq gc-cons-threshold centaur-gc-cons-upper-limit
      gc-cons-percentage 0.5)
(add-hook 'emacs-startup-hook
          (lambda ()
            "Restore defalut values after startup."
            (setq file-name-handler-alist default-file-name-handler-alist)
            (setq gc-cons-threshold centaur-gc-cons-threshold
                  gc-cons-percentage 0.1)

            ;; GC automatically while unfocusing the frame
            ;; `focus-out-hook' is obsolete since 27.1
            (if (boundp 'after-focus-change-function)
                (add-function :after after-focus-change-function
			      (lambda ()
				(unless (frame-focus-state)
				  (garbage-collect))))
              (add-hook 'focus-out-hook 'garbage-collect))

            ;; Avoid GCs while using `ivy'/`counsel'/`swiper' and `helm', etc.
            ;; @see http://bling.github.io/blog/2016/01/18/why-are-you-changing-gc-cons-threshold/
            (defun my-minibuffer-setup-hook ()
              (setq gc-cons-threshold centaur-gc-cons-upper-limit))

            (defun my-minibuffer-exit-hook ()
              (setq gc-cons-threshold centaur-gc-cons-threshold))

            (add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
            (add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)))

;;;###autoload
(defun eal-define-keys-commonly (keymap key-defs)
  "Execute `define-key' on KEYMAP use arguments from KEY-DEFS.
KEY-DEFS should be one list, every element of it is a list
whose first element is key like argument of `define-key', and second element is command
like argument of `define-key'."
  (dolist (key-def key-defs)
    (when key-def
      (define-key keymap (eval `(kbd ,(car key-def))) (nth 1 key-def)))))


(defmacro define-kbd     (keymap key def) `(define-key ,keymap (kbd ,key) ,def))
(defmacro local-set-kbd  (key command)    `(local-set-key (kbd ,key) ,command))
(defmacro global-set-kbd (key command)    `(global-set-key (kbd ,key) ,command))
(defalias 'apply-define-key 'eal-define-keys-commonly)
(defalias 'define-key-list 'eal-define-keys-commonly)

(defun apply-args-to-fun (fun args)
  "Apply args to function FUN."
  (if (listp args)
      (eval `(,fun ,@args))
    (eval `(,fun ,args))))


(defun update-load-path (&rest _)
  "Update `load-path'."
  (dolist (dir '("site-lisp" "lisp"))
    (push (expand-file-name dir user-emacs-directory) load-path)))

(defcustom centaur-benchmark-init nil
  "Enable the initialization benchmark or not."
  :group 'zgh-person
  :type 'boolean)

(defcustom zgh-icon (display-graphic-p)
  "Display icons or not."
  :group 'zgh-person
  :type 'boolean)

(defcustom zgh-logo (expand-file-name
                     (if (display-graphic-p) "logo.png" "banner.txt")
                     my-emacs-doc-path)
  "Set Centaur logo. nil means official logo."
  :group 'zgh-person
  :type 'string)

;;temp set here
(custom-set-variables
 '(tab-width 4)
 '(indent-tabs-mode nil))

(defun icons-displayable-p ()
  "Return non-nil if `all-the-icons' is displayable."
  (and zgh-icon
       (display-graphic-p)
       (require 'all-the-icons nil t)))

(provide 'zgh-startup)
;;; startup.el ends here
