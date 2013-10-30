(add-to-list 'load-path "~/.emacs.d")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'blackboard t)

;; (add-to-list 'load-path "~/.emacs.d/icicles")
;; (require 'icicles)
;; (icy-mode 1)

;; (load "~/.emacs.d/nxhtml/autostart.el")
;; ;; we prefer a dark theme, not the default light!
;; (custom-set-faces  ;; M-x customize-group RET mumamo RET
;;  '(mumamo-background-chunk-major ((t (:background "#1c1c1c"))))
;;  '(mumamo-background-chunk-submode1 ((t (:background "#101010"))))
;;  '(mumamo-background-chunk-submode2 ((t (:background "red"))))
;;  )
;; ;; j*sus, mumamo *** SHUT THE F**K UP ***
;; (custom-set-variables '(warning-minimum-level :emergency))

(add-to-list 'auto-mode-alist '("\\.js\\'" . espresso-mode))
(autoload 'espresso-mode "espresso" nil t)

(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
                  (espresso-mode "<script[^>]*>" "</script>")
                  (css-mode "<style[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

;; (require 'web-mode)
;; (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.jsp\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
;; (add-to-list 'auto-mode-alist '("\\.less\\'" . web-mode))
;; (setq web-mode-engines-alist
;;       '(("php"    . "\\.phtml\\'")
;;         ("blade"  . "\\.blade\\."))
;; )
;; (defun web-mode-hook ()
;;   "Hooks for Web mode."
;;   (setq web-mode-markup-indent-offset 2)
;; )
;; (setq web-mode-comment-style 2)
;; (add-hook 'web-mode-hook  'web-mode-hook)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(inhibit-startup-screen t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(set-face-attribute 'default nil :height 130)

(setq make-backup-files nil) ; stop creating those backup~ files
(setq auto-save-default nil) ; stop creating those #autosave# files

;; text width and auto-fill line wrap
(setq-default fill-column 100)
;; (setq default-major-mode 'text-mode)
(setq-default auto-fill-function 'do-auto-fill)
;; frame size related
(if window-system
    (set-frame-size (selected-frame) fill-column 35))
(defun set-frame-width-interactive (arg)
   (interactive "p")
   (set-frame-width (selected-frame) arg))
(defun set-num-window (arg)
  (interactive "p")
  (if (equal arg 1)
      (set-frame-width (selected-frame) fill-column)) ;; fill-column
  (if (equal arg 2)
      (set-frame-width (selected-frame) 206)) ;; fill-column * 2 + 6
  (if (equal arg 3)
      (set-frame-width (selected-frame) 311)) ;; fill-colum * 3 + 11
)
;; indent
(setq-default indent-tabs-mode nil)
;; C hook
(setq c-basic-offset 2)
;; Python hook
(add-hook 'python-mode-hook
          (lambda ()
            (setq python-indent c-basic-offset
                  tab-width c-basic-offset)))
;; Java hook
(add-hook 'java-mode-hook
          (lambda ()
            (setq tab-width c-basic-offset)))
;; Java Script hook
(add-hook 'js-mode-hook 'web-mode)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

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
(when (fboundp 'x-focus-frame) (x-focus-frame nil))
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)
