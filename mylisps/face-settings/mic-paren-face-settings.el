;; -*- Emacs-Lisp -*-

;; Time-stamp: <2010-04-05 22:10:24 Monday by ahei>

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

(defun mic-paren-face-settings ()
  "Face settings for `mic-paren'."
  (set-face-background 'paren-face-match "magenta")
  (set-face-foreground 'paren-face-match "yellow")
  (set-face-background 'paren-face-mismatch "red"))

(eval-after-load "mic-paren"
  `(mic-paren-face-settings))

(provide 'mic-paren-face-settings)
