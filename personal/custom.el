;;; custom.el --- Personal Emacs configuration stuff

;;; Commentary:

;;; Code:

(require 'prelude-packages)

;; Packages ================================================

;; elpy
(prelude-require-packages '(elpy))
(require 'elpy)
(elpy-enable)
(elpy-use-ipython)
(elpy-clean-modeline)

;; helm-git-grep
(prelude-require-packages '(helm-git-grep))

;; multi-term
(prelude-require-packages '(multi-term))

;; jabber
(prelude-require-packages '(jabber))

;; Global keys =============================================

;; Function keys
(global-set-key (kbd "<f6>") 'next-error)
(global-set-key (kbd "S-<f6>") 'previous-error)
(global-set-key (kbd "<f7>") 'recompile)
(global-set-key (kbd "C-x <f7>") 'compile)
(global-set-key (kbd "<f8>") 'multi-term)
(global-set-key (kbd "<f9>") 'speedbar)

;; Revert to default C-a behavior
(global-set-key
 [remap move-beginning-of-line] 'move-beginning-of-line)

;; ace-jump-mode
(define-key global-map (kbd "C-c SPC") 'ace-jump-mode)
(define-key global-map (kbd "C-x SPC") 'ace-jump-mode-pop-mark)

;; helm
;;(global-set-key (kbd "C-c h") 'helm-mini)
(global-set-key (kbd "C-c C-<SPC>") 'helm-all-mark-rings)
;;(global-set-key (kbd "M-x") 'helm-M-x)

;; helm-git-grep
(global-set-key (kbd "C-c C-g") 'helm-git-grep-at-point)
;; helm-git-grep - Invoke `helm-git-grep' from isearch.
(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
;; helm-git-grep - Invoke `helm-git-grep' from other helm.
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))

;; Emacs variables and faces  ==============================
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(elpy-rpc-backend "jedi")
 '(python-check-command "flake8")
 '(python-fill-docstring-style (quote django))
 '(server-mode t)
 '(server-temp-file-regexp "^/tmp/Re\\|/draft$\\|/COMMIT_EDITMSG$\\|/MERGE_MSG$\\|/git-rebase-todo$")
 '(winner-mode t nil (winner))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(magit-diff-add ((((class color) (background dark)) (:foreground "green"))))
 '(magit-item-highlight ((t (:inherit secondary-selection :background "#011" :foreground "white"))) t)
 )

(load "~/.emacs.d/personal/private.el")