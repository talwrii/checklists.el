;; checklist -- a checklist system within emacs

(require 'yasnippet)

(defun checklist-checklists ()
  "Get only those transforms which are for checklists"
  ;;; Evil hack
  (interactive)
  (helm (checklist--settings 'checklist--open-snippet)))

(defun checklist--settings (&optional action)
  (let (result)
    (setq result (checklist--alist-replace helm-source-yasnippet 'candidate-transformer 'checklist--transformer))
    (if action
        (checklist--alist-replace result 'action (cons "Action" action))
      result)))

(defun checklist--alist-replace (alist key value)
  (cons (list key value) (assq-delete-all key alist)))

(defun checklist-view (&optional checklist)
  (interactive)
  (switch-to-buffer-other-window (get-buffer-create "*view-checklist*"))
  (org-mode)
  (erase-buffer)
  (if checklist
      (checklist--insert-snippet checklist)
      (checklist-checklists))
  (other-window -1))

(defun checklist-show ()
  (interactive)
  (switch-to-buffer-other-window (get-buffer-create "*view-checklist*")))

(defun checklist--transformer (candidates)
  (let (result)
    (setq result (helm-yas-get-transformed-list helm-yas-cur-snippets-alist helm-yas-initial-input))
    (checklist--filter result)))

(defun checklist--filter (listing)
  (-filter (lambda (x) (s-starts-with? "ck" (car x)))
           listing))

(defun checklist-create (name)
  "Create a new snipppet"
  (interactive "sSnippet name:")
  (save-window-excursion
    (find-file (concat (car yas/root-directory) "/org-mode/" (s-concat "ck" name)))
    (org-mode)
    (message (format "Run exit-recursive-edit (%s) when done:" (mapconcat 'key-description (where-is-internal 'exit-recursive-edit) ", ")))
    (recursive-edit))
  (yas-reload-all))

(defun checklist-edit ()
  "Edit a checklist"
  (interactive)
  (switch-to-buffer-other-window (get-buffer-create "*checklist-org*"))
  (org-mode)
  (helm (checklist--settings 'checklist--open-snippet)))

(defun checklist--insert-snippet (template)
  (interactive)
  (yas-expand-snippet template helm-yas-point-start helm-yas-point-end))

(defun checklist--open-snippet (template)
  (helm-yas-find-file-snippet-by-template template)
  (org-mode))

(provide 'checklist)
;;; checklist ends here
