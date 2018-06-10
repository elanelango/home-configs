(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)


 (defconst user-init-dir
  (cond ((boundp 'user-emacs-directory)
         user-emacs-directory)
        ((boundp 'user-init-directory)
         user-init-directory)
        (t "~/.emacs.d/")))


(defun load-user-file (file)
  (interactive "f")
  "Load a file in current user's configuration directory"
  (load-file (expand-file-name file user-init-dir)))


(load-user-file "emacs-stuff.el")

;; Install packages
(unless package-archive-contents
  (package-refresh-contents))
(package-install-selected-packages)


(load-user-file "elget-stuff.el")
(load-user-file "term-stuff.el")
(load-user-file "elscreen-stuff.el")
;; (load-user-file "python-stuff.el")


;; evil mode
;; Make C-u to scroll up
(setq evil-want-C-u-scroll t)
(require 'evil)

;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 0.5)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

(evil-mode 1)

;; powerline
(require 'powerline)
(powerline-center-evil-theme)

;; magit
(global-set-key (kbd "C-x g") 'magit-status)

;;auto-complete
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-1.5.1/dict/")
(ac-config-default)
(require 'auto-complete)
(global-auto-complete-mode t)

;;yasnippet
(require 'yasnippet)

;; enable flycheck
(require 'flycheck)

;; Enable flycheck globally
(add-hook 'after-init-hook #'global-flycheck-mode)
