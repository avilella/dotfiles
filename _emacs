;; .emacs

;; Don't show the bars
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(tool-bar-mode -1)
(menu-bar-mode -1)

;; Clipboard both ways
(setq x-select-enable-clipboard t)

(add-to-list 'load-path (expand-file-name "yaml-mode" "~/.emacs.d"))
;; (add-to-list 'load-path "/home/avilella/Download/yaml-mode")
(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))


;; (add-to-list 'load-path "/home/smacarthur/.emacs.d/markdown-mode")
;; (autoload 'markdown-mode "markdown-mode"
;;    "Major mode for editing Markdown files" t)
;; (add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
;; (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; (defun markdown-regexp-right (beg end)
;;   (interactive "r")
;;   (replace-regexp "-\|[^-]" "-:|\n" nil beg end)    
;;   (replace-regexp "-\\+-" "-|-" nil beg end)
;; )

(defun markdown-regexp-right (beg end)
  (interactive "r")
  (replace-regexp "-\\+-" "-|-" nil beg end)
)

;; (require 'org-table)

;; (defun cleanup-org-tables ()
;;   (save-excursion
;;     (goto-char (point-min))
;;     (while (search-forward "-+-" nil t) (replace-match "-|-"))
;;     ))

;; (add-hook 'markdown-mode-hook 'orgtbl-mode)
;; (add-hook 'markdown-mode-hook
;;           (lambda()
;;             (add-hook 'after-save-hook 'cleanup-org-tables  nil 'make-it-local)))


; tabs mode nil
(setq indent-tabs-mode nil)

;; ;; (require 'mediawiki)
;;  
;; (setq mediawiki-site-alist '(("Wikipedia" "http://en.wikipedia.org/w/ "" "" "Main Page") ; put your user name and password
;;                              ("WikEmacs" "http://wikemacs.org/" "" "" "Main Page")))
;;  
;; ;; Emacs users care more for WikEmacs than Wikipedia :-). 
;; ;; In any case, do not forget the slash at the end of the URL.
;; (setq mediawiki-site-default "WikEmacs")
;; 
;; 
;; (require 'package)
;; (package-initialize)
;; ;; Not sure which one should come first, but you certainly one of these.
;; ;; As of sept. 2012, this package is not in ELPA
;; (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
;; (add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)


;; cedet cplusplus
;; (semantic-mode 1)

; (add-to-list 'package-archives
;   '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Add support for knit and purl
;; (add-to-list 'load-path "~/.emacs.d/ess-knitr/")
;; (require 'ess-knitr)

;; ;; ;; confluence
;; (add-to-list 'load-path "/home/avilella/.emacs.d/confluence-el/")
;; ;; assuming confluence.el and xml-rpc.el are in your load path
;; (require 'confluence)

;(add-to-list 'load-path "/home/avilella/.emacs.d/elpa/jira-0.3.3")
;(require 'jira)
;(defcustom jira-url "https://ukch-jira.illumina.com/"
; "User customizable URL to Jira server."
; :group 'jira
; :type 'string
; :initialize 'custom-initialize-set)
;; 
;; ;; note, all customization must be in *one* custom-set-variables block
;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;; 
;; ; '(jira-url "https://ukch-jira.illumina.com/rpc/xmlrpc")
;; 
;;  '(confluence-default-space-alist (list (cons confluence-url "~avilella")))
;;  '(confluence-url "https://ukch-confluence.illumina.com/rpc/xmlrpc")
;;  '(gud-pdb-command-name "python -m pdb")
;;  '(inferior-R-program-name "/illumina/thirdparty/R/R-2.15.2/bin/R"))
;; 
;; 
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; confluence editing support (with longlines mode)
;; 
;; (autoload 'confluence-get-page "confluence" nil t)
;; 
;; (eval-after-load "confluence"
;;   '(progn
;;      (require 'longlines)
;;      (progn
;;        (add-hook 'confluence-mode-hook 'longlines-mode)
;;        (add-hook 'confluence-before-save-hook 'longlines-before-revert-hook)
;;        (add-hook 'confluence-before-revert-hook 'longlines-before-revert-hook)
;;        (add-hook 'confluence-mode-hook '(lambda () (local-set-key "\C-j" 'confluence-newline-and-indent))))))
;; 
;; ;; LongLines mode: http://www.emacswiki.org/emacs-en/LongLines
;; (autoload 'longlines-mode "longlines" "LongLines Mode." t)
;; 
;; (eval-after-load "longlines"
;;   '(progn
;;      (defvar longlines-mode-was-active nil)
;;      (make-variable-buffer-local 'longlines-mode-was-active)
;; 
;;      (defun longlines-suspend ()
;;        (if longlines-mode
;;            (progn
;;              (setq longlines-mode-was-active t)
;;              (longlines-mode 0))))
;; 
;;      (defun longlines-restore ()
;;        (if longlines-mode-was-active
;;            (progn
;;              (setq longlines-mode-was-active nil)
;;              (longlines-mode 1))))
;; 
;;      ;; longlines doesn't play well with ediff, so suspend it during diffs
;;      (defadvice ediff-make-temp-file (before make-temp-file-suspend-ll
;;                                              activate compile preactivate)
;;        "Suspend longlines when running ediff."
;;        (with-current-buffer (ad-get-arg 0)
;;          (longlines-suspend)))
;; 
;;      (add-hook 'ediff-cleanup-hook 
;;                '(lambda ()
;;                   (dolist (tmp-buf (list ediff-buffer-A
;;                                          ediff-buffer-B
;;                                          ediff-buffer-C))
;;                     (if (buffer-live-p tmp-buf)
;;                         (with-current-buffer tmp-buf
;;                           (longlines-restore))))))))
;; 
;; ;; keybindings (change to suit)
;; 
;; ;; open confluence page
;; (global-set-key "\C-xwf" 'confluence-get-page)
;; 
;; ;; setup confluence mode
;; (add-hook 'confluence-mode-hook
;;           '(lambda ()
;;              (local-set-key "\C-xw" confluence-prefix-map)))
;; 
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; man entries
(global-set-key  [f1] (lambda () (interactive) (manual-entry (current-word))))

(add-hook 'c++-mode-hook
          (lambda ()
            (setq c-basic-offset 4)))

(dolist (hook
         '(c-mode-hook
           c++-mode-hook))
  (add-hook hook
            (lambda ()
              (local-set-key (kbd "C-h d")
                             (lambda ()
                               (interactive)
                               (manual-entry (current-word))))
            )
   )
)

;;----------------------------------------
;; ;; add cclookup to your loadpath, ex) ~/.emacs.d/cclookup
;; (setq cclookup-dir "~/.emacs.d/cclookup")
;; (add-to-list 'load-path cclookup-dir)
;; 
;; ;; load cclookup when compile time
;; (eval-when-compile (require 'cclookup))
 
;; ;; set executable file and db file
;; (setq cclookup-program (concat cclookup-dir "/cclookup.py"))
;; (setq cclookup-db-file (concat cclookup-dir "/cclookup.db"))
;; 
;; ;; to speedup, just load it on demand
;; (autoload 'cclookup-lookup "cclookup"
;;   "Lookup SEARCH-TERM in the Python HTML indexes." t)
;; 
;; (autoload 'cclookup-update "cclookup" 
;;   "Run cclookup-update and create the database at `cclookup-db-file'." t)
;; ;;----------------------------------------

;;----------------------------------------
;; C++ autocode

  ; Create Header Guards with f12
  (global-set-key [f12] 
  		'(lambda () 
  		   (interactive)
  		   (if (buffer-file-name)
  		       (let*
  			   ((fName (upcase (file-name-nondirectory (file-name-sans-extension buffer-file-name))))
  			    (ifDef (concat "#ifndef " fName "_H" "\n#define " fName "_H" "\n"))
  			    (begin (point-marker))
  			    )
  			 (progn
  					; If less then 5 characters are in the buffer, insert the class definition
  			   (if (< (- (point-max) (point-min)) 5 )
  			       (progn
  				 (insert "\nclass " (capitalize fName) "{\npublic:\n\nprivate:\n\n};\n")
  				 (goto-char (point-min))
  				 (next-line-nomark 3)
  				 (setq begin (point-marker))
  				 )
  			     )
  			   
  					;Insert the Header Guard
  			   (goto-char (point-min))
  			   (insert ifDef)
  			   (goto-char (point-max))
  			   (insert "\n#endif" " //" fName "_H")
  			   (goto-char begin))
  			 )
  		     ;else
  		     (message (concat "Buffer " (buffer-name) " must have a filename"))
  		     )
  		   )
  		)

;;----------------------------------------

    ;; autoinsert C/C++ header
    (define-auto-insert
      (cons "\\.\\([Hh]\\|hh\\|hpp\\)\\'" "My C / C++ header")
      '(nil
    	"// " (file-name-nondirectory buffer-file-name) "\n"
    	"//\n"
    	"// last-edit-by: <> \n"
    	"//\n"
    	"// Description:\n"
    	"//\n"
    	(make-string 70 ?/) "\n\n"
    	(let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
    		   (nopath (file-name-nondirectory noext))
    		   (ident (concat (upcase nopath) "_H")))
    	  (concat "#ifndef " ident "\n"
    			  "#define " ident  " 1\n\n\n"
    			  "\n\n#endif // " ident "\n"))
    	(make-string 70 ?/) "\n"
    	"// $Log:$\n"
    	"//\n"
    	))

    
    ;; auto insert C/C++
    (define-auto-insert
      (cons "\\.\\([Cc]\\|cc\\|cpp\\)\\'" "My C++ implementation")
      '(nil
    	"// " (file-name-nondirectory buffer-file-name) "\n"
    	"//\n"
    	"// last-edit-by: <> \n"
    	"// \n"
    	"// Description:\n"
    	"//\n"
    	(make-string 70 ?/) "\n\n"
    	(let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
    		   (nopath (file-name-nondirectory noext))
    		   (ident (concat nopath ".h")))
    	  (if (file-exists-p ident)
    		  (concat "#include \"" ident "\"\n")))
    	(make-string 70 ?/) "\n"
    	"// $Log:$\n"
    	"//\n"
    	))

;; ;;----------------------------------------
;; 
;; ;; should be useful for knitr
;; 
;; (add-to-list 'load-path "/home/avilella/.emacs.d/polymode/")
;; (add-to-list 'load-path "/home/avilella/.emacs.d/polymode/modes/")
;; ;; Require any polymode bundles that you are interested in:
;; (require 'poly-R)
;; (require 'poly-markdown)

;; ;; https://gist.github.com/crowding/3984881
;; ;; R flymake support (if Flymake is available) This will call a script
;; ;; "rflymake" with the path given; make sure it is on emac's exec-path
;; ;; or give a full path.
;; (require 'flymake)
;;   (defun flymake-r-init ()
;;     (let* ((temp-file (flymake-init-create-temp-buffer-copy
;;                        'flymake-create-temp-inplace))
;;            (local-file (file-relative-name
;;                         temp-file
;;                         (file-name-directory buffer-file-name))))
;;       (list "/home/smacarthur/local/bin/rflymake" (list local-file))))
;;  
;;   (add-to-list 'flymake-allowed-file-name-masks '("\\.[Rr]\\'" flymake-r-init))
;;   (add-to-list 'flymake-err-line-patterns
;;                '("parse(\"\\([^\"]*\\)\"): \\([0-9]+\\):\\([0-9]+\\): \\(.*\\)$"
;;                  1 2 3 4))
;;   (add-hook 'r-mode-hook 'flymake-mode
;;   (add-hook 'ess-mode-hook 'flymake-mode)
;;   )
;; 

;; Marmalade package archive for emacs lisp
(require 'package)
(add-to-list 'package-archives 
    '("marmalade" .
      "http://marmalade-repo.org/packages/"))
(package-initialize)

;; flymake
;; http://stackoverflow.com/questions/14864511/configure-emacs-flymake-to-call-g-directly

;; Import flymake
(require 'flymake)

;; Define function
(defun flymake-cc-init ()
  (let* (;; Create temp file which is copy of current file
         (temp-file   (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
         ;; Get relative path of temp file from current directory
         (local-file  (file-relative-name
                       temp-file
                       (file-name-directory buffer-file-name))))

    ;; Construct compile command which is defined list.
    ;; First element is program name, "g++" in this case.
    ;; Second element is list of options.
    ;; So this means "g++ -Wall -Wextra -fsyntax-only tempfile-path"
    (list "g++" (list "-Wall" "-Wextra" "-fsyntax-only" local-file))))

;; ;; Enable above flymake setting for C++ files(suffix is '.cpp')
;; (push '("\\.cpp$" flymake-cc-init) flymake-allowed-file-name-masks)

;; (push '("\\.cc$" flycheck-cc-init) flycheck-allowed-file-name-masks)

;; ;; Enable flymake-mode for C++ files.
;; (add-hook 'c++-mode-hook 'flymake-mode)

;;http://bogolisk.github.com/egg/egg.html
;;(require 'egg)

;; (custom-set-faces
;;   ;; custom-set-faces was added by Custom.
;;   ;; If you edit it by hand, you could mess it up, so be careful.
;;   ;; Your init file should contain only one such instance.
;;   ;; If there is more than one, they won't work right.
;;  '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;http://kieranhealy.org/esk/starter-kit.html
;;(require 'cl)
;;(require 'saveplace)
;;(require 'ffap)
;;(require 'uniquify)
;;(require 'ansi-color)
;;(require 'recentf)

;; ;;; change line wrap character
;; (set-display-table-slot standard-display-table 'wrap ?\ )

;(normal-top-level-add-subdirs-to-load-path)

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; ;; turn on font-lock mode
;; (when (fboundp 'global-font-lock-mode)
;;   (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
(setq require-final-newline 'query)

;;; cperl-mode is preferred to perl-mode                                        
;;; "Brevity is the soul of wit" <foo at acm.org>                               
(defalias 'perl-mode 'cperl-mode)

;;; LATeX Setup
(setq latex-run-command "sweave *")


;;(require 'psvn)

;; ;;; ORG MODE http://orgmode.org/guide/Activation.html#Activation
;; (setq org-startup-indented 1)


;; ;; The following lines are always needed.  Choose your own keys.
;; (add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
;; (add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
;; (global-set-key "\C-cl" 'org-store-link)
;; (global-set-key "\C-ca" 'org-agenda)
;; (global-set-key "\C-cb" 'org-iswitchb)


;; (setq org-todo-keywords '((sequence "TODO(t)" "RUNNING(r@/!)" "|" "DONE(d!)")))
;; (setq org-hide-leading-stars 1)


;; ESS

;; ;; (add-to-list 'load-path "/home/smacarthur/local/share/emacs/site-lisp/")
;; (add-to-list 'load-path "/home/avilella/local/share/emacs/site-lisp/")
;; ;; (add-to-list 'load-path "/home/avilella/local/share/emacs/site-lisp/ess-13.05")
;; (load "~/src/ess-13.05/lisp/ess-site")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;ESS custom setup
;; Use shift-enter to split window & launch R (if not running), execute highlighted
;; region (if R running & area highlighted), or execute current line
;; (and move to next line, skipping comments). Nice. 
;; See http://www.emacswiki.org/emacs/EmacsSpeaksStatistics,
;; FelipeCsaszar. Adapted to spilit vertically instead of
;; horizontally. 

(setq ess-ask-for-ess-directory nil)
(setq ess-local-process-name "R")
(setq ansi-color-for-comint-mode 'filter)
(setq comint-prompt-read-only t)
(setq comint-scroll-to-bottom-on-input t)
(setq comint-scroll-to-bottom-on-output t)
(setq comint-move-point-for-output t)


(defun my-ess-start-R ()
  (interactive)
  (if (not (member "*R*" (mapcar (function buffer-name) (buffer-list))))
      (progn
	(delete-other-windows)
	(setq w1 (selected-window))
	(setq w1name (buffer-name))
	(setq w2 (split-window w1 nil t))
	(R)
        (setq w3 (split-window w2))
	(select-window w3)	
	(enlarge-window 10)
	(set-window-buffer w1 w1name)	
	(set-window-buffer w3 "*R*")
	(select-window w1)
	(enlarge-window 10)
	(set-window-buffer w2 "*Completions*")
	))
)

(defun my-ess-eval ()
  (interactive)
  (my-ess-start-R)
  (if (and transient-mark-mode mark-active)
      (call-interactively 'ess-eval-region)
    (call-interactively 'ess-eval-line-and-step)))

(add-hook 'ess-mode-hook
	  '(lambda()
	     (local-set-key [return] 'newline-and-indent)    
	     (local-set-key (kbd "C-^") 'my-ess-eval)
;;	     (local-set-key "\t" 'ess-indent-command)
	     (local-set-key "\t" 'ess-complete-object-name)
	     (local-set-key [backtab] 'comint-dynamic-complete)
	     )
	  )

(add-hook 'inferior-ess-mode-hook
	    '(lambda()
;;	       (local-set-key "\t" 'ess-indent-command)
             (local-set-key "\t" 'ess-complete-object-name)
	       (local-set-key [backtab] 'comint-dynamic-complete)
	       (local-set-key [up] 'comint-previous-input)
	       (local-set-key [down] 'comint-next-input)))


(require 'ess-site)
(require 'ess-eldoc) 
(setq ess-eval-visibly-p nil) 
(ess-toggle-underscore nil)

(if (not window-system)
   (menu-bar-mode 0))

;; (custom-set-variables
;;  ;; custom-set-variables was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(ansi-color-names-vector ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
;;  '(custom-enabled-themes (quote (manoj-dark)))
;;  '(org-agenda-files (quote ("/home/smacarthur/docs/todo.org")))
;;  '(org-hierarchical-todo-statistics nil)
;;  '(vc-handled-backends (quote (RCS CVS SVN SCCS Bzr Hg Arch Git))))
;; (custom-set-faces
;;  ;; custom-set-faces was added by Custom.
;;  ;; If you edit it by hand, you could mess it up, so be careful.
;;  ;; Your init file should contain only one such instance.
;;  ;; If there is more than one, they won't work right.
;;  '(font-lock-builtin-face ((((class color) (min-colors 8)) (:foreground "yellow" :weight bold))))
;;  '(font-lock-function-name-face ((((class color) (min-colors 8)) (:foreground "DodgerBlue" :weight bold))))
;;  '(markdown-inline-code-face ((t (:foreground "yellow"))))
;;  '(org-level-1 ((t (:foreground "cyan"))) t)
;;  '(org-level-4 ((t (:inherit outline-5))) t))

;;;; markdown
(autoload 'markdown-mode "markdown-mode.el" "Major mode for editing Markdown files" t) 
;(setq auto-mode-alist (cons '("\\.Rmd" . markdown-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.Rmd$" . r-mode) auto-mode-alist))
(global-set-key (kbd "C-^") 'my-ess-eval)

;;; http://stackoverflow.com/questions/4682459/emacs-autocomplete-mode-extension-for-ess-and-r
;;(require 'auto-complete)
;;(require 'auto-complete-acr)

;;;http://www.village-buzz.com/2009/01/emacs-extensions-i-cant-live-without/
;(require 'anything)

;;http://kieranhealy.org/esk/starter-kit-bindings.html
(defun cleanup-buffer ()
  "Perform a bunch of operations on the whitespace content of a buffer."
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defadvice align-regexp (around align-regexp-with-spaces activate)
  (let ((indent-tabs-mode nil))
    ad-do-it))

 (global-set-key (kbd "C-x \\") 'align-regexp)
 (global-set-key (kbd "C-c n") 'cleanup-buffer)
 (windmove-default-keybindings) 
 (global-set-key (kbd "C-x O") (lambda () (interactive) (other-window -1))) ;; back one
 (global-set-key (kbd "C-x C-o") (lambda () (interactive) (other-window 2))) ;; forward two
 (setq windmove-wrap-around t)


;;; http://stackoverflow.com/questions/5117359/any-r-style-guide-checker
;;; C
(add-hook 'c-mode-hook
          ;;(lambda () (c-set-style "bsd")))
          ;;(lambda () (c-set-style "user"))) ; edd or maybe c++ ?
          (lambda () (c-set-style "c++"))) ; edd or maybe c++ ?
;;;; ESS
(add-hook 'ess-mode-hook
          (lambda ()
            (ess-set-style 'C++)
        ;; Because
            ;;                                 DEF GNU BSD K&R C++
            ;; ess-indent-level                  2   2   8   5   4
            ;; ess-continued-statement-offset    2   2   8   5   4
            ;; ess-brace-offset                  0   0  -8  -5  -4
            ;; ess-arg-function-offset           2   4   0   0   0
            ;; ess-expression-offset             4   2   8   5   4
            ;; ess-else-offset                   0   0   0   0   0
            ;; ess-close-brace-offset            0   0   0   0   0
            (add-hook 'local-write-file-hooks
                      (lambda ()
                        (ess-nuke-trailing-whitespace)))))
(setq ess-nuke-trailing-whitespace-p t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;; previous configurations ;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; dont show the startup message
(setq inhibit-startup-message t)


;; ;; ess
;; (ess-toggle-underscore nil)
;;;;; create a new frame for each help instance
(setq ess-help-own-frame t)
;;;;; If you want all help buffers to go into one frame do
;; (setq ess-help-own-frame 'one)

;; Title bar shows name of the buffer 
(setq frame-title-format '("emacs %*%+ %b"))

;; Uses y/n instead of yes/no 
(fset 'yes-or-no-p 'y-or-n-p)

;; Open compressed files in gzip and bzip2 format
(auto-compression-mode 1)

;; Useful function:
;; Insert date into buffer
(defun insert-date ()
  "Insert date at point."
  (interactive)
  (insert (format-time-string "%A, %B %e, %Y %k:%M:%S %z")))

(defun pre ()
  "Insert html pre tags."
  (interactive)
  (insert "<pre>")
  (insert "\n")
  (insert "\n")
  (insert "</pre>"))

(defun code ()
  "Insert html pre tags."
  (interactive)

(insert "<ac:structured-macro ac:name=\"code\">\n")
(insert "  <ac:plain-text-body><![CDATA[\n")
(insert "\n")
(insert "\n")
(insert "  \]\]\></ac:plain-text-body>\n")
(insert "</ac:structured-macro>\n"))

(defun ddd ()
  "Insert date at point journal style."
  (interactive)
  (insert (format-time-string "[%Y-%m-%d %a]"))
  (insert "\n")
  (insert "\n")
  (insert "\n")
  (insert "**\n"))

;; Useful function:
;; Compute the length of the marked region 
(defun region-length ()
  "length of a region"
  (interactive)
  (message (format "%d" (- (region-end) (region-beginning)))))

;; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))

;; Shows line and column number
(line-number-mode 't)
(column-number-mode 't)
(require 'icomplete)

;; Iseach only char by char
(defun isearch-yank-char ()
  "Pull next char from buffer into search string."
  (interactive)
  (isearch-yank-string
   (save-excursion
     (and (not isearch-forward) isearch-other-end
          (goto-char isearch-other-end))
     (buffer-substring-no-properties
      (point) (progn (forward-char 1) (point))))))

(define-key isearch-mode-map (kbd "C-f") 'isearch-yank-char)
;; (define-key isearch-mode-map (kbd "C-b") 'isearch-delete-char)

  (defun new-replace-string (from-string to-string &rest other-args)
    "Like `replace-string', but affects entire buffer by default,
and restores point when done."
    (interactive (query-replace-read-args "Replace string" nil))
    (save-excursion
      (goto-char (point-min))
      (apply #'replace-string from-string to-string other-args)))

;; Set up the keyboard so the delete key on both the regular keyboard
;; and the keypad delete the character under the cursor and to the right
;; under X, instead of the default, backspace behavior.
(global-set-key [delete] 'delete-char)
(global-set-key [kp-delete] 'delete-char)

(global-set-key "\M-g" 'goto-line)
(global-set-key "\C-c\C-c" 'comment-region)
(global-set-key "\M-j" 'other-window)
(global-set-key "\M-m" 'switch-to-buffer)
(global-set-key "\C-c\c" 'compile)

(defun close-all-files ()
  "Kill all buffers that are visiting a file."
  (interactive)
  (let ((buffers (buffer-list)))
    (while buffers
      (if (buffer-file-name (car buffers))
          (kill-buffer (car buffers)))
      (setq buffers (cdr buffers)))))
 
(defun nuke-all-buffers ()
  "kill all buffers, leaving *scratch* only"
  (interactive)
  (mapcar (lambda (x) (kill-buffer x))
	  (buffer-list))
  (delete-other-windows))

 
;; turn on font-lock mode
(global-font-lock-mode t)
;; enable visual feedback on selections
(setq-default transient-mark-mode t)
 
;; always end a file with a newline
(setq require-final-newline t)
 
;; stop at the end of the file, not just add lines
(setq next-line-add-newlines nil)
 
(when window-system
  ;; enable wheelmouse support by default
  (mwheel-install)
  ;; use extended compound-text coding for X clipboard
  (set-selection-coding-system 'compound-text-with-extensions))
 
;; parenthesis highlighting
(show-paren-mode)

;; Perl mode set up

(assoc "\\.pl$" auto-mode-alist)
(setq auto-mode-alist (cons '("\\.pl$" . perl-mode) auto-mode-alist))

(assoc "\\.pl$" auto-mode-alist)
(setq auto-mode-alist (cons '("\\.PLS$" . perl-mode) auto-mode-alist))

(assoc "\\.pm$" auto-mode-alist)
(setq auto-mode-alist (cons '("\\.pm$" . perl-mode) auto-mode-alist))

;; CPerl Mode for Bioperl and other perly stuff

(defalias 'perl-mode 'cperl-mode)

(load-library "cperl-mode")

(define-key cperl-mode-map "\C-c\C-h" 'cperl-get-help)
(define-key cperl-mode-map "\C-c\C-f" 'cperl-perldoc-at-point)

;;python setup

(global-set-key [f7] 'find-file-in-repository)

(add-hook 'python-mode-hook 'flycheck-mode)

(require 'flycheck)
(define-key flycheck-mode-map (kbd "<f8>") 'flycheck-previous-error)
(define-key flycheck-mode-map (kbd "<f9>") 'flycheck-next-error)

;;enable jedi autocompletion in python
(add-hook 'python-mode-hook 'auto-complete-mode)
(add-hook 'python-mode-hook 'jedi:ac-setup)

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)                      ; optional
(setq jedi:complete-on-dot t)                 ; optional

(defun python-insert-start ()
  "Places #!..python at the start of the script"
  (interactive)
  (goto-char (point-min))
  (insert "#!/usr/bin/python3\n")
)

(defun python-argparse ()
  "puts in an argparse stub"
  (interactive)
  (insert "import argparse\n")
  (insert "\n")
  (insert "\n")
  (insert "def main():\n")
  (insert "    parser = argparse.ArgumentParser(description=\"program\")\n")
  (insert "    parser.add_argument(\"-i\", \"--inputfile\", help=\"inputfile\", required=True)\n")
  (insert "    parser.add_argument(\"-d\", \"--debug\",     help=\"debug\", action=\"store_true\")\n")
  (insert "    args = parser.parse_args()\n")
  (insert "\n")
  (insert "    if args.debug:\n")
  (insert "        print \"# DEBUG=1\"\n")
  (insert "\n")
  (insert "    # Start program\n")
  (insert "    print \"inputfile is %s\" % args.inputfile\n")
  (insert "\n")
  (insert "    with open(args.inputfile, \"r\") as f:\n")
  (insert "        for line in f.readlines():\n")
  (insert "            print line\n")
  (insert "    f.closed\n")
  (insert "\n")
  (insert "if __name__ == \"__main__\":\n")
  (insert "    main()\n")
  (insert "\n")
  (insert "1\n")
  )

(defun pdb-restart ()
  (interactive)
  (comint-insert-send "restart")
  (sleep-for .5)
  (when
      (or
       (last-lines-match "raise Restart.*Restart")
       (last-lines-match "restart")
       (not (get-buffer-process (current-buffer)))
       )

    (let (
      (kill-buffer-query-functions nil );disable confirming for process kill
      (pdbcmd (car-safe (symbol-value (gud-symbol 'history nil 'pdb))))
      (default-directory default-directory)
      )
      (kill-this-buffer)
      (cd default-directory)
      (pdb pdbcmd))
    )
  (comint-insert-send "n")
)
(defun comint-insert-send (input)
  (insert input)
  (comint-send-input)
)
(defun last-lines-match (regexp &optional n)
  (setq n (or n 3))
  (re-search-backward regexp (line-beginning-position (- 0 n)) t))

(add-hook 'pdb-mode-hook '(define-key (current-local-map) "R" 'pdb-restart))
;;(define-key python-mode-map "\C-\M-n" 'python-nav-end-of-block)
;;(define-key python-mode-map "\C-\M-p" 'python-nav-beginning-of-block)


(defun ppp ()
  "Places python pdb set_trace"
  (interactive)
  (insert "    if args.debug:\n")
  (insert "        import pdb; pdb.set_trace()\n")
  (insert "        DB=None; #args.debug=False\n")
)

(defun pppp ()
  "Places python ipdb set_trace"
  (interactive)
  (insert "    import ipdb; ipdb.set_trace()\n")
)

;; Jason's bioperl templates

(defun perl-insert-start ()
  "Places #!..perl at the start of the script"
  (interactive)
  (goto-char (point-min))
  (insert "#!/usr/bin/perl\n")
  (insert "use strict;\n")
  (insert "use warnings;\n")
)


(defun perl-getoptlong ()
  "puts in a Getopt::Long stub"
  (interactive)
  (insert "use IPC::Open3 'open3'; $SIG{CHLD} = 'IGNORE';\n")
  (insert "use Symbol 'gensym';\n")
  (insert "use Getopt::Long;\n\n")
  (insert "my $inputfile;\n")
  (insert "my $debug; my $verbose;\n")
  (insert "GetOptions(\n	   'i|input|inputfile:s' => \\$inputfile,\n           'debug' => \\$debug,\n          'verbose' => \\$verbose,\n          );"))

(defun perl-open3 ()
  "puts in a an open3 stub"
  (interactive)
  (insert "my $cmd = 'ls';\n")
  (insert "my ($w,$r,$e) = (undef,undef,gensym); my $p = open3($w,$r,$e,$cmd);\n")
  (insert "my @o = <$r>; my @e = <$e>;\n")
)

(defun perl-documentation-general (perl-object-name perl-caretaker-name caretaker-email)
  "Places standard bioperl object notation headers and footers"
  (interactive "sName: \nsName of caretaker: \nsEmail: ")
  (insert "# " perl-object-name "\n#\n# Cared for by " perl-caretaker-name " <" caretaker-email ">\n#\n# Copyright " perl-caretaker-name "\n#\n# You may distribute this module under the same terms as perl itself\n\n")
  (insert "# POD documentation - main docs before the code\n\n")
  (insert "=head1 NAME\n\n" perl-object-name " - DESCRIPTION \n\n")
  (insert "=head1 SYNOPSIS\n\nGive standard usage here\n\n")
  (insert "=head1 DESCRIPTION\n\nDescribe the object here\n\n")
  (insert "=head1 AUTHOR - " perl-caretaker-name "\n\nEmail " caretaker-email "\n\nDescribe contact details here\n\n")
  (insert "=head1 CONTRIBUTORS\n\nAdditional contributors names and emails here\n\n")
  (insert "=cut\n\n")
  (insert "\n# Let the code begin...\n\n")
  (insert "use strict;\n")
  (insert "\n\n1;")
  )

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Ubuntu Mono" :foundry "unknown" :slant normal :weight normal :height 120 :width normal)))))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil))
