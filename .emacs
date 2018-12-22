(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'neotree)
(require 'evil)
(require 'rainbow-mode)

(evil-mode 0)
(rainbow-mode t)


(define-key neotree-mode-map (kbd "i") #'neotree-enter-horizontal-split)
(define-key neotree-mode-map (kbd "I") #'neotree-enter-vertical-split)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "s-x p") 'projectile-mode)

(global-set-key (kbd "M-s k") 'windmove-up)
(global-set-key (kbd "M-s j") 'windmove-down)
(global-set-key (kbd "M-s h") 'windmove-left)
(global-set-key (kbd "M-s l") 'windmove-right)
(avy-setup-default)
(global-set-key (kbd "C-:") 'avy-goto-char)
(global-set-key (kbd "C-'") 'avy-goto-char-2)
(global-set-key (kbd "M-g f") 'avy-goto-line)
(global-set-key (kbd "M-g w") 'avy-goto-word-1)
(global-set-key (kbd "M-g e") 'avy-goto-word-0)
(global-set-key (kbd "C-c C-j") 'avy-resume)
(global-set-key (kbd "<s-left>") 'shrink-window-horizontally)
(global-set-key (kbd "<s-right>") 'enlarge-window-horizontally)
(global-set-key (kbd "<s-down>") 'shrink-window)
(global-set-key (kbd "<s-up>") 'enlarge-window)

(set-face-attribute 'default nil :font "Inconsolata For Powerline-13")
(setq neo-theme (if (display-graphic-p) 'icons 'arrow))
(setq neo-window-fixed-size nil)
(setq neo-window-position 'right)
(setq inhibit-startup-screen t) ; Disable welcome screen
(setq next-line-add-newlines nil) ; Add newlines if the point is at the end of the buffer
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)
(setq-default truncate-lines t)
(setq-default global-visual-line-mode t)
(setq make-backup-files nil) ; stop creating backup~ files
(setq vc-follow-symlinks t)

(defalias 'list-buffers 'ibuffer)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "gold" :foreground "#151718"))))
 '(mode-line ((t (:background "black" :foreground "#DB3F62"))))
 '(neo-dir-link-face ((t (:foreground "#DB3F62" :slant normal :weight medium :height 120 :family "InconsolataForPowerline Nerd Font"))))
 '(neo-file-link-face ((t (:foreground "White" :weight medium :height 120 :family "InconsolataForPowerline Nerd Font")))))

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-linum-mode t)
(global-hl-line-mode t)
(ido-mode t)
(show-paren-mode t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(custom-enabled-themes (quote (junio)))
 '(custom-safe-themes
   (quote
    ("6ac7c0f959f0d7853915012e78ff70150bfbe2a69a1b703c3ac4184f9ae3ae02" "7366916327c60fdf17b53b4ac7f565866c38e1b4a27345fe7facbf16b7a4e9e8" "3fa81193ab414a4d54cde427c2662337c2cab5dd4eb17ffff0d90bca97581eb6" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(linum-format " %5i ")
 '(package-selected-packages
   (quote
    (evil-magit magit rainbow-mode swiper hideshow-org wakatime-mode ace-window projectile all-the-icons neotree gruvbox-theme sublime-themes smex ##))))

(setq backup-directory-alist '(("." . "~/.emacs_saves")))
