;;; cedet-settings.el ---

;; Copyright 2013 zhangguhua Author: zhangguhua@baidu.com Version:

;;; Code:

(load-file "~/.emacs.d/lisps/cedet-1.1/common/cedet.el")
(global-ede-mode 1)
(global-srecode-minor-mode 1)

(semantic-load-enable-minimum-features)
(semantic-load-enable-code-helpers)
;;(senator-minor-mode t)
;;(semantic-mru-bookmark-mode t)
;;(semantic-idle-summary-mode)
(semantic-load-enable-guady-code-helpers)
;;(semantic-stickyfunc-mode)
;;(semantic-decoration-mode)
(semantic-load-enable-excessive-code-helpers)
(semantic-load-enable-semantic-debugging-helpers)

(require 'semantic-ia)
(require 'semantic-gcc)
(require 'semanticdb)
(global-semanticdb-minor-mode 1)

(require 'semanticdb-global)
(semanticdb-enable-gnu-global-databases 'c-mode)
(semanticdb-enable-gnu-global-databases 'c++-mode)

(semantic-load-enable-primary-exuberent-ctags-support)

;;让cedet找到头文件
(defconst cedet-user-include-dirs
  (list ".." "../include" "../inc" "../common" "../public"
        "../.." "../../include" "../../inc" "../../common" "../../public"))
(require 'semantic-c nil 'noerror)
(let ((include-dirs cedet-user-include-dirs))
 (mapc (lambda (dir)
          (semantic-add-system-include dir 'c++-mode)
          (semantic-add-system-include dir 'c-mode))
        include-dirs))

;;打开代码折叠模式，如果不打开代码折叠模式，折叠代码的指令不可用
(global-semantic-tag-folding-mode 1)

;;快捷键绑定
(global-set-key (kbd "C-c C-j") 'semantic-ia-fast-jump)
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
