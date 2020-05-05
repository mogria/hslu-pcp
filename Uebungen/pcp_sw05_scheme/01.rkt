;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname |01|) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;;; 1.) Gliedern Sie folgende Terme im Editor und verfolgen Sie die Berechnung jedes Terms.
(require racket/trace)
(define !+ +)
(define !- -)
(define !* *)
(define !/ /)
(trace !+ !- !* !/)
; Racket won't let me trace + and - directly!
;   set!: cannot mutate module-required identifier in: +

;;; a) (42 + (25 - 3 * 4)) : 11

(displayln "a.)")
(displayln (!/
             (!+ 42 (!- 25 (!* 3 4)))
             11
           ))
; >(!* 3 4)
; <12
; >(!- 25 12)
; <13
; >(!+ 42 13)
; <55
; >(!/ 55 11)
; <5

;;; b) (24 + 32) : 7 + 3 * (17 - 15)
(displayln "b.)")
(displayln (!+
             (!/ (!+ 24 32) 7)
             (!* 3 (!- 17 15)))
           )

; >(!+ 24 32)
; <56
; >(!/ 56 7)
; <8
; >(!- 17 15)
; <2
; >(!* 3 2)
; <6
; >(!+ 8 6)
; <14

;;; c) 34428 : 38 - (1103 - 197)
(displayln "c.)")
(displayln (!/
             34428
             (!- 38 (!- 1103 197))
           ))

; >(!- 1103 197)
; <906
; >(!- 38 906)
; <-868
; >(!/ 34428 -868)
; <-8607/217
