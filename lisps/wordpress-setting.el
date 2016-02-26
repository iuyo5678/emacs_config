;;; wordpress-setting.el --- 

;; Copyright 2016 zhangguhua
;;
;; Author: zhangguhua@baidu.com
;; Version: $Id: wordpress-setting.el,v 0.0 2016/02/26 13:41:13 zhangguhua Exp $
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
;;; 我的个人站点的配置信息，不上传


(provide 'wordpress-setting)
(eval-when-compile
    (require 'cl))


;;;;##########################################################################
;;;;  User Options, Variables
;;;;##########################################################################

(setq org2blog/wp-blog-alist
      '(("wordpress"
         :url "https://wordpress/xmlrpc.php"
         :username "account_name"
         ))

;;; wordpress-setting.el ends here
