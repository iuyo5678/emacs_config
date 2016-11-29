;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-05 22:31:54 Monday by ahei>

;; This file is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 3, or (at your option)
;; any later version.

;; This file is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, Inc., 51 Franklin Street, Fifth Floor,
;; Boston, MA 02110-1301, USA.

(defun mode-line-face-settings ()
  "Face settings for `mode-line'.")

(eval-after-load "mode-line-settings"
  '(progn
     (defface mode-line-lines-face
       '((((type tty pc)) :background "red" :foreground "white")
         (t (:background "dark slate blue" :foreground "yellow")))
       "Face used to highlight lines on mode-line.")))

(eval-after-load "faces"
  `(mode-line-face-settings))

(provide 'mode-line-face-settings)
