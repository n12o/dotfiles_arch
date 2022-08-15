;;; +editor.el -*- lexical-binding: t; -*-

;; line numbers
(setq display-line-numbers-type 'relative) ; best


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Flash on edit - evil goggles
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq evil-goggles-pulse t)
(setq evil-goggles-enable-delete t)

(custom-set-faces!
 '(evil-goggles-default-face :background "DarkOliveGreen"))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Multi-Cursor
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; TODO Combine evil-mc and evil-multiedit 

(map!
 (:when (featurep! :editor multiple-cursors)
  :prefix "g"
  :nv "z" #'my-mc-hydra/body))

(defhydra my-mc-hydra (:color pink
                       :hint nil
                       :pre (evil-mc-pause-cursors))
  "
^Match^            ^Line-wise^           ^Manual^
^^^^^^----------------------------------------------------
_Z_: restore             _K_: match-symbol-and-prev  _z_: toggle-or-restrict-region
_A_: match-all           _h_: toggle-marker-here     _p_: prev
_j_: match-and-next           ^ ^                    _n_: next
_k_: match-and-prev           ^ ^                    _q_: abort
_J_: match-symbol-and-next

Current pattern: %`evil-mc-pattern

"
  ("Z" #'evil-multiedit-restore)
  ("A" #'evil-multiedit-match-all)
  ("j" #'evil-multiedit-match-and-next)
  ("k" #'evil-multiedit-match-and-prev)
  ("J" #'evil-multiedit-match-symbol-and-next)
  ("K" #'evil-multiedit-match-symbol-and-prev)
  ("h" #'evil-multiedit-toggle-marker-here)
  ("z" #'evil-multiedit-toggle-or-restrict-region)
  ("n" #'evil-multiedit-next)
  ("p" #'evil-multiedit-prev)
  ("q" #'evil-multiedit-abort "quit" :color blue)
  ("e" #'evil-multiedit-ex-match)
  ("<escape>" #'evil-multiedit-abort "quit" :color blue))
