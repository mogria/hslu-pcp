;;; 5.) Darf man bei folgenden Beispielen die (cond ...)-Klauseln vertauschen ohne dass sich die Semantik des Programms ändert?

(define temperatur 40)
(define zahl 6)

;; a) Temperaturen
(displayln "a.) ")
(displayln
  (cond
    ((> temperatur 35) "heiss")
    ((> temperatur 25) "warm")
    ((> temperatur 15) "mittel")
    (else "kalt"))

; Nein, hier dark keine Klause verändert werden.
; Wenn z.B. die 1. & 2. vertauscht würden,
; würde "warm" auch bei 40 grad zurückgegeben
)

(displayln "b.) ")
(displayln
  (cond
    ((zero? (remainder zahl 2)) "durch 2 teilbar")
    ((zero? (remainder zahl 3)) "durch 3 teilbar")
    (else "weder durch 2 noch durch 3 teilbar"))

; Auch hier darf man die Klauseln nicht vertauschen,
; denn wenn die zahl 6 ist würde anstatt
; "durch 2 teilbar", "durch 3 teilbar zurückgegeben.
)
