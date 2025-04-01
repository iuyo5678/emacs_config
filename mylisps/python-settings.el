;;; python-settings.el --- the python program settings -*- lexical-binding: t -*-

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
  :hook (inferior-python-mode . (lambda ()
                                  (process-query-on-exit-flag
                                   (get-process "Python"))))
  :init
  ;; Disable readline based native completion
  (setq python-shell-completion-native-enable nil)
  (setq python-indent-offset 4
        indent-tabs-mode nil)
  :custom
  (setq-default  python-indent 4
                 default-tab-width 4
                 python-shell-completion-string-code
                 "';'.join(get_ipython().Completer.all_completions('''%s'''))\n")
  :config
  (setq
   python-shell-interpreter "ipython"
   python-shell-interpreter-args "--colors=Linux --profile=default"
   python-shell-prompt-regexp "In \\[[0-9]+\\]: "
   python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
   python-shell-interpreter-args "--simple-prompt -i"
   python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
   )

  ;; Env vars
  (with-eval-after-load 'exec-path-from-shell
    (exec-path-from-shell-copy-env "PYTHONPATH"))
  )


(use-package python-black
  :bind (("C-c b" . python-black-buffer)))

(use-package pyvenv
  :config
  (pyvenv-mode 1))

(use-package anaconda-mode
  :bind (("C-c C-x" . next-error))
  :config
  (require 'pyvenv)
  (add-hook 'python-mode-hook 'anaconda-mode))

;; (use-package company-anaconda
;;   :config
;;   (eval-after-load "company"
;;     '(add-to-list 'company-backends '(company-anaconda :with company-capf))))

(defun uv-activate ()
  "Activate Python environment managed by uv based on current project directory.
Looks for .venv directory in project root and activates the Python interpreter."
  (interactive)
  (let* ((project-root (project-root (project-current t)))
         (venv-path (expand-file-name ".venv" project-root))
         (python-path (expand-file-name
                       (if (eq system-type 'windows-nt)
                           "Scripts/python.exe"
                         "bin/python")
                       venv-path)))
    (if (file-exists-p python-path)
        (progn
          ;; Set Python interpreter path
          (setq python-shell-interpreter python-path)

          ;; Update exec-path to include the venv's bin directory
          (let ((venv-bin-dir (file-name-directory python-path)))
            (setq exec-path (cons venv-bin-dir
                                  (remove venv-bin-dir exec-path))))

          ;; Update PATH environment variable
          (setenv "PATH" (concat (file-name-directory python-path)
                                 path-separator
                                 (getenv "PATH")))

          ;; Update VIRTUAL_ENV environment variable
          (setenv "VIRTUAL_ENV" venv-path)

          ;; Remove PYTHONHOME if it exists
          (setenv "PYTHONHOME" nil)

          (message "Activated UV Python environment at %s" venv-path))
      (error "No UV Python environment found in %s" project-root))))

(use-package ein
  :straight (:host github :repo "millejoh/emacs-ipython-notebook"))

(require 'ein-jupyter)

(defcustom ein:jupyter-uv-server-command "uv"
  "The default command to start a jupyter notebook server.
Changing this to `jupyter-notebook' requires customizing
`ein:jupyter-server-use-subcommand' to nil."
  :group 'ein
  :type 'string)

(defcustom ein:jupyter-uv-server-args '("run" "--with" "jupyter" "jupyter" "notebook" "--no-browser")
  "Add any additional uv command line options."
  :group 'ein
  :type '(repeat string))

;;;###autoload
(defcustom ein:jupyter-uv-server-use-subcommand ""
  "For uv jupyter not add any options."
  :group 'ein
  :type  'string)

(defun ein:jupyter-uv-process-lines (_url-or-port command &rest args)
  "COMMAND use for uv print runtime result.
ARGS comand args \" run --with jupyter jupyter list --json\"
Collect uv run --with jupyter jupyter notebook list --json result."
  (if-let ((found (executable-find command)))
      (with-temp-buffer
        (let ((status (apply #'call-process found nil t nil args)))
          (if (zerop status)
              (progn
                (goto-char (point-min))
                (let (lines)
	              (while (not (eobp))
	                (setq lines (cons (buffer-substring-no-properties
			                           (line-beginning-position)
			                           (line-end-position))
			                          lines))
	                (forward-line 1))
	              lines ))
            (prog1 nil
              (ein:log 'warn "ein:jupyter-process-lines: '%s %s' returned %s"
                       found (ein:join-str " " args) status)))))
    (prog1 nil
      (ein:log 'warn "ein:jupyter-process-lines: cannot find %s" command))))

(defun ein:jupyter-uv-server--run (buf user-cmd dir &optional args)
  (get-buffer-create buf)
  (let* ((cmd (if ein:jupyter-use-containers "docker" user-cmd))
         (vargs (cond (ein:jupyter-use-containers
                       (split-string
                        (format "run --network host -v %s:%s %s %s"
                                dir
                                ein:jupyter-docker-mount-point
                                ein:jupyter-docker-additional-switches
                                ein:jupyter-docker-image)))
                      (t
                       (append (split-string (or ein:jupyter-uv-server-use-subcommand ""))
                               args
                               (let ((copy (cl-copy-list ein:jupyter-uv-server-args)))
                                 (when (ein:debug-p)
                                   (cl-pushnew "--debug" copy :test #'equal))
                                 copy)
                               (when dir
                                 (list (format "--notebook-dir=%s"
                                               (convert-standard-filename dir)))))
                       )))
         (proc (apply #'start-process
                      *ein:jupyter-server-process-name* buf cmd vargs)))
    (ein:log 'info "ein:jupyter-server--run: %s %s" cmd (ein:join-str " " vargs))
    (set-process-query-on-exit-flag proc nil)
    proc))

;;;###autoload
(defun ein:jupyter-uv-crib-running-servers ()
  "Shell out uv  jupyter result for running servers."
  (apply #'ein:jupyter-uv-process-lines nil
         ein:jupyter-uv-server-command
         (append
          '("run" "--with" "jupyter" "jupyter")
          (split-string (or ein:jupyter-server-use-subcommand ""))
          '("list" "--json"))))


(defun ein:jupyter-uv-my-url-or-port ()
  "Get url form uv runtime json result"
  (when-let ((my-pid (aand (ein:jupyter-server-process) (process-id it))))
    (catch 'done
      (dolist (json-obj (ein:jupyter-uv-crib-running-servers))
        ;; 首先解析 JSON 字符串为 Elisp 对象
        (let* ((parsed-json (json-read-from-string json-obj))
               (pid (cdr (assoc 'pid parsed-json)))
               (url (cdr (assoc 'url parsed-json))))
          (throw 'done (ein:url url)))))))

(defun ein:jupyter-uv-crib-token ()
  "Shell out uv jupyter notebook list info.  Return TOKEN"
  (let ((servers (ein:jupyter-uv-crib-running-servers)))
    (when servers
      (let* ((json-obj (car servers))  ;; 获取列表中的第一个元素
             (parsed-json (json-read-from-string json-obj))
             (token (cdr (assoc 'token parsed-json))))
        token))))

(defun ein:jupyter-uv-server-login-and-open (url-or-port &optional callback)
  "URL-OR-PORT the uv juypter server url.
CALLBACK optional after login for callback."
  (if-let ((token (ein:jupyter-uv-crib-token)))
      (ein:notebooklist-login url-or-port callback nil nil token)
    (ein:log 'error "`(ein:notebooklist-token-or-password %s)` must return non-nil"
	         url-or-port)))


(defun ein:jupyter-uv-server-start (server-command
                                    notebook-directory
                                    &optional no-login-p login-callback port)
  "Start SERVER-COMMAND with `--notebook-dir' NOTEBOOK-DIRECTORY.
Login after connection established unless NO-LOGIN-P is set.
LOGIN-CALLBACK takes two arguments, the buffer created by
`ein:notebooklist-open--finish', and the url-or-port argument
of `ein:notebooklist-open*'.
PORT not used.
With \\[universal-argument] prefix arg, prompt the user for the
server command."
  (interactive
   (list (let ((default-command (executable-find ein:jupyter-uv-server-command)))
           (if (and (not ein:jupyter-use-containers)
                    (or current-prefix-arg (not default-command)))
               (let (command result)
                 (while (not (setq
                              result
                              (executable-find
                               (setq
                                command
                                (read-string
                                 (format
                                  "%sServer command: "
                                  (if command
                                      (format "[%s not executable] " command)
                                    ""))
                                 nil nil ein:jupyter-server-command))))))
                 result)
             default-command))
         (let ((default-dir ein:jupyter-default-notebook-directory)
               result)
           (while (or (not result) (not (file-directory-p result)))
             (setq result (read-directory-name
                           (format "%sNotebook directory: "
                                   (if result
                                       (format "[%s not a directory]" result)
                                     ""))
                           default-dir default-dir t)))
           result)
         nil
         (lambda (buffer _url-or-port)
           (pop-to-buffer buffer))
         nil))
  (when (ein:jupyter-server-process)
    (error "ein:jupyter-server-start: First `M-x ein:stop'"))
  (let ((proc (ein:jupyter-uv-server--run *ein:jupyter-server-buffer-name*
                                          server-command
                                          notebook-directory
                                          (when (numberp port)
                                            `("--port" ,(format "%s" port)
                                              "--port-retries" "0")))))
    (cl-loop repeat 30
             until (ein:jupyter-server-ready-p)
             do (sleep-for 0 500)
             finally do
             (if-let ((buffer (get-buffer *ein:jupyter-server-buffer-name*))
                      (url-or-port (ein:jupyter-uv-my-url-or-port)))
                 (with-current-buffer buffer
                   (setq ein:jupyter-server-notebook-directory
                         (convert-standard-filename notebook-directory))
                   (add-hook 'kill-buffer-query-functions
                             (lambda () (or (not (ein:jupyter-server-process))
                                       (ein:jupyter-server-stop t url-or-port)))
                             nil t))
               (ein:log 'warn "Jupyter server failed to start, cancelling operation")))
    (when-let ((login-p (not no-login-p))
               (url-or-port (ein:jupyter-uv-my-url-or-port)))
      (unless login-callback
        (setq login-callback #'ignore))
      (add-function :after (var login-callback)
        (apply-partially (lambda (proc* _buffer url-or-port)
                           (ein:set-process-sentinel proc* url-or-port))
                         proc))
      (ein:jupyter-uv-server-login-and-open
       url-or-port
       login-callback))))

(advice-add 'ein:jupyter-server-start :override #'ein:jupyter-uv-server-start)

(defun ein:jupyter-uv-server-stop (&optional ask-p url-or-port)
  (interactive
   (list t (awhen (ein:get-notebook)
             (ein:$notebook-url-or-port it))))
  (let ((my-url-or-port (ein:jupyter-uv-my-url-or-port))
        (all-p t))
    (dolist (url-or-port
             (if url-or-port (list url-or-port) (ein:notebooklist-keys))
             (prog1 all-p
               (when (and (null (ein:notebooklist-keys))
                          (ein:shared-output-healthy-p))
                 (kill-buffer (ein:shared-output-buffer)))))
      (let* ((gat-dir (alist-get (intern url-or-port)
				                 (awhen (bound-and-true-p ein:gat-urls) it)))
             (my-p (string= url-or-port my-url-or-port))
             (close-p (or (not ask-p)
                          (prog1 (y-or-n-p (format "Close %s?" url-or-port))
                            (message "")))))
        (if (not close-p)
            (setq all-p nil)
          (ein:notebook-close-notebooks
           (lambda (notebook)
             (string= url-or-port (ein:$notebook-url-or-port notebook)))
           t)
          (cl-loop repeat 10
                   until (null (seq-some (lambda (proc)
                                           (cl-search "request curl"
                                                      (process-name proc)))
                                         (process-list)))
                   do (sleep-for 0 500))
          (cond (my-p
                 (-when-let* ((proc (ein:jupyter-server-process))
                              (pid (process-id proc)))
                   (run-at-time 2 nil
                                (lambda ()
                                  (signal-process pid (if (eq system-type 'windows-nt) 9 15))))
                   ;; NotebookPasswordApp::shutdown_server() also ignores req response.
                   (ein:query-singleton-ajax (ein:url url-or-port "api/shutdown")
                                             :type "POST")))
                (gat-dir
                 (with-current-buffer (ein:notebooklist-get-buffer url-or-port)
                   (-when-let* ((gat-chain-args `("gat" nil
                                                  "--project" ,(ein:gat-project)
                                                  "--region" ,(ein:gat-region)
                                                  "--zone" ,(ein:gat-zone)))
                                (now (truncate (float-time)))
                                (gat-log-exec (append gat-chain-args
                                                      (list "log" "--after" (format "%s" now)
							                                "--vendor" (aif (bound-and-true-p ein:gat-vendor) it "aws")
                                                            "--nextunit" "shutdown.service")))
                                (magit-process-popup-time 0))
                     (ein:gat-chain (current-buffer) nil gat-log-exec :notebook-dir gat-dir)
                     ;; NotebookPasswordApp::shutdown_server() also ignores req response.
                     (ein:query-singleton-ajax (ein:url url-or-port "api/shutdown")
                                               :type "POST")))))
          ;; `ein:notebooklist-sentinel' frequently does not trigger
          (ein:notebooklist-list-remove url-or-port)
          (maphash (lambda (k _v) (when (equal (car k) url-or-port)
                               (remhash k *ein:notebook--pending-query*)))
                   *ein:notebook--pending-query*)
          (kill-buffer (ein:notebooklist-get-buffer url-or-port))
          (kill-buffer *ein:jupyter-server-buffer-name*)
          ;;(kill-buffer ein:log-all-buffer-name)
          )))))

(advice-add 'ein:jupyter-server-stop :override #'ein:jupyter-uv-server-stop)


(provide 'python-settings)
;;; python-settings.el ends here
