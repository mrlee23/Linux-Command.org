;;; core.el --- Linux Commands core

;; Copyright (C) 2018 Dongsoo Lee

;; Author: Dongsoo Lee <mrlee603@gmail.com>
;; Maintainer: Dongsoo Lee <mrlee603@gmail.com>
;; Created: 2018-02-20 21:18:00
;; 

;;; Commentary:

;; 

;;; Code:

(defvar lc-core/current-contents nil)
(defvar lc-core/current-contents-filename nil)
(defun lc-core/init-contents (filename)
  (setq filename (expand-file-name filename))
  (ignore-errors
	(setq lc-core/current-contents
		  (with-temp-buffer
			(insert-file-contents filename)
			(org-mode)
			(org-element-parse-buffer)
			))
	(setq lc-core/current-contents-filename filename))
  )

(defun lc-core/get-current-contents ()
  (when (and
		 (stringp lc-core/current-contents-filename)
		 (equal lc-core/current-contents-filename buffer-file-name))
	lc-core/current-contents))

(provide 'linux-commands-core)
