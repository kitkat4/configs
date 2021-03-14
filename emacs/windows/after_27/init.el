(package-initialize)

(require 'package)
(add-to-list 'package-archives
            '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives
            '("marmalade" . "http://marmalade-repo.org/packages/"))




;; (set-language-environment "UTF-8") ;; UTF-8 でも問題ないので適宜コメントアウトしてください
(set-language-environment "Japanese")
(set-default-coding-systems 'utf-8)

;; (when (locate-library "w32-ime")
;;     (progn
;;       (w32-ime-initialize)
;;       (setq default-input-method "W32-IME")
;;       (setq-default w32-ime-mode-line-state-indicator "[--]")
;;       (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
;;       ))

;; tr-imeのDLLを自動でダウンロードしてくれる 
(tr-ime-advanced-install)
(setq default-input-method "W32-IME")

;; IM のデフォルトを IME に設定
(setq default-input-method "W32-IME")
;; IME のモードライン表示設定
(setq-default w32-ime-mode-line-state-indicator "[--]")
(setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))

;; IME 初期化
(w32-ime-initialize)

;; IME 制御（yes/no などの入力の時に IME を off にする）
(wrap-function-to-control-ime 'universal-argument t nil)
(wrap-function-to-control-ime 'read-string nil nil)
(wrap-function-to-control-ime 'read-char nil nil)
(wrap-function-to-control-ime 'read-from-minibuffer nil nil)
(wrap-function-to-control-ime 'y-or-n-p nil nil)
(wrap-function-to-control-ime 'yes-or-no-p nil nil)
(wrap-function-to-control-ime 'map-y-or-n-p nil nil)

;; IME の未確定文字列のフォント設定
(set-frame-font "Meiryo UI-12" nil t)
(modify-all-frames-parameters '((ime-font . "Meiryo UI-12")))

;; (setq default-input-method "W32-IME")
;; (setq-default w32-ime-mode-line-state-indicator "[--]")
;; (setq w32-ime-mode-line-state-indicator-list '("[--]" "[あ]" "[--]"))
;; (w32-ime-initialize)


;; ;; 日本語入力時にカーソルの色を変える設定 (色は適宜変えてください)
;; (add-hook 'w32-ime-on-hook '(lambda () (set-cursor-color "coral4")))
;; (add-hook 'w32-ime-off-hook '(lambda () (set-cursor-color "black")))

;; ;; 以下はお好みで設定してください
;; ;; 全てバッファ内で日本語入力中に特定のコマンドを実行した際の日本語入力無効化処理です
;; ;; もっと良い設定方法がありましたら issue などあげてもらえると助かります

;; ;; ミニバッファに移動した際は最初に日本語入力が無効な状態にする
;; (add-hook 'minibuffer-setup-hook 'deactivate-input-method)

;; ;; isearch に移行した際に日本語入力を無効にする
;; (add-hook 'isearch-mode-hook '(lambda ()
;;                                 (deactivate-input-method)
;;                                 (setq w32-ime-composition-window (minibuffer-window))))
;; (add-hook 'isearch-mode-end-hook '(lambda () (setq w32-ime-composition-window nil)))

;; ;; helm 使用中に日本語入力を無効にする
;; (advice-add 'helm :around '(lambda (orig-fun &rest args)
;;                              (let ((select-window-functions nil)
;;                                    (w32-ime-composition-window (minibuffer-window)))
;;                                (deactivate-input-method)
;;                                (apply orig-fun args))))



;; バッファ中の行番号表示
(global-linum-mode t)

;; 行番号のフォーマット
(set-face-attribute 'linum nil :height 0.8)
(setq linum-format "%4d ")

;; スクロール行数（一行ごとのスクロール）
(setq scroll-conservatively 35)
(setq scroll-margin 0)
(setq scroll-step 1)

;; 画面スクロール時の重複行数
(setq next-screen-context-lines 1)

;; 起動メッセージの非表示
(setq inhibit-startup-message t)

;; スタートアップ時のエコー領域メッセージの非表示
(setq inhibit-startup-echo-area-message -1)

;; 変更ファイルのバックアップ
(setq make-backup-files nil)

;(require 'tabbar)
;(tabbar-mode)

(setq custom-theme-directory "~/.emacs.d/themes")
(load-theme 'my-manoj-dark' t)



(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset tab-width)


(keyboard-translate ?\C-h ?\C-?)


;; C++ style
(add-hook 'c++-mode-hook
          '(lambda()
             (c-set-style "stroustrup")  ;;スタイルはストラウストラップ             
             (show-paren-mode t)        ;;カッコを強調表示する
             (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
             (c-set-offset 'arglist-close 0)   ; 関数の引数リストの閉じ括弧はインデントしない
             ))

;; C style
(add-hook 'c-mode-common-hook
          '(lambda()
             (c-set-style "stroustrup")                  ;;スタイルはストラウストラップ
             (show-paren-mode t)                         ;;カッコを強調表示する
             (c-set-offset 'innamespace 0)   ; namespace {}の中はインデントしない
             (c-set-offset 'arglist-close 0)   ; 関数の引数リストの閉じ括弧はインデントしない
             ))

(setq ring-bell-function 'ignore)



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages '(tr-ime tabbar rainbow-delimiters csharp-mode cdb ccc))
 '(verilog-align-ifelse nil)
 '(verilog-auto-delete-trailing-whitespace t)
 '(verilog-auto-inst-param-value t)
 '(verilog-auto-inst-vector nil)
 '(verilog-auto-lineup 'all)
 '(verilog-auto-newline nil)
 '(verilog-auto-save-policy nil)
 '(verilog-auto-template-warn-unused t)
 '(verilog-case-indent 4)
 '(verilog-cexp-indent 4)
 '(verilog-highlight-grouping-keywords t)
 '(verilog-highlight-modules t)
 '(verilog-indent-level 4)
 '(verilog-indent-level-behavioral 4)
 '(verilog-indent-level-declaration 4)
 '(verilog-indent-level-module 4)
 '(verilog-tab-to-comment nil))

;; rainbow-delimiters を使うための設定
;(require 'rainbow-delimiters)
;(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)

(set-frame-font "Ricty 12" nil t)


;(custom-set-variables
; '(package-selected-packages (quote (csharp-mode tabbar rainbow-delimiters))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
