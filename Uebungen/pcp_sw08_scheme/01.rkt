;; Lokale Definitionen und Lexikalisches Scoping
;; 1. Aufgabe
;; Sie haben das Sortierens durch Einfügen aus „Programmierübung zu Scheme 3+4“ mit einem
;; zusätzlichen Parameter implementiert:

; ; Sortieren durch Einfügen
; (define (sort-a-list op a-list)
;   (cond
;     ((empty? a-list) empty)
;     (else (insert op (first a-list)
;                   (sort-a-list op (rest a-list))))
;     ))
;
; ; Einfügen in sortierter Liste
; (define (insert op item a-list)
;   (cond
;     ((empty? a-list) (list item))
;     ((op item (first a-list)) (cons item a-list))
;     (else (cons (first a-list) (insert op item (rest a-list))))
;     ))
;

; Die Hilfsfunktion insert wird eigentlich nur innerhalb der Funktion sort-by-insert
; benötigt. Integrieren Sie deshalb die Hilfsfunktion insert als lokale Funktion in die Funktion
; sort-by-insert


; Sortieren durch Einfügen
(define (sort-a-list op a-list)
  (local (
      ; Einfügen in sortierter Liste
      (define (insert op item a-list)
        (cond
          ((empty? a-list) (list item))
          ((op item (first a-list)) (cons item a-list))
          (else (cons (first a-list) (insert op item (rest a-list))))
        )
      )
    )
    (cond
      ((empty? a-list) empty)
      (else (insert op (first a-list)
            (sort-a-list op (rest a-list))))
    )
  )
)

(displayln (sort-a-list < '(1 3 4 4)))
(displayln (sort-a-list < '(4 2 5 -2)))
(displayln (sort-a-list >= '(4 2 5 -2)))
