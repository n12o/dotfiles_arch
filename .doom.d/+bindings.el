;;; +bindings.el -*- lexical-binding: t; -*-


(map! (:leader
       ":" #'vterm
       ";" #'vterm-other-window))

(map! (:leader
       "SPC" #'counsel-M-x))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; windows
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(map!
 "M-\[" #'evil-window-increase-width
 "M-\]" #'evil-window-decrease-width)

(map!
 (:leader
  "w o" #'ace-delete-window        ; selects window to kill
  "w O" #'ace-delete-other-windows ; selects window to keep
  "w s" #'evil-window-vsplit
  ))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Multi-cursor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(map!
 "M-j" #'evil-mc-make-cursor-move-next-line
 "M-k" #'evil-mc-make-cursor-move-prev-line)


;; TODO Insert org mode todo


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Pomidor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; (map!
;;  (:leader
;;   "t t" #'(lambda ()
;;             (interactive)
;;             (pomidor)
;;             (pomidor-hydra/body))))



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(map!
 (:leader
  "n i" #'org-insert-todo-heading
  ))

(map!
 (:leader
  "n b" #'org-toggle-narrow-to-subtree
  ))
