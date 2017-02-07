;;; personal-info.el --- 

;; Copyright 2016 zhangguhua
;;
;; Author: zhangguhua@baidu.com
;; Version: $Id: personnal-info.el,v 0.0 2016/02/26 14:52:44 zhangguhua Exp $
;; Keywords: 
;; X-URL: not distributed yet

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.

;;; Commentary:

;; 

;; Put this file into your load-path and the following into your ~/.emacs:
;;   (require 'personnal-info)

;;; Code:

(provide 'personal-info)
(eval-when-compile
  (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

;; 个人信息
(setq user-mail-address "iuyo5678@gmail.com")
(setq user-full-name    "Zhang Guhua")
(setq-default default-directory "~")

;; 代理信息


;; 配置自己的站点信息，可以使用emacs直接写wordpress文章

(setq org2blog/wp-blog-alist
      '(("zghhome"
         :url "https://www.zghhome.cn/xmlrpc.php"
         :username "iuyo5678"
         )))

;;; personal-info.el ends here
