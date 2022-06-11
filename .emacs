(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(let ((default-directory (expand-file-name "~/elisp")))
  (normal-top-level-add-subdirs-to-load-path))

;; backup
(setq backup-directory-alist `(("." . "~/.tilde-backups")))
(setq backup-by-copying t)
(setq delete-old-versions t
      kept-new-versions 6
      kept-old-versions 2
      version-control t)

;; encoding
(prefer-coding-system       'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(setq default-buffer-file-coding-system 'utf-8)

;; display
(global-hl-line-mode 1)
(set-face-background 'hl-line "dark blue")

(blink-cursor-mode 1)
(menu-bar-mode -1)
(setq display-time-day-and-date t
      display-time-24hr-format nil)
(display-time)

;; KEY COMMANDS
(global-set-key (kbd "TAB") 'self-insert-command)
(global-set-key (kbd "M-SPC") 'other-window)
(global-set-key (kbd "C-c C-r") 'replace-string)
(global-set-key (kbd "C-c o") 'occur)

;; C mode
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default fill-column 68)
(setq-default c-default-style "bsd"
              c-basic-offset 4)
(add-hook 'c-mode-common-hook
	  '(lambda ()
	     (c-set-offset 'inextern-lang 0)))

;; C mode: gray out the "assert(...)" wrapper
;; (setq font-lock-multiline t)
;; (add-hook 'c-mode-common-hook
;; 	  (lambda () (font-lock-add-keywords nil
;; 					                     '(("^[ \t]+\\<\\([a-zA-Z_]?[a-zA-Z0-9_]*assert\(\\([^;]*\n?\\)*\);\\)" 1 '(:foreground "#888800") t)))))

;; (add-hook 'c-mode-common-hook
;; 	  (lambda () (font-lock-add-keywords nil
;; 					                     '(("^[ \t]+\\<\\([a-zA-Z_]?[a-zA-Z0-9_]*assert\(.*\);\\)" 1 '(:foreground "#888800") t)))))

(add-hook 'c-mode-common-hook
	  (lambda () (font-lock-add-keywords nil
					                     '(("^[ \t]+\\<\\([a-zA-Z_]?[a-zA-Z0-9_]*assert\\)" 1 '(:foreground "#FFFF00") t)))))

;; C mode: gray out the stuff inside parenthesis with a slightly lighter color
;; (add-hook 'c-mode-common-hook
;; 	  (lambda () (font-lock-add-keywords nil
;; 					     '(("^[ \t]+\\<[a-zA-Z_]?[a-zA-Z0-9_]*assert\\(\(\\([^;]*\n?\\)*\);\\)" 1 '(:foreground "#CCCC00") t)))))

;; slime
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; Julia mode
;; (package-install 'julia-mode)
;; (require 'julia-mode)

;; spelling
(require 'flyspell)
(setq ispell-program-name "aspell")
(setq ispell-dictionary "english")

;; whitespace
(require 'whitespace)
(setq whitespace-line-column 70) ;; limit line length
(setq whitespace-style '(face lines-tail))
(add-hook 'prog-mode-hook 'whitespace-mode)
(setq column-number-mode t)

;; org-mode
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-blank-before-new-entry '((heading) (plain-list-item)))
(setq org-log-done t)
(require 'ox-md)
(setq org-duration-format (quote h:mm))

;; LaTeX
(setq TeX-PDF-mode t)
(set-variable (quote latex-run-command) "pdflatex")

;; (add-hook 'LaTeX-mode-hook
;;           (lambda ()
;;             (font-lock-add-keywords nil
;;                                     '(("[^%].*\\(\\\\cvitem\\){\\([^}]+\\)}" 1 font-lock-keyword-face t)
;;                                       ("\\(\\\\cvitem\\){\\([^}]+\\)}" 2 font-lock-type-face t)
;;                                       ("\\(\\\\years\\)\\>" 1 font-lock-keyword-face t)))))
;; (eval-after-load "font-latex"
;;   '(setq-default
;;     font-latex-match-bold-command-keywords
;;     (cons "cvitem" font-latex-match-bold-command-keywords)))

(load "dired-x")

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  (add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives '("gnu" . (concat proto "://elpa.gnu.org/packages/")))))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#000000" "#d54e53" "#b9ca4a" "#e7c547" "#7aa6da" "#c397d8" "#70c0b1" "#eaeaea"))
 '(beacon-color "#d54e53")
 '(case-fold-search t)
 '(compilation-message-face 'default)
 '(cua-global-mark-cursor-color "#7ec98f")
 '(cua-normal-cursor-color "#868686")
 '(cua-overwrite-cursor-color "#e5c06d")
 '(cua-read-only-cursor-color "#8ac6f2")
 '(custom-enabled-themes '(sanityinc-tomorrow-blue))
 '(custom-safe-themes
   '("51ec7bfa54adf5fff5d466248ea6431097f5a18224788d0bd7eb1257a4f7b773" "13a8eaddb003fd0d561096e11e1a91b029d3c9d64554f8e897b2513dbf14b277" "0fffa9669425ff140ff2ae8568c7719705ef33b7a927a0ba7c5e2ffcfac09b75" "c433c87bd4b64b8ba9890e8ed64597ea0f8eb0396f4c9a9e01bd20a04d15d358" "00445e6f15d31e9afaa23ed0d765850e9cd5e929be5e8e63b114a3346236c44c" "285d1bf306091644fb49993341e0ad8bafe57130d9981b680c1dbd974475c5c7" "830877f4aab227556548dc0a28bf395d0abe0e3a0ab95455731c9ea5ab5fe4e1" "2809bcb77ad21312897b541134981282dc455ccd7c14d74cc333b6e549b824f3" "7f1d414afda803f3244c6fb4c2c64bea44dac040ed3731ec9d75275b9e831fe5" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "392395ee6e6844aec5a76ca4f5c820b97119ddc5290f4e0f58b38c9748181e8d" default))
 '(fci-rule-color "#424242")
 '(flycheck-color-mode-line-face-to-color 'mode-line-buffer-id)
 '(font-latex-match-bold-command-keywords '(("cvitem" "{") ("years" "{")))
 '(font-latex-match-function-keywords
   '(("ifshortbiofirstperson" "")
     ("ifshortbiothirdperson" "")
     ("iflongbiofirstperson" "")
     ("iflongbiothirdperson" "")))
 '(font-latex-match-italic-command-keywords '(("cvsubitem" "{")))
 '(font-latex-match-warning-keywords '(("sk" "")))
 '(frame-background-mode 'dark)
 '(highlight-changes-colors '("#e5786d" "#834c98"))
 '(highlight-symbol-colors
   '("#4e4434" "#3d4d3c" "#564544" "#3c333c" "#3e4d55" "#4e4434" "#45444d"))
 '(highlight-symbol-foreground-color "#939393")
 '(highlight-tail-colors
   '(("#2a2a2a" . 0)
     ("#39454b" . 20)
     ("#384538" . 30)
     ("#3e3e45" . 50)
     ("#463e31" . 60)
     ("#463e31" . 70)
     ("#463731" . 85)
     ("#2a2a2a" . 100)))
 '(hl-bg-colors
   '("#463e31" "#463e31" "#4c3e3e" "#463731" "#383037" "#3e3e45" "#384538" "#39454b"))
 '(hl-fg-colors
   '("#262526" "#262526" "#262526" "#262526" "#262526" "#262526" "#262526" "#262526"))
 '(hl-paren-background-colors '("#2492db" "#95a5a6" nil))
 '(hl-paren-colors '("#ecf0f1" "#ecf0f1" "#c0392b"))
 '(lsp-ui-doc-border "#939393")
 '(nrepl-message-colors
   '("#ffb4ac" "#ddaa6f" "#e5c06d" "#39454b" "#dce9f1" "#3e3e45" "#7ec98f" "#e5786d" "#834c98"))
 '(package-selected-packages
   '(cmake-mode markdown-mode package-utils org org-drill lorem-ipsum julia-mode php-mode easy-jekyll poly-markdown realgud-lldb solarized-theme slime haskell-mode flatui-theme company color-theme-sanityinc-tomorrow auctex))
 '(pos-tip-background-color "#2a2a2a")
 '(pos-tip-foreground-color "#939393")
 '(safe-local-variable-values
   '((eval progn
           (set
            (make-local-variable 'org-time-clocksum-format)
            '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
           (setq org-latex-tables-centered t org-latex-default-table-environment "longtable")
           (local-set-key
            (kbd "<f5>")
            (lambda nil
              (interactive)
              (beginning-of-buffer)
              (re-search-forward "#\\+CONSTANTS: .+block=\\([0-9]\\{4\\}-[0-9]\\{2\\}\\)")
              (let
                  ((block
                    (match-string 1)))
                (re-search-forward "#\\+BEGIN: clocktable .+:block \\([0-9]\\{4\\}-[0-9]\\{2\\}\\)")
                (kill-region
                 (match-beginning 1)
                 (match-end 1))
                (insert block))
              (beginning-of-buffer)
              (search-forward "#+BEGIN: clocktable")
              (unwind-protect
                  (progn
                    (defadvice org-table-goto-column
                        (before always-make-new-columns
                                (n &optional on-delim force)
                                activate)
                      "always adds new columns when we move to them"
                      (setq force t))
                    (beginning-of-line)
                    (org-update-dblock))
                (ad-deactivate 'org-table-goto-column))
              (beginning-of-buffer)
              (search-forward "| totaltarget")
              (org-table-recalculate t))))
     (eval progn
           (set
            (make-local-variable 'org-time-clocksum-format)
            '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))
           (setq org-latex-tables-centered nil org-latex-default-table-environment "longtable")
           (local-set-key
            (kbd "<f5>")
            (lambda nil
              (interactive)
              (beginning-of-buffer)
              (re-search-forward "Invoice number: \\([0-9]+\\)")
              (let
                  ((n
                    (string-to-number
                     (match-string 1))))
                (kill-region
                 (match-beginning 1)
                 (match-end 1))
                (insert
                 (format "%d"
                         (1+ n))))
              (beginning-of-buffer)
              (re-search-forward "Invoice date: *")
              (kill-region
               (point)
               (save-excursion
                 (end-of-line)
                 (point)))
              (org-insert-time-stamp
               (current-time)
               nil t)
              (beginning-of-buffer)
              (search-forward "#+BEGIN: clocktable")
              (unwind-protect
                  (progn
                    (defadvice org-table-goto-column
                        (before always-make-new-columns
                                (n &optional on-delim force)
                                activate)
                      "always adds new columns when we move to them"
                      (setq force t))
                    (org-clocktable-shift 'right 1))
                (ad-deactivate 'org-table-goto-column))
              (beginning-of-buffer)
              (search-forward "| totaltarget")
              (org-table-recalculate t))))))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#8ac6f2" "#2a2a2a" 0.2))
 '(sml/active-background-color "#34495e")
 '(sml/active-foreground-color "#ecf0f1")
 '(sml/inactive-background-color "#dfe4ea")
 '(sml/inactive-foreground-color "#34495e")
 '(term-default-bg-color "#262526")
 '(term-default-fg-color "#868686")
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#d54e53")
     (40 . "#e78c45")
     (60 . "#e7c547")
     (80 . "#b9ca4a")
     (100 . "#70c0b1")
     (120 . "#7aa6da")
     (140 . "#c397d8")
     (160 . "#d54e53")
     (180 . "#e78c45")
     (200 . "#e7c547")
     (220 . "#b9ca4a")
     (240 . "#70c0b1")
     (260 . "#7aa6da")
     (280 . "#c397d8")
     (300 . "#d54e53")
     (320 . "#e78c45")
     (340 . "#e7c547")
     (360 . "#b9ca4a")))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   '(unspecified "#262526" "#2a2a2a" "#4c3e3e" "#ffb4ac" "#39454b" "#8ac6f2" "#463e31" "#e5c06d" "#3e3e45" "#a4b5e6" "#463731" "#e5786d" "#384538" "#7ec98f" "#868686" "#6e6e6e"))
 '(window-divider-mode nil)
 '(xterm-color-names
   ["#2a2a2a" "#ffb4ac" "#8ac6f2" "#e5c06d" "#a4b5e6" "#e5786d" "#7ec98f" "#e0e0e0"])
 '(xterm-color-names-bright
   ["#262526" "#ddaa6f" "#656565" "#6e6e6e" "#868686" "#834c98" "#939393" "#eeedee"]))


(defun disable-themes ()
  ;; This interactive call is taken from `load-theme'
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
			     (mapcar 'symbol-name
				     (custom-available-themes))))))
  (mapcar #'disable-theme custom-enabled-themes))

(global-set-key [f3] (lambda () (interactive) (disable-themes)))
;; (global-set-key [f4] (lambda () (interactive) (disable-themes) (load-theme 'sanityinc-tomorrow-night t)))
;; (global-set-key [f5] (lambda () (interactive) (disable-themes) (load-theme 'sanityinc-tomorrow-day t)))

(disable-themes)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; ose mode
(require 'ose-mode)
