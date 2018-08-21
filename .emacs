					; melpa
(require 'package)
(setq package-archives
      '(("gnu" . "https://mirrors.ocf.berkeley.edu/elpa/")
	("melpa" . "https://mirrors.ocf.berkeley.edu/melpa/")))
(package-initialize)

					; autorequire
(defun my/autorequire (pkg)
  (unless (require pkg nil t)
    (when (not package-archive-contents)
      (package-refresh-contents))
    (package-install pkg)
    (require pkg)))

					; specify backups directory
(setq backup-by-copying t
      backup-directory-alist `(("." . "~/.emacs.d/backups/"))
      version-control t
      delete-old-versions t)

					; specify autosaves directory
(when (not (file-directory-p "~/.emacs.d/autosaves/"))
  (make-directory "~/.emacs.d/autosaves/" t))
(setq auto-save-file-name-transforms
      `((".*" "~/.emacs.d/autosaves/" t)))

					; custom file
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

					; misc
(menu-bar-mode -1)
(defalias 'yes-or-no-p 'y-or-n-p)
(setq xterm-extra-capabilities nil)

					; moe-theme
(my/autorequire 'moe-theme)
(defun my/moe-modifications ()
  (set-face-attribute 'default nil :background "#000000"))
(add-hook 'window-setup-hook 'my/moe-modifications)
(moe-dark)

					; winner
(my/autorequire 'winner)
(when (fboundp 'winner-mode)
  (winner-mode 1))

					; windmove
(my/autorequire 'windmove)
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))

					; ido
(ido-mode t)

					; smex
(my/autorequire 'smex)
(setq smex-save-file "~/.emacs.d/smex.save")
(smex-initialize)
(global-set-key [(meta x)] 'smex)

					; whitespace
(my/autorequire 'whitespace)
(setq whitespace-style '(face tabs space-before-tab tab-mark empty))
(global-whitespace-mode t)

(add-hook 'before-save-hook 'delete-trailing-whitespace)

(defun my/whitespace ()
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4
		py-smart-indentation nil
		py-indent-offset 4
		python-indent 4
		yaml-indent-offset 4))

(add-hook 'prog-mode-hook 'my/whitespace)

(column-number-mode 1)

					; python
(my/autorequire 'elpy)
(elpy-enable)
(when (getenv "VIRTUAL_ENV")
  (pyvenv-activate (getenv "VIRTUAL_ENV")))
(my/autorequire 'jedi)
(my/autorequire 'auto-complete)
(add-hook 'python-mode-hook 'jedi:setup)
(setq ac-delay 0.0)
(setq ac-auto-show-menu 0.0)
(setq jedi:complete-on-dot t)

					; other packages
(my/autorequire 'fish-mode)
(load "~/.emacs.d/osc52e.el")
(osc52-set-cut-function)
