;;; +theme.el -*- lexical-binding: t; -*-

(setq doom-theme 'doom-gruvbox)
(setq doom-gruvbox-dark-variant 'soft)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
(setq doom-font (font-spec :family "monospace" :font "Source Code Pro Medium" :size 20 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 21))
