;;; Commentary:
;;
;; Calendar configuration.
;;

;;; Code:

;; Chinese calendar
;; `pC' can show lunar details
(when centaur-chinese-calendar
  (use-package cal-china-x
    :after calendar
    :commands cal-china-x-setup
    :init (cal-china-x-setup)
    :config
    ;; Holidays
    (setq calendar-mark-holidays-flag t
          cal-china-x-important-holidays cal-china-x-chinese-holidays
          cal-china-x-general-holidays '((holiday-lunar 1 15 "元宵节")
                                         (holiday-lunar 7 7 "七夕节")
                                         (holiday-fixed 3 8 "妇女节")
                                         (holiday-fixed 3 12 "植树节")
                                         (holiday-fixed 5 4 "青年节")
                                         (holiday-fixed 6 1 "儿童节")
                                         (holiday-fixed 9 10 "教师节"))
          holiday-other-holidays '((holiday-fixed 2 14 "情人节")
                                   (holiday-fixed 4 1 "愚人节")
                                   (holiday-fixed 12 25 "圣诞节")
                                   (holiday-float 5 0 2 "母亲节")
                                   (holiday-float 6 0 3 "父亲节")
                                   (holiday-float 11 4 4 "感恩节"))
          calendar-holidays (append cal-china-x-important-holidays
                                    cal-china-x-general-holidays
                                    holiday-other-holidays))))

(provide 'calendar)
