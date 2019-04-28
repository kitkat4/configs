(require 'package)

(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/"))
(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
(package-initialize)

(keyboard-translate ?\C-h ?\C-?)

;; (require 'mozc)
;; (set-language-environment "Japanese")
;; (setq default-input-method "japanese-mozc")

(prefer-coding-system 'utf-8)

(setq truncate-lines t)

(global-linum-mode t)

(line-number-mode t)
(column-number-mode t)

(setq make-backup-files nil)
(setq auto-save-default nil)

;; (require 'tabbar)
;; (tabbar-mode)

(setq scroll-preserve-screen-position t)

(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)

(setq next-screen-context-lines 1)

(setq inhibit-startup-message t)
(setq inhibit-startup-echo-area-message -1)

(setq custom-theme-directory "~/.emacs.d/themes")

;; (load-theme 'manoj-dark' t)
(load-theme 'my-manoj-dark' t)

(setq-default tab-width 4)

(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset tab-width)

;; 背景を半透明に
(set-frame-parameter (selected-frame) 'alpha '(85 . 50))

(add-hook 'c++-mode-hook
	  '(lambda()
	     (c-set-style "stroustrup")
	     (show-paren-mode t)
	     (c-set-offset 'innamespace 0)
	     (c-set-offset 'arglist-close 0)
	     ))

(add-hook 'c-mode-hook
	  '(lambda()
	     (c-set-style "stroustrup")
	     (show-paren-mode t)
	     (c-set-offset 'innamespace 0)
	     (c-set-offset 'arglist-close 0)
	     ))

(add-hook 'matlab-mode-hook
	  '(lambda()
	     (auto-fill-mode 0)))


;; 行番号の右に縦棒を入れる
(setq linum-format "%4d\u2502")

;; .h ファイルを C++ モードで開く
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))


;; (require 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; (set-face-attribute 'default nil
;;                     :family "Ricty"
;;                     :height 128)
;; (set-fontset-font
;;  nil 'japanese-jisx0208
;;  (font-spec :family "Ricty"))
