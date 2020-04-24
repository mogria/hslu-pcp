;;Funktionen mit Gedächtnis
;;(Einstellung in DrRacket: "Advanced Student")
;;7. Aufgabe
;; Wir haben ein globales Verzeichnis mit Vornamen und Telefonnummer von Personen:

(define my-phone-dir (list (list 'Adam 4711) (list 'Eva 4712)))

;; a) (siehe unten)

(define (filter-by-name phone-dir name)
  (filter (lambda (entry) (symbol=? (first entry) name)) phone-dir)
)

;; Ein Programm soll zwei Möglichkeiten bieten:
;; 1. Suchen der Nummer anhand des Vornamens, etwa durch

;; b) Schreiben Sie die Funktion look-at für das Suchen der Nummer anhand des Vornamens 

(define (look-at phone-dir name)
  (let (
      [filtered (filter-by-name phone-dir name)]
    ) (cond
        [(empty? filtered) #f]
        [else (first (rest (first filtered)))]
    )
  )
)

;; 2. Hinzufügen einer neuen Person mittels Vornamen und Nummer im globalen Verzeichnis

; hinzufuegen: symbol zahl --> void

;; c) Schreiben Sie die Funktion add-entry für das Hinzufügen einer neuen Person mit Vornamen und Nummer.
(define (add-entry name number)
  (set! my-phone-dir (cons (list name number) my-phone-dir))
)

;; a) Warum widerspricht diese Interaktion fundamental unserem bisherigen funktionalen Programmiergrundsatz?
(displayln (look-at my-phone-dir 'Adam))
;; 4711
(displayln (look-at my-phone-dir 'Erna))
;; #false
(displayln (add-entry 'Erna 4715))
;;(void)
;; dies bedeutet, dass die Funktion add-entry nichts zurück gibt
(displayln (look-at my-phone-dir 'Erna))
;;4715

;; Add-entry mutiert die variable my-phone-dir.
;; Normalerweise verwendet man nur immutable objekte in der funktionalen programmierung.
;; Auch haben wir hier das problem das wir mit add-entry nur einträge in my-phone-dir machen können
