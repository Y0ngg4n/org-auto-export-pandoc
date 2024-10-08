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


;;; Commentary:
;; This package provides the functionality to automatically export with org-pandoc-export-* modes. It adds a hook to exute it when you save the file. It will look for the following tag:
;; #+auto-export-pandoc: to-markdown
;; You can add the tag muliple times to export to multiple formats:
;; #+auto-export-pandoc: to-markdown
;; #+auto-export-pandoc: to-latex-pdf
;; #+auto-export-pandoc: to-html5

(require ox-pandoc)



;;; Code:

(defun org-auto-export-pandoc ()
  "Exports to the predefined formats in your \"org-mode\" file via pandoc."
  (interactive)
  (when (derived-mode-p 'org-mode)  ;; Check if we are in org-mode
    (save-excursion
      (goto-char (point-min))  ;; Go to the beginning of the buffer
      (while (re-search-forward "^#\\+auto-export-pandoc: \\(.*\\)$" nil t)
        (let ((export-format (match-string 1))) ;;
          (funcall (intern (concat "org-pandoc-export-" export-format))))))))

(add-hook 'after-save-hook 'org-auto-export-pandoc)

(provide 'org-auto-export-pandoc)

;;; org-auto-export-pandoc.el ends here
