;; Copyright (C) 2010 ahei

;; Author: ahei <ahei0802@gmail.com>
;; URL: http://code.google.com/p/dea/source/browse/trunk/my-lisps/python-settings.el
;; Time-stamp: <2017-12-19 18:20:32 Tuesday by zhangguhua>

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

;; Python Mode
;; Install: pip install pyflakes autopep8
(use-package python
  :ensure nil
  :hook (inferior-python-mode . (lambda ()
                                  (process-query-on-exit-flag
                                   (get-process "Python"))))
  :init
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  (setq python-indent-offset 4
        python-indent 4
        indent-tabs-mode nil
        default-tab-width 4)
  :config
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--colors=Linux --profile=default"
   ;; python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   ;; python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   ;; python-shell-completion-setup-code
   ;; "from IPython.core.completerlib import module_completion"
   ;; python-shell-completion-module-string-code
   ;; "';'.join(module_completion('''%s'''))\n"
   ;; python-shell-completion-string-code
   ;; "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
   )

  ;; Env vars
  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-env "PYTHONPATH"))

(provide 'python-settings)
