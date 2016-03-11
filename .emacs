;;; James Wu's emacs file
; 1/15/2014
(add-to-list 'load-path "~/.emacs.d/lisp/")
(require 'go-mode-load)
(add-hook 'before-save-hook #'gofmt-before-save)
;;

;;; (load-library "p4")
(load-library "google-c-style")
(add-hook 'c-mode-common-hook 'google-set-c-style)
(setq line-number-mode t)
(setq column-number-mode t)

;;; Let ediff split side by side.
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-merge-split-window-function 'split-window-horizontally)
;; only hilight current diff:
;;(setq-default ediff-highlight-all-diffs 'nil)
;; ignore whitespaces.
(setq ediff-diff-options "-w")

;;; Prevent Extraneous Tabs
(setq-default indent-tabs-mode nil)

(global-set-key "\C-j" 'goto-line)
(global-set-key "\C-xq" 'query-replace)
; (global-set-key "\C-v" 'scroll-up)
; (global-set-key "\M-v" 'scroll-down)

(defun jwu-dbg-lisp ()
  "Checks the buffer name to get the filename; If extension is {h,hpp}, inserts
include guards and other header file information.  If extension is {c,cpp,cc},
it only includes basic header information"
  (interactive)
  (let* ((filename (buffer-file-name))
         (basename (file-name-sans-extension filename))
         (extension (file-name-extension filename)))
    (goto-char (point-min))
    (insert basename)))

;; insert a include protection guard pair. 
;; WARNING the root path is hardcoded to jwu/src/depot!!
(defun add-guard-str (basename)
  (interactive)
  (string-match "jwu/src/depot/" basename)
  (let* ((zup_path (substring basename (match-end 0) nil))
         (ident_str (replace-regexp-in-string "/" "_" zup_path))
         (guard_str (concat (upcase ident_str) "_H_")))
    (concat "#ifndef " guard_str "\n"
            "#define " guard_str  "\n\n\n"
            "\n\n#endif  // " guard_str "\n")))

;; autoinsert C/C++ header
(define-auto-insert
  (cons "\\.\\([Hh]\\|hh\\|hpp\\)\\'" "My C / C++ header")
  '(nil
    "// Copyright " (format-time-string "%Y") ", Upthere Inc.\n"
    "// All rights reserved.\n"
    "//\n"
    "//\n"
    "// Author: jwu@upthere.com (James Wu)\n"
    "//\n"
    "// Description:\n"
    (let* ((filename (buffer-file-name))
           (basename (file-name-sans-extension filename))
           (extension (file-name-extension filename)))
      (add-guard-str basename))
    ))

;; auto insert C/C++
(define-auto-insert
  (cons "\\.\\([Cc]\\|cc\\|cpp\\)\\'" "My C++ implementation")
  '(nil
    "// Copyright " (format-time-string "%Y") ", Upthere Inc.\n"
    "// All rights reserved.\n"
    "//\n"
    "// " (file-name-nondirectory buffer-file-name) "\n"
    "//\n"
    "// Author: jwu@upthere.com (James Wu)\n"
    "//\n"
    (let* ((noext (substring buffer-file-name 0 (match-beginning 0)))
           (nopath (file-name-nondirectory noext))
           (ident (concat nopath ".hpp")))
      (if (file-exists-p ident)
          (concat "#include \"" ident "\"\n")))
    "//\n"
    ))

;; http://stackoverflow.com/questions/3822473/p4config-with-emacs
;; -diff
(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))
    (ediff file1 file2)))
(add-to-list 'command-switch-alist '("-diff" . command-line-diff))

;; -merge
(defun command-line-merge (switch)
  (let ((base (pop command-line-args-left))
        (sccs (pop command-line-args-left))
        (mine (pop command-line-args-left))
        (merg (pop command-line-args-left)))
   (ediff-merge-with-ancestor sccs mine base () merg)))
(add-to-list 'command-switch-alist '("-merge" . command-line-merge))


;; iso-8859-1 as default encoding
(set-terminal-coding-system 'iso-latin-1)