
;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq! user-full-name "Nikita Klimenko"
      user-mail-address "nikitaklimenko.good@gmail.com")

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;;

;; TODO remove evil mode in vterm
;; (add-hook 'vterm-mode-hook #'turn-off-evil-mode)
;;

;; start maximized
;; (add-hook 'window-setup-hook #'toggle-frame-fullscreen)

(add-to-list 'after-make-frame-functions #'toggle-frame-fullscreen)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Git
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(add-hook 'magit-mode-hook #'magit-delta-mode)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Org mode
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; define todo keywords
(after! org
  (setq! org-todo-keywords '((sequence "TODO(t)" "NEXT(n)" "WAITING(w)" "INACTIVE(i)" "MEETING(m)" "|" "DONE(d)" "CANCELLED(p)")))
(setq! org-todo-keyword-faces
        '(("[-]" . +org-todo-active)
        ("MEETING" . +org-todo-active)
        ("STRT" . +org-todo-active)
        ("NEXT" . +org-todo-onhold)
        ("WAITING" . +org-todo-onhold)
        ("INACTIVE" . +org-todo-onhold)
        ("[?]" . +org-todo-onhold)
        ("WAIT" . +org-todo-onhold)
        ("HOLD" . +org-todo-onhold)
        ("PROJ" . +org-todo-project)
        ("NO" . +org-todo-cancel)
        ("CANCELLED" . +org-todo-cancel)
        ("KILL" . +org-todo-cancel))
  ))



;; set default directories
(setq! org-directory "~/org/"
       ;; recursively find files in directories under org-directory
       org-agenda-files (directory-files-recursively (eval org-directory) "\.org$")
       ;; ;; additionally ignore this directory in projectile
       org-roam-directory "~/org/roam"
       )

(setq! projectile-indexing-method 'native)

(add-hook 'org-mode-hook #'+word-wrap-mode)


(setq! org-roam-capture-templates `(("d" "default" plain "%?"
  :target (file+head "${slug}.org"
                     "#+title: ${title}\n")
  :unnarrowed t)))

;; flycheck seems useless in org mode
;; TODO maybe I don't need to append `not' twice?
(setq! flycheck-global-modes
       (if (boundp 'flycheck-global-modes)
           ;; append to allow editing variable across files
           (append '(not org-mode) flycheck-global-modes)
         '(not org-mode)))

(setq org-archive-location (concat "_archive/archive-%s"
                                   ".org_archive::"))

(setq! org-pomodoro-manual-break t)
(setq! org-pomodoro-length 25) ; 25 min pomodoro length
(setq! org-pomodoro-short-break-length 5) ; 5 minutes long break time
(setq! org-pomodoro-long-break-length 20) ; same as short break

(setq! org-journal-file-type 'weekly)
(setq! org-journal-file-format "%Y-%W.org")
(setq! org-journal-time-format "")
(setq! org-journal-date-format "%A, %m/%d/%Y")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Pomodoro
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://github.com/TatriX/pomidor#customization

;; disable pomodoro ticking sounds
(setq! pomidor-sound-tick nil
      pomidor-sound-tack nil)

;; default regular work/break
(setq! pomidor-seconds (* 25 60)) ; 25 minutes for the work period
(setq! pomidor-break-seconds (* 5 60)) ; 5 minutes break time

;; default long work/break
(setq! pomidor-breaks-before-long 3) ; wait 4 short breaks before long break
(setq! pomidor-long-break-seconds (* 5 60)) ; 5 minutes long break time

;; default faces
;; for a full list of available faces see `customize' or search for `defface' in the source code
(after! pomidor
  (set-face-attribute 'pomidor-break-face nil :foreground "#00ff00")
  (set-face-attribute 'pomidor-overwork-face nil :foreground "#00abff")
  (set-face-attribute 'pomidor-skip-face nil :foreground "#abbac3")
  (set-face-attribute 'pomidor-work-face nil :foreground "#ff0000"))

;; Hydra

(defhydra pomidor-hydra (:color pink
                         :hint nil)

  "
^Match^            ^Line-wise^           ^Manual^
^^^^^^----------------------------------------------------
_h_: hold             _H_: history          _s_: save
_u_: unhold           _n_: history next     _q_: quit
_r_: reset            _p_: history prev

"
  ("b" #'(lambda() (interactive)(pomidor-break)(require 'org)(org-clock-out)))
  ("u" #'pomidor-unhold)
  ("h" #'pomidor-hold)
  ("r" #'pomidor-reset)
  ("H" #'pomidor-history)
  ("n" #'pomidor-history-next)
  ("p" #'pomidor-history-previous)
  ("s" #'pomidor-save-session)
  ("<RET>" #'(lambda() (interactive)(require 'org)(org-clock-goto)) :color blue)
  ("q" #'pomidor-quit "quit" :color blue)
  ("<escape>" #'pomidor-quit "quit" :color blue))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; other config files
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(load! "+bindings")
(load! "+laptop")
(load! "+theme")
(load! "+editor")
