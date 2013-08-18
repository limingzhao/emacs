(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'blackboard t)

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(cua-mode nil nil (cua-base))
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;; Column width related
(setq-default fill-column 80)
(defun set-frame-width-interactive (arg)
   (interactive "p")
   (set-frame-width (selected-frame) arg))
(defun set-num-window (arg)
  (interactive "p")
  (set-frame-width (selected-frame) (+ (* fill-column arg) (* (- arg 1) 6))))

;; indent
(setq-default c-basic-offset 4
			  tab-width 4
			  indent-tabs-mode nil)

;; tab complete
(require 'smart-tab)
(global-smart-tab-mode 1)

;; go to last change
(require 'goto-last-change)
(autoload 'goto-last-change "goto-last-change" "Set point to the position of the last change." t)
(global-set-key "\C-x\C-\\" 'goto-last-change)

;; tags
;; ctags path here
(setq path-to-ctags "/usr/local/Cellar/ctags/5.8/bin/ctags") 
(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
    (shell-command
     (format "%s -f %s/TAGS -e -R %s" path-to-ctags dir-name (directory-file-name dir-name))))

;; OSX specific, comment out for other OS.
(if (boundp 'osx-key-mode-map)
    (setq hah-key-map osx-key-mode-map)
  (setq hah-key-map global-map))
(define-key hah-key-map [home] 'beginning-of-line)
(define-key hah-key-map [end] 'end-of-line)
(define-key hah-key-map [C-home] 'beginning-of-buffer)
(define-key hah-key-map [C-end] 'end-of-buffer)  
(ignore-errors (x-focus-frame nil))
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)
