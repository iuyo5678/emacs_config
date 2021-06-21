;; -*- Emacs-Lisp -*-
;; Time-stamp: <2013-09-06 00:05:55 Friday by zhangguhua>

(use-package template
  :ensure nil
  :defer t
  :bind (
	 ("C-c T" . my-template-expand-template)
	 ("C-c C-t" . template-expand-template)
	 )
  :config
  (defun template-settings ()
    "settings for `template'."
    (setq template-default-directories (list (concat my-emacs-path "/templates/")))

    (defvar last-template nil "最近使用的模版文件")

    (defun my-template-expand-template (template)
      "展开template的模版文件"
      (interactive
       (list
	(read-file-name
	 (if last-template (format "请指定模版文件(缺省为%s): " last-template) "请指定模版文件: ")
	 (concat my-emacs-path "templates") last-template t)))
      (template-expand-template template)
      (setq last-template template)))
  (template-settings)
  )

(provide 'template-settings)
