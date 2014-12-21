(custom-set-variables
 '(inhibit-startup-screen t))

(when (eq window-system 'ns)
    (tool-bar-mode 0))

(setq mouse-drag-copy-region t)
(setq ring-bell-function 'ignore)   ;; no bell

(global-auto-revert-mode 1)
(column-number-mode t)

;; server start for emacs-client
;;(require 'server)
;;(unless (server-running-p)
;;  (server-start))
;; Not quitting emacs server	
;;(global-set-key (kbd "C-x C-c") 'ns-do-hide-emacs) ;emacs休止
;;(defalias 'exit 'save-buffers-kill-emacs) ;M-x exit で emacs終了


;;;(add-to-list 'load-path "~/Dropbox/Geek/emacs/")

;; Lua Mode
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

;; R Mode
(add-to-list 'load-path "~/Research/usr/ess-14.09/lisp/")
(load "ess-site.el")
;;(load "ess-13.05/lisp/ess-site.el")


;; Gnuplot mode
(autoload 'gnuplot-mode "gnuplot" "gnuplot major mode" t)
(autoload 'gnuplot-make-buffer "gnuplot" "open a buffer in gnuplot mode" t)
(setq auto-mode-alist (append '(("\\.gp$" . gnuplot-mode)) auto-mode-alist))

;; Ruby Mode
;;(autoload 'lua-mode "ruby-mode" "Ruby mode." t)
;;(add-to-list 'auto-mode-alist '("\\.rb$" . ruby-mode))

;; costom keybind

;;;(require 'cython-mode)

;; Disable quitting with cmd+q
(global-set-key (kbd "s-q") 'fill-paragraph)

(global-set-key "\M-p"     'backward-paragraph)
(global-set-key "\M-n"     'forward-paragraph)


;; C-C for compile
(setq compilation-window-height 20)
(add-hook 'c++-mode-hook
   '(lambda () (progn
       (setq compile-command "make -k"))))

(setq compilation-read-command nil)
	  
(setq my-keyjack-mode-map (make-sparse-keymap))
(mapcar (lambda (x)
          (define-key my-keyjack-mode-map (car x) (cdr x))
          (global-set-key (car x) (cdr x)))
        '(("\C-c\C-c" . compile)
          ))

(easy-mmode-define-minor-mode my-keyjack-mode "Grab keys"
                              t " Keyjack" my-keyjack-mode-map)

;;
;;(setq initial-frame-alist
;;      (append '((left . 712) ) initial-frame-alist))

(load "~/.emacs_user")
