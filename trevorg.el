(require `org)

;; VARIABLES
(defcustom trevorg-keymap-prefix "C-c C-."
  "The prefix for trevorg-mode key bindings."
  :type 'string
  :group 'orgfiles)

;; FUNCTIONS
(defun trevorg-hello-world ()
  (interactive)
  (message "hello world"))

(defun trevorg--key (key)
  (kbd (concat trevorg-keymap-prefix " " key)))

;; MINOR MODE CONFIG
(define-minor-mode trevorg-mode
  "Toggles global trevorg-mode."
  nil
  :global t
  :group 'orgfiles
  :lighter " trevorg"
  :keymap
  (list (cons (trevorg--key "t") #'trevorg-hello-world))

  (if trevorg-mode
    (message "trevorg turned on!")
    (message "trevorg turned off!")))

;; HOOKING
;; trevorg-mode-hook is created by define-minor-mode macro above
;; it will be run after the body of the define-minor-mode
(add-hook 'trevorg-mode-hook (lambda () (message "this is a hook")))

(provide `trevorg-org)
