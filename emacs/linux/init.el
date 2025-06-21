(require 'package)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(package-initialize)

(keyboard-translate ?\C-h ?\C-?)

(require 'mozc)
(set-language-environment "Japanese")
(setq default-input-method "japanese-mozc")

(prefer-coding-system 'utf-8)

(setq truncate-lines t)

;;(global-linum-mode t) ; deprecated
(global-display-line-numbers-mode t)

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
(set-frame-parameter (selected-frame) 'alpha '(90 . 90))

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


(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)
(add-hook 'haskell-mode-hook 'imenu-add-menubar-index)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(haskell-indent-after-keywords
   '(("where" 4 0) ("of" 4) ("do" 4) ("mdo" 4) ("rec" 4) ("in" 4 0)
     ("{" 4) "if" "then" "else" "let"))
 '(haskell-indent-offset 4)
 '(haskell-indent-spaces 4)
 '(package-selected-packages
   '(cmake-mode csharp-mode cuda-mode markdown-mode mozc
                rainbow-delimiters shader-mode))
 '(verilog-align-ifelse nil)
 '(verilog-auto-delete-trailing-whitespace t)
 '(verilog-auto-inst-param-value t)
 '(verilog-auto-inst-vector nil)
 '(verilog-auto-lineup 'all)
 '(verilog-auto-newline nil)
 '(verilog-auto-save-policy nil)
 '(verilog-auto-template-warn-unused t)
 '(verilog-case-indent 4)
 '(verilog-cexp-indent 0)
 '(verilog-highlight-grouping-keywords t)
 '(verilog-highlight-modules t)
 '(verilog-indent-level 4)
 '(verilog-indent-level-behavioral 4)
 '(verilog-indent-level-declaration 4)
 '(verilog-indent-level-module 4)
 '(verilog-tab-to-comment nil))

;; ビープ音を消す
(setq ring-bell-function 'ignore)


;; 行番号の右に縦棒を入れる
(setq linum-format "%4d\u2502")

;; .h ファイルを C++ モードで開く
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

; roslaunch highlighting
(add-to-list 'auto-mode-alist '("\\.launch$" . xml-mode))

; gazebo world file highlighting
(add-to-list 'auto-mode-alist '("\\.world$" . xml-mode))



(setq vhdl-basic-offset 4)

;; Disable world completion with tab key
(setq vhdl-intelligent-tab nil)

;; fix indenting so that code looks like this:
;;
;;   port (
;;     input in : std_logic;
;;   );
;;
;; instead of like this:
;;
;;   port (
;;     input in : std_logic;
;;     );
;;
(defun vhdl-mode-indent-fix ()
  (vhdl-set-offset 'arglist-close '0)
  )
(add-hook 'vhdl-mode-hook 'vhdl-mode-indent-fix)




;; (require 'rainbow-delimiters)
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(default ((t (:family "Ricty" :foundry "PfEd" :slant normal :weight normal :height 143 :width normal)))))



(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
