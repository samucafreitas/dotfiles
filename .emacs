(package-initialize)

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'load-path "~/.emacs.d/evil")
;; which-key: displays available keybindings in popup
(add-to-list 'load-path "path/to/which-key.el")
(require 'which-key)
(which-key-mode)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(require 'all-the-icons)
(require 'neotree)
(require 'airline-themes)
(require 'hydra-examples)
(require 'evil-magit)

(setq evil-want-integration t)
(setq evil-want-keybinding nil)
(require 'evil)
(when (require 'evil-collection nil t)
  (evil-collection-init 'neotree))

(evil-mode t)
(global-undo-tree-mode -1)
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
;(global-wakatime-mode)
(global-linum-mode t)
(global-hl-line-mode t)
(ido-mode t)
(show-paren-mode t)
(hlinum-activate)

(avy-setup-default)

(define-key neotree-mode-map (kbd "i") #'neotree-enter-horizontal-split)
(define-key neotree-mode-map (kbd "I") #'neotree-enter-vertical-split)

;; Defines evil keys
(define-key evil-insert-state-map (kbd "M-j M-k") 'evil-normal-state)
(define-key evil-visual-state-map (kbd "C-c") 'kill-ring-save)
(define-key evil-insert-state-map (kbd "C-v") 'clipboard-yank)
(define-key evil-insert-state-map (kbd "C-u") 'undo-only)
(define-key evil-normal-state-map (kbd "u") nil)

(evil-define-key 'normal neotree-mode-map (kbd "TAB") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "SPC") 'neotree-quick-look)
(evil-define-key 'normal neotree-mode-map (kbd "q") 'neotree-hide)
(evil-define-key 'normal neotree-mode-map (kbd "RET") 'neotree-enter)
(evil-define-key 'normal neotree-mode-map (kbd "g") 'neotree-refresh)
(evil-define-key 'normal neotree-mode-map (kbd "n") 'neotree-next-line)
(evil-define-key 'normal neotree-mode-map (kbd "p") 'neotree-previous-line)
(evil-define-key 'normal neotree-mode-map (kbd "A") 'neotree-stretch-toggle)
(evil-define-key 'normal neotree-mode-map (kbd "H") 'neotree-hidden-file-toggle)

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

; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
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

;; Global settings (defaults)
(setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
      doom-themes-enable-italic t) ; if nil, italics is universally disabled

;; Corrects (and improves) org-mode's native fontification.
(doom-themes-org-config)

(set-face-attribute 'default nil :font "InconsolataForPowerline Nerd Font-13")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(cursor ((t (:background "#AF87D7" :foreground "#151718"))))
 '(neo-dir-link-face ((t (:foreground "#AF87D7" :slant normal :weight medium :height 120 :family "InconsolataForPowerline Nerd Font"))))
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
 '(custom-enabled-themes '(doom-dracula))
 '(custom-safe-themes
   '("e6ff132edb1bfa0645e2ba032c44ce94a3bd3c15e3929cdf6c049802cf059a2a" "8d5f22f7dfd3b2e4fc2f2da46ee71065a9474d0ac726b98f647bc3c7e39f2819" "66aea5b7326cf4117d63c6694822deeca10a03b98135aaaddb40af99430ea237" "a94f1a015878c5f00afab321e4fef124b2fc3b823c8ddd89d360d710fc2bddfc" "0cd56f8cd78d12fc6ead32915e1c4963ba2039890700458c13e12038ec40f6f5" "de0b7245463d92cba3362ec9fe0142f54d2bf929f971a8cdf33c0bf995250bcf" "64ca5a1381fa96cb86fd6c6b4d75b66dc9c4e0fc1288ee7d914ab8d2638e23a9" "721bb3cb432bb6be7c58be27d583814e9c56806c06b4077797074b009f322509" "946e871c780b159c4bb9f580537e5d2f7dba1411143194447604ecbaf01bd90c" "1b27e3b3fce73b72725f3f7f040fd03081b576b1ce8bbdfcb0212920aec190ad" "251348dcb797a6ea63bbfe3be4951728e085ac08eee83def071e4d2e3211acc3" "d61f6c49e5db58533d4543e33203fd1c41a316eddb0b18a44e0ce428da86ef98" "3eb93cd9a0da0f3e86b5d932ac0e3b5f0f50de7a0b805d4eb1f67782e9eb67a4" "b59d7adea7873d58160d368d42828e7ac670340f11f36f67fa8071dbf957236a" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" "ecba61c2239fbef776a72b65295b88e5534e458dfe3e6d7d9f9cb353448a569e" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "d1b4990bd599f5e2186c3f75769a2c5334063e9e541e37514942c27975700370" "100e7c5956d7bb3fd0eebff57fde6de8f3b9fafa056a2519f169f85199cc1c96" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "1c082c9b84449e54af757bcae23617d11f563fc9f33a832a8a2813c4d7dfb652" "cd736a63aa586be066d5a1f0e51179239fe70e16a9f18991f6f5d99732cabb32" "b54826e5d9978d59f9e0a169bbd4739dd927eead3ef65f56786621b53c031a7c" "4697a2d4afca3f5ed4fdf5f715e36a6cac5c6154e105f3596b44a4874ae52c45" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "7e78a1030293619094ea6ae80a7579a562068087080e01c2b8b503b27900165c" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "6ac7c0f959f0d7853915012e78ff70150bfbe2a69a1b703c3ac4184f9ae3ae02" "7366916327c60fdf17b53b4ac7f565866c38e1b4a27345fe7facbf16b7a4e9e8" "3fa81193ab414a4d54cde427c2662337c2cab5dd4eb17ffff0d90bca97581eb6" "ed0b4fc082715fc1d6a547650752cd8ec76c400ef72eb159543db1770a27caa7" "987b709680284a5858d5fe7e4e428463a20dfabe0a6f2a6146b3b8c7c529f08b" "3cc2385c39257fed66238921602d8104d8fd6266ad88a006d0a4325336f5ee02" "58c6711a3b568437bab07a30385d34aacf64156cc5137ea20e799984f4227265" "3d5ef3d7ed58c9ad321f05360ad8a6b24585b9c49abcee67bdcbb0fe583a6950" "b3775ba758e7d31f3bb849e7c9e48ff60929a792961a2d536edec8f68c671ca5" "9b59e147dbbde5e638ea1cde5ec0a358d5f269d27bd2b893a0947c4a867e14c1" default))
 '(fci-rule-color "#505050")
 '(jdee-db-active-breakpoint-face-colors (cons "#1b1d1e" "#fc20bb"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1b1d1e" "#60aa00"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1b1d1e" "#505050"))
 '(linum-format " %5i ")
 '(package-selected-packages
   '(evil-magit which-key jedi hlinum evil-collection helm airline-themes undo-tree underwater-theme company-jedi doom-themes hydra sml-mode lsp-javascript-typescript lsp-typescript magit spacemacs-theme rainbow-mode swiper hideshow-org wakatime-mode ace-window projectile all-the-icons neotree gruvbox-theme sublime-themes smex ##))
 '(vc-annotate-background "#1b1d1e")
 '(vc-annotate-color-map
   (list
    (cons 20 "#60aa00")
    (cons 40 "#859f0d")
    (cons 60 "#aa931a")
    (cons 80 "#d08928")
    (cons 100 "#d38732")
    (cons 120 "#d6863d")
    (cons 140 "#da8548")
    (cons 160 "#ce8379")
    (cons 180 "#c281aa")
    (cons 200 "#b77fdb")
    (cons 220 "#bf63b2")
    (cons 240 "#c74789")
    (cons 260 "#d02b61")
    (cons 280 "#b0345c")
    (cons 300 "#903d58")
    (cons 320 "#704654")
    (cons 340 "#505050")
    (cons 360 "#505050")))
 '(vc-annotate-very-old-color nil)
 '(wakatime-cli-path "wakatime")
 '(wakatime-python-bin nil))

(eval-after-load 'hlinum
  '(progn
     (set-face-attribute 'linum-highlight-face nil
                         :background "#282A36"
                         :foreground "#AF87D7")))

(put 'upcase-region 'disabled nil)

(global-set-key (kbd "M-s") (defhydra hydra-window ()
"
^Movement^        ^Split^         ^Switch^       ^Resize^      ^Win. move^
-------------------------------------------------------------------------
_h_ <           _I_ vertical      _b_uffer      _+_ maximize     _H_ X<
_j_ ↓           _i_ horizontal    _f_ind files  _-_ minimize     _J_ X↓
_k_ ↑           _z_ undo          _a_ce                        _K_ X↑
_l_ >           _Z_ reset         _s_wap                       _L_ X>
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


(defun my-neotree-project-dir-toggle ()
  "Open NeoTree using the project root, using projectile, find-file-in-project,
or the current buffer directory."
  (interactive)
  (let* ((filepath (buffer-file-name))
         (project-dir
          (with-demoted-errors
              (cond
               ((featurep 'projectile)
                (projectile-project-root))
               ((featurep 'find-file-in-project)
                (ffip-project-root))
               (t ;; Fall back to version control root.
                (if filepath
                    (vc-call-backend
                     (vc-responsible-backend filepath) 'root filepath)
                  nil)))))
         (neo-smart-open t))

    (if (and (fboundp 'neo-global--window-exists-p)
             (neo-global--window-exists-p))
        (neotree-hide)
      (neotree-show)
      (when project-dir
        (neotree-dir project-dir))
      (when filepath
        (neotree-find filepath)))))

(define-key global-map (kbd "M-e") 'my-neotree-project-dir-toggle)
