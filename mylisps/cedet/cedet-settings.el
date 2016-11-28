;;; cedet-settings.el ---

;; Copyright 2013 zhangguhua Author: zhangguhua@baidu.com Version:

;;; Code:
(require 'cedet)
(require 'cedet-eieio-settings)
(require 'cedet-ede-settings)
(require 'cedet-cogre-settings)
(require 'cedet-semantic-settings)
(require 'cedet-srecode-settings)
(require 'cedet-speedbar-settings)




;; 用pulse实现Emacs的淡入淡出效果
;; http://emacser.com/pulse.htm
(require 'pulse-settings)

;;;###autoload
(defun cedet-settings-4-info ()
  "`cedet' settings for `info'."
  (info-initialize)
  (dolist (package `("cogre" "common" "ede" "eieio" "semantic/doc" "speedbar" "srecode"))
    (add-to-list 'Info-directory-list (concat my-emacs-lisps-path "cedet/" package "/"))))

(eval-after-load "info"
  `(cedet-settings-4-info))




;;让cedet找到头文件
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(let ((include-dirs cedet-user-include-dirs))
 (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;;打开代码折叠模式，如果不打开代码折叠模式，折叠代码的指令不可用
(global-semantic-tag-folding-mode 1)

;;快捷键绑定
(global-set-key (kbd "C-c -") 'semantic-tag-folding-fold-block)
(global-set-key (kbd "C-c =") 'semantic-tag-folding-show-block)

(global-set-key (kbd "C-_") 'semantic-tag-folding-fold-all)
(global-set-key (kbd "C-+") 'semantic-tag-folding-show-all)


(global-set-key (kbd "C-c B")
                (lambda ()
                  (interactive)
                  (if (ring-empty-p (oref semantic-mru-bookmark-ring ring))
                      (error "Semantic Bookmark ring is currently empty"))
                  (let* ((ring (oref semantic-mru-bookmark-ring ring))
                         (alist (semantic-mrub-ring-to-assoc-list ring))
                         (first (cdr (car alist))))
                    (if (semantic-equivalent-tag-p (oref first tag)
                                                   (semantic-current-tag))
                        (setq first (cdr (car (cdr alist)))))
                    (semantic-mrub-switch-tags first))))

(global-set-key (kbd "C-c d") 'semantic-analyze-proto-impl-toggle)
(global-set-key (kbd "<f5>")  'sr-speedbar-toggle)
;; if you want to enable support for gnu global
(when (cedet-gnu-global-version-check t)
    (semanticdb-enable-gnu-global-databases 'c-mode)
      (semanticdb-enable-gnu-global-databases 'c++-mode))

;; enable ctags for some languages:
;;  Unix Shell, Perl, Pascal, Tcl, Fortran, Asm
(when (cedet-ectag-version-check)
    (semantic-load-enable-primary-exuberent-ctags-support))


(provide 'cedet-settings)


;;; template.el ends here
