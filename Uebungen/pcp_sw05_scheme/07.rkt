;;; 7.) Gegeben ist

(define (ex7 a b)
  (*
    (cond
      ((> a b) a)
      ((< a b) b)
      (else -1)
    )
    (+ a 1)
  )
)

;;; a) Handelt es sich um einen korrekten Scheme-Ausdruck? Begründung!

;; Ja das Ergebnis der Bedingung
;; (die grössere der beiden Variablen a & b,
;; oder -1 falls sie gleich sind), wird
;; mit (a + 1) multipliziert.


;;; b) Definieren Sie a und b jeweils so, dass alle Klauseln einmal zutreffen. Welche Ergebnisse erhalten Sie?
(displayln "b.)")
(displayln (ex7  0 0))   ; -1 = -1 * ( 0 + 1)
(displayln (ex7  1 0))   ;  2 =  1 * ( 1 + 1)
(displayln (ex7  1 1))   ; -2 = -1 * ( 1 + 1)
(displayln (ex7  3 2))   ; 12 =  3 * ( 3 + 1)
(displayln (ex7 -3 2))   ; -4 =  2 * (-3 + 1)
(displayln (ex7  2 5))   ; 15 =  5 * ( 3 + 1)
