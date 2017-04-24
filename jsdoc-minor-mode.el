;;; jsdoc-minor-mode.el --- Add JSDoc support to any file
;;; Commentary:
;;; Code:

(require 'regexp-opt)
(require 'faces)

(defgroup jsdoc nil
  "Minor mode for highlighting jsdoc tags."
  :prefix "jsdoc-minor-"
  :group 'help
  :link '(url-link "http://github.com/nhunzaker/jsdoc-minor-mode"))

(defface jsdoc-tags-face
  '((t :inherit 'font-lock-keyword-face))
  "Face for warning."
  :group 'web-mode-faces)

(defun jsdoc-tags-font-lock-keywords ()
  "JSDoc tags to highlight."
  (list (list (regexp-opt '("@flow" "@constructor" "@abstract" "@access"
  "@alias" "@augments" "@author" "@borrows" "@callback" "@class"
  "@classdesc" "@constant" "@constructs" "@constant" "@copyright"
  "@default" "@deprecated" "@description" "@enum" "@event" "@example"
  "@exports" "@external" "@file" "@fileoverview" "@fires" "@function" "@global"
  "@ignore" "@implements" "@inheritdoc" "@inner" "@instance"
  "@interface" "@kind" "@lends" "@license" "@listens" "@member"
  "@memberof" "@mixies" "@mixin" "@module" "@name" "@namespace"
  "@override" "@param" "@private" "@property" "@protected" "@public"
  "@readyonly" "@requires" "@returns" "@see" "@since" "@static"
  "@summary" "@this" "@throws" "@todo" "@tutorial" "@type" "@typedef"
  "@variation" "@version" "@link" "@tutorial"))
	      0 (quote 'jsdoc-tags-face) 'prepend)))

(defun jsdoc-tags-turn-on ()
  "Turn on syntax highlighting for tags."
  (font-lock-add-keywords nil (jsdoc-tags-font-lock-keywords) t))

(defun jsdoc-tags-turn-off ()
  "Turn on warnings for passive voice."
  (font-lock-remove-keywords nil (jsdoc-tags-font-lock-keywords)))

(defun jsdoc-turn-on ()
  "Turn on jsdoc-minor-mode."
  (make-local-variable 'font-lock-keywords-case-fold-search)
  (setq font-lock-keywords-case-fold-search t)
  (jsdoc-tags-turn-on))

(defun jsdoc-turn-off ()
  "Turn off jsdoc-minor-mode."
  (jsdoc-tags-turn-off))

(define-minor-mode jsdoc-minor-mode
  "Highlight JSDoc tags within comments."
  :lighter " JSDoc"
  (progn
    (if jsdoc-minor-mode
        (jsdoc-turn-on)
      (jsdoc-turn-off))
    (font-lock-mode 1)))

(provide 'jsdoc-minor-mode)
;;; jsdoc-minor-mode.el ends here
