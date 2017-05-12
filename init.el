;;;cask
(require 'cask "~/.cask/cask.el")
(cask-initialize)

;;;package-list-packagesでインストールした場合の設定
(package-initialize)
;;;(require 'helm-config)
;;;js2-modeの設定
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(require 'helm-config)
(helm-mode 1)
;;;helm find-fileを戻す
;;;(add-to-list 'helm-completing-read-handlers-alist '(find-file . nil))
;;;tabの補完
;;;(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)




;;;行番号表示
(require 'linum)
(global-linum-mode 1)
(global-set-key "\C-x\C-q" 'linum-mode)
(setq linum-format "%4d ")

(require 'cask "~/.cask/cask.el")
(cask-initialize)

(add-hook 'after-init-hook #'global-flycheck-mode)


;;保存時に行末のスペースを削除．文末の改行は削除しない
(require 'whitespace)
(set-face-foreground 'whitespace-space "DarkGoldenrod1")
(set-face-background 'whitespace-space nil)
(set-face-bold-p 'whitespace-space t)
(setq whitespace-style '(tabs           ; タブ
			 trailing       ; 行末
			 spaces         ; スペース
			 space-mark     ; 表示のマッピング
			 ;;                         tab-mark
			 ))
(setq whitespace-action '(auto-cleanup))
(global-whitespace-mode 1)

;;全角のスペースを目立たせる 　　<-こんな感じ
(setq whitespace-space-regexp "\\(\x3000+\\)")
(setq whitespace-display-mappings
      '((space-mark ?\x3000 [?\□])
	(tab-mark   ?\t   [?\xBB ?\t])
	))

;; undoの履歴をウィンドウを閉じても保持する
(when (require 'undohist nil t)
  (undohist-initialize))

;; undoの樹形図を表示する C-x u
(when (require 'undo-tree nil t)
  (global-undo-tree-mode))

;; 問い合わせを簡略化 yes/no を y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; スタートアップページを表示しない
(setq inhibit-startup-message t)
(server-start)

;; バックアップファイルを作らない
(setq backup-inhibited t)
(setq make-backup-files nil)
;; 終了時にオートセーブファイルを消す
(setq delete-auto-save-files t)


;;対応する括弧を挿入
(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair)))

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(require 'json-mode)
(add-to-list 'auto-mode-alist '("\\.json$" . json-mode))
(add-to-list 'auto-mode-alist '("\\.template$" . json-mode))

