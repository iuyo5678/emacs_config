;; -*- Emacs-Lisp -*-

;; Time-stamp: <2019-07-23 00:46:17 Tuesday by zhangguhua>

(am-def-active-fun linum-mode linum-mode-active)


;; 在mode-line上用彩色显示当前buffer行数
(defun get-lines-4-mode-line ()
  (let ((lines (count-lines (point-min) (point-max))))
    (concat (propertize
             (format "%dL" lines)
             'mouse-face 'mode-line-highlight
             'help-echo (format "%d lines" lines)) " ")))

(defun get-size-indication-format ()
  (if (and transient-mark-mode mark-active)
      (format "%dLs %dCs" (count-lines (region-beginning) (region-end)) (abs (- (mark t) (point))))
    "%I"))

(defun get-mode-line-region-face ()
  (and transient-mark-mode mark-active
       (if window-system 'region 'region-invert)))


(size-indication-mode 1)
(setq-default mode-line-buffer-identification (propertized-buffer-identification "%b"))

(setq-default
 mode-line-position
 `((:eval (get-lines-4-mode-line))
   (:propertize
    "%p"
    'local-map mode-line-column-line-number-mode-map
    'mouse-face 'mode-line-highlight
    'help-echo "Size indication mode\n\
mouse-1: Display Line and Column Mode Menu")
   ;; 当选中一块区域后, 会高亮显示这个区域有多少个字符, 没有选中区域的时候, 则显示当前buffer的大小
   (size-indication-mode
    (" "
     (:eval
      (propertize (get-size-indication-format)
                  'face (and transient-mark-mode mark-active (get-mode-line-region-face))
                  'local-map mode-line-column-line-number-mode-map
                  'mouse-face 'mode-line-highlight
                  'help-echo "Buffer position, mouse-1: Line/col menu"))))
   (:eval
    ;; 当显示行号已经打开时, 则不在mode-line上显示行号
    (if (and line-number-mode (not (linum-mode-active)))
        (if column-number-mode
            (propertize
             " (%l,%c)"
             'local-map mode-line-column-line-number-mode-map
             'mouse-face 'mode-line-highlight
             'help-echo "Line number and Column number\n\
mouse-1: Display Line and Column Mode Menu")
          (propertize
           " L%l"
           'local-map mode-line-column-line-number-mode-map
           'mouse-face 'mode-line-highlight
           'help-echo "Line Number\n\
mouse-1: Display Line and Column Mode Menu"))
      (if column-number-mode
          (propertize
           " C%c"
           'local-map mode-line-column-line-number-mode-map
           'mouse-face 'mode-line-highlight
           'help-echo "Column number\n\
mouse-1: Display Line and Column Mode Menu"))))))

(setq mode-line-format-bak mode-line-format)
(setq mode-line t)

(defun toggle-mode-line ()
  "Toggle mode-line."
  (interactive)
  (if mode-line
      (setq-default mode-line-format nil)
    (setq-default mode-line-format mode-line-format-bak))
  (setq mode-line (not mode-line)))

;; 方便的切换major mode
(defvar switch-major-mode-last-mode nil)

(defun major-mode-heuristic (symbol)
  (and (fboundp symbol)
       (string-match ".*-mode$" (symbol-name symbol))))

(defun switch-major-mode (mode)
  "切换major mode"
  (interactive
   (let ((fn switch-major-mode-last-mode) val)
     (setq val
           (completing-read
            (if fn (format "切换major-mode为(缺省为%s): " fn) "切换major mode为: ")
            obarray 'major-mode-heuristic t nil nil (symbol-name fn)))
     (list (intern val))))
  (let ((last-mode major-mode))
    (funcall mode)
    (setq switch-major-mode-last-mode last-mode)))
(global-set-key (kbd "C-x q") 'switch-major-mode)


(defun get-mode-name ()
  "显示`major-mode'及`mode-name'"
  (interactive)
  (message "major-mode为%s, mode-name为%s" major-mode mode-name))
(global-set-key (kbd "C-x m") 'get-mode-name)

;; 在状态栏显示日期时间
(setq display-time-day-and-date t)
(display-time)


;; 在标题栏显示登陆名称和文件名
(setq frame-title-format
      '((:eval
         (let ((login-name (getenv-internal "LOGNAME")))
           (if login-name (concat login-name "@") "")))
        (:eval (system-name))
        ":"
        (:eval (or (buffer-file-name) (buffer-name)))))

(provide 'mode-line-settings)
