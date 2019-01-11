(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/evil")
(require 'neotree)
(require 'airline-themes)
(require 'hydra-examples)

(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init 'neotree))

(eval-after-load 'hlinum
  '(progn
     (set-face-attribute 'linum-highlight-face nil
                         :background "#120312"
                         :foreground "#DB3F62")))
(evil-mode t)
(global-undo-tree-mode -1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-wakatime-mode)
(global-linum-mode t)
(global-hl-line-mode t)
(ido-mode t)
(show-paren-mode t)
(hlinum-activate)

(avy-setup-default)

(define-key neotree-mode-map (kbd "i") #'neotree-enter-horizontal-split)
(define-key neotree-mode-map (kbd "I") #'neotree-enter-vertical-split)
(define-key evil-insert-state-map (kbd "M-j M-k") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-c") 'kill-ring-save)
(define-key evil-insert-state-map (kbd "C-v") 'clipboard-yank)

(global-set-key (kbd "C-c C-c i") 'split-window-below)
(global-set-key (kbd "C-c C-c I") 'split-window-right)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)
(global-set-key [f8] 'neotree-toggle)
(global-set-key (kbd "s-x p") 'projectile-mode)
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
(global-set-key (kbd "C-x u") 'undo-only)

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
;; (setq make-backup-files nil) ; stop creating backup~ files
(setq backup-directory-alist '(("." . "~/.emacs_saves")))
(setq vc-follow-symlinks t)

(defalias 'list-buffers 'ibuffer)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "#DB3F62" :foreground "#000000"))))
 '(hl-line ((t (:background "#202020"))))
 '(mode-line ((t (:background "#101010" :foreground "#DB3F62"))))
 '(neo-dir-link-face ((t (:foreground "#DB3F62" :slant normal :weight medium :height 120 :family "InconsolataForPowerline Nerd Font"))))
 '(neo-file-link-face ((t (:foreground "White" :weight medium :height 120 :family "InconsolataForPowerline Nerd Font")))))

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
         ("d21135150e22e58f8c656ec04530872831baebf5a1c3688030d119c114233c24" "73a13a70fd111a6cd47f3d4be2260b1e4b717dbf635a9caee6442c949fad41cd" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "96998f6f11ef9f551b427b8853d947a7857ea5a578c75aa9c4e7c73fe04d10b4" "c48551a5fb7b9fc019bf3f61ebf14cf7c9cdca79bcb2a4219195371c02268f11" "e0d42a58c84161a0744ceab595370cbe290949968ab62273aed6212df0ea94b4" "3cd28471e80be3bd2657ca3f03fbb2884ab669662271794360866ab60b6cb6e6" "e9776d12e4ccb722a2a732c6e80423331bcb93f02e089ba2a4b02e85de1cf00e" "72a81c54c97b9e5efcc3ea214382615649ebb539cb4f2fe3a46cd12af72c7607" "b050365105e429cb517d98f9a267d30c89336e36b109a1723d95bc0f7ce8c11d" "8d5f22f7dfd3b2e4fc2f2da46ee71065a9474d0ac726b98f647bc3c7e39f2819" "6ac7c0f959f0d7853915012e78ff70150bfbe2a69a1b703c3ac4184f9ae3ae02" "7366916327c60fdf17b53b4ac7f565866c38e1b4a27345fe7facbf16b7a4e9e8" "3fa81193ab414a4d54cde427c2662337c2cab5dd4eb17ffff0d90bca97581eb6" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default)))
 '(linum-format " %5i ")
 '(package-selected-packages
        (quote
         (evil-collection evil-magit magit rainbow-mode swiper hideshow-org wakatime-mode ace-window projectile all-the-icons neotree gruvbox-theme sublime-themes smex ##)))
 '(wakatime-cli-path "/usr/bin/wakatime")
 '(wakatime-python-bin nil))

(put 'upcase-region 'disabled nil)

(global-set-key (kbd "M-s") (defhydra hydra-window ()
"
^Movement^        ^Split^         ^Switch^       ^Resize^      ^Win. move^
-------------------------------------------------------------------------
_h_ ←           _I_ vertical      _b_uffer      _+_ maximize     _H_ X←
_j_ ↓           _i_ horizontal    _f_ind files  _-_ minimize     _J_ X↓
_k_ ↑           _z_ undo          _a_ce 1                      _K_ X↑
_l_ →           _Z_ reset         _s_wap                       _L_ X→
_F_ollow        _D_lt Other       _S_ave
_q_ cancel      _o_nly this       _d_elete
"
   ("h" windmove-left)
   ("j" windmove-down)
   ("k" windmove-up)
   ("l" windmove-right)
   ("H" (lambda ()
          (interactive)
          (neotree-hide)
          (evil-window-move-far-left))
    )
   ("J" (lambda ()
          (interactive)
          (neotree-hide)
          (evil-window-move-very-bottom))
    )
   ("K" (lambda ()
          (interactive)
          (neotree-hide)
          (evil-window-move-very-top))
    )
   ("L" (lambda ()
          (interactive)
          (neotree-hide)
          (evil-window-move-far-right))
    )
   ("b" helm-mini)
   ("f" helm-find-files)
   ("F" follow-mode)
   ("a" (lambda ()
          (interactive)
          (ace-window 1)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
    )
   ("I" (lambda ()
          (interactive)
          (split-window-right)
          (windmove-right))
    )
   ("i" (lambda ()
          (interactive)
          (split-window-below)
          (windmove-down))
    )
   ("s" (lambda ()
          (interactive)
          (neotree-hide)
          (ace-window 4)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
    )
   ("S" save-buffer)
   ("d" delete-window)
   ("D" (lambda ()
          (interactive)
          (ace-window 16)
          (add-hook 'ace-window-end-once-hook
                    'hydra-window/body))
    )
   ("o" delete-other-windows)
   ("+" maximize-window)
   ("-" minimize-window)
   ("z" (progn
          (winner-undo)
          (setq this-command 'winner-undo))
    )
   ("Z" winner-redo)
   ("q" nil)))

 ;;c-mode, c++-mode, objc-mode, java-mode
(defun my-c-mode-common-hook ()
 (c-set-offset 'substatement-open 0)
 (setq c++-tab-always-indent t)
 (setq c-basic-offset 4)
 (setq c-indent-level 4)

 (setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60))
 (setq tab-width 4)
 (setq indent-tabs-mode t)
 )

(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)
