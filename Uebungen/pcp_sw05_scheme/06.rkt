;;; 6.) Analysieren Sie die folgende Funktion zur Maut Berechnung

(define (toll total-weight)
  (cond
    ((not (number? total-weight)) "Eingabe muss Zahl sein!")
    ((<= total-weight 0) "Zahl muss größer 0 sein!")
    ((<= total-weight 1000) 20)
    ((<= total-weight 2000) 30)
    ((<= total-weight 5000) 50)
    ((<= total-weight 10000) 100)
    (else 250)))

;;; a) Welchen Sinn haben die beiden ersten Klauseln?
;;
;; Lisp ist dynamisch typisiert, diese sind zur Typen und zur Prüfung des
;; Wertebereichs des `total-weight` Parameters.

(displayln "a.)")
(displayln 
  (toll "Hallo :)")
)

(displayln 
  (toll -1)
)

;;; b) Begründen Sie, weshalb man hier die Reihenfolge der Klauseln nicht ändern darf
;;
;; Die Klauseln werden von oben nach unten nacheinander ausgewertet.
;; Die Erste Klausel deren Bedingung true ergibt wird ausgeführt und
;; es werden anschliessend keine weiteren Klauseln ausgewertet.
;;
;; Dies bedeutet konkret, wenn die erste beiden Klauseln weiter unten wäre
;; würde es einen Fehler geben, wenn etwas komisches als
;; total-weight mitgegeben wurde.
;;
;; Würde die 3 und 4 Klausel getauscht werden würde man auch
;; unter 1000 Kg? Gewicht 30 EUR? als Maut zahlen.

(define (toll2 total-weight)
  (cond
    ((<= total-weight 0) "Zahl muss größer 0 sein!")
    ((not (number? total-weight)) "Eingabe muss Zahl sein!")
    ((<= total-weight 2000) 30)
    ((<= total-weight 1000) 20)
    ((<= total-weight 5000) 50)
    ((<= total-weight 10000) 100)
    (else 250)))

;; Gibt einen Fehler, weil die Klauseln vertauscht wurden!
;
; (displayln 
;   (toll2 "Hallo :)")
; )

(displayln "b.)")
(displayln 
  (toll2 750)
)

;;; c) Nennen Sie ein konkretes Beispiel, bei dem man die Klauseln ändern darf.

(define (state-check state)
  (cond
    ((= state 0) "Start")
    ((= state 1) "Analysis")
    ((= state 2) "Implementation")
    ((= state 3) "Review")
    ((= state 4) "End")
    (else "Invalid")
  )
)
