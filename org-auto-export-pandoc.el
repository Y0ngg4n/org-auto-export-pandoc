;;; org-auto-pandoc.el --- Support for the Foo programming language  -*- lexical-binding: t; -*-

;; Copyright (C) 2010-2021 Yonggan also known as y0ngg4n


;; Author: Yonggan <yonggan@obco.pro>
;; Maintainer: Yonggan <yonggan@obco.pro>
;; Created: 05.10.2024

;; Keywords: languages
;; URL: https://example.com/foo

;; This file is not part of GNU Emacs.

;; This file is free software…
…
;; along with this file.  If not, see <https://www.gnu.org/licenses/>.

;; Package-Requires: (ox-pandoc)

(require ox-pandoc)



(defun org-auto-export-pandoc ()
  (interactive)
  (when (derived-mode-p 'org-mode)  ;; Check if we are in org-mode
    (save-excursion
      (goto-char (point-min))  ;; Go to the beginning of the buffer
      (if (re-search-forward "^#\\+auto-export-pandoc: \\(.*\\)$" nil t)
          (funcall (intern (concat "org-pandoc-export-" (match-string 1))))))))

(add-hook 'after-save-hook 'org-auto-export-pandoc)
