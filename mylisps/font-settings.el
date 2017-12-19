1;; -*- Emacs-Lisp -*-

;; Time-stamp: <2017-02-21 14:33:37 Tuesday by wls81>

;; Fonts setting
;; 设置两个字体变量，一个中文的一个英文的
;; 之所以两个字体大小是因为有的中文和英文相同字号的显示大小不一样，需要手动调整一下。
(setq cjk-font-size 18)
(setq ansi-font-size 18)

(defun set-font()
    (interactive)
    (create-fontset-from-fontset-spec
     (concat
      "-*-fixed-medium-r-normal-*-*-*-*-*-*-*-fontset-myfontset,"
;;      (format "ascii:-outline-Consolas-normal-normal-normal-mono-%d-*-*-*-c-*-iso8859-1," ansi-font-size)
;;      (format "unicode:-microsoft-Microsoft YaHei-normal-normal-normal-*-%d-*-*-*-*-0-iso8859-1," cjk-font-size)
;;      (format "chinese-gb2312:-microsoft-Microsoft YaHei-normal-normal-normal-*-%d-*-*-*-*-0-iso8859-1," cjk-font-size)
      ;; (format "unicode:-outline-文泉驿等宽微米黑-normal-normal-normal-sans-*-*-*-*-p-*-gb2312.1980-0," cjk-font-size)
      ;; (format "chinese-gb2312:-outline-文泉驿等宽微米黑-normal-normal-normal-sans-*-*-*-*-p-*-gb2312.1980-0," cjk-font-size)
      )))


;; 函数字体增大，每次增加2个字号，最大48号
(defun increase-font-size()
    "increase font size"
    (interactive)
    (if (< cjk-font-size 48)
            (progn
                (setq cjk-font-size (+ cjk-font-size 2))
                (setq ansi-font-size (+ ansi-font-size 2))))
    (message "cjk-size:%d pt, ansi-size:%d pt" cjk-font-size ansi-font-size)
    (set-font)
    (sit-for .5))

;; 函数字体增大，每次减小2个字号，最小2号
(defun decrease-font-size()
    "decrease font size"
    (interactive)
    (if (> cjk-font-size 2)
            (progn 
                (setq cjk-font-size (- cjk-font-size 2))
                (setq ansi-font-size (- ansi-font-size 2))))
    (message "cjk-size:%d pt, ansi-size:%d pt" cjk-font-size ansi-font-size)
    (set-font)
    (sit-for .5))

;; 恢复成默认大小16号
(defun default-font-size()
    "default font size"
    (interactive)
    (setq cjk-font-size 18)
    (setq ansi-font-size 18)
    (message "cjk-size:%d pt, ansi-size:%d pt" cjk-font-size ansi-font-size)
    (set-font)
    (sit-for .5))

;; 只在GUI情况下应用字体。Console时保持终端字体。
(if window-system
        (progn
            (set-font)
            ;; 把上面的字体集设置成默认字体
            ;; 这个字体名使用是create-fontset-from-fontset-spec函数的第一行的最后两个字段
            (set-frame-font "fontset-myfontset")

            ;; 鼠标快捷键绑定
            (global-set-key '[C-wheel-up] 'increase-font-size)
            (global-set-key '[C-wheel-down] 'decrease-font-size)
            ;; 键盘快捷键绑定
            (global-set-key (kbd "C--") 'decrease-font-size) ;Ctrl+-
            (global-set-key (kbd "C-0") 'default-font-size) ;Ctrl+0
            (global-set-key (kbd "C-=") 'increase-font-size) ;Ctrl+=
            ))

(provide 'font-settings)
