;; -*- Emacs-Lisp -*-

;; Time-stamp: <2018-09-13 19:25:13 Thursday by drakezhang>

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

(when window-system
  (copy-face 'region 'region-invert)
  (invert-face 'region-invert))

(defun get-mode-line-region-face ()
  (and transient-mark-mode mark-active
       (if window-system 'region 'region-invert)))

(size-indication-mode 1)
(setq-default mode-line-buffer-identification (propertized-buffer-identification "%b"))

(if is-after-emacs-23
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
  (let* ((help-echo "mouse-1: select (drag to resize), mouse-2 = C-x 1, mouse-3 = C-x 0"))
    (setq-default
     mode-line-position
     `((:eval (get-lines-4-mode-line))
       (:propertize "%p" 'help-echo ,help-echo)
       (size-indication-mode
        (" " (:eval (propertize
                     (get-size-indication-format) 'help-echo ,help-echo
                     'face (and transient-mark-mode mark-active (get-mode-line-region-face))))))
       (:eval
        (if (and line-number-mode (not (linum-mode-active)))
            (if column-number-mode
                (propertize " (%l,%c)" 'help-echo ,help-echo)
              (propertize " L%l" 'help-echo ,help-echo))
          (if column-number-mode
                  (propertize " C%c" 'help-echo ,help-echo))))))))

(setq mode-line-format-bak mode-line-format)
(setq mode-line t)

(defun toggle-mode-line ()
  "Toggle mode-line."
  (interactive)
  (if mode-line
      (setq-default mode-line-format nil)
    (setq-default mode-line-format mode-line-format-bak))
  (setq mode-line (not mode-line)))

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
