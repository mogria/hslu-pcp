;; 6. Aufgabe *
;; Angenommen, man hat eine Liste mit Funktionen zur Berechnung von Eigenschaften eines
;; Rechteckes, hier Fläche und Umfang:

(define rect-calc-list
  (list (lambda (a b) (* a b)) (lambda (a b) (* 2 (+ a b)))))

; Implementieren Sie eine Funktion, der man die Liste mit Funktionen und die Seiten eines
; Rechteckes übergeben kann, dann die Eigenschaften berechnet und ausgibt.
; Eine mögliche Interaktion könnte so aussehen:


(define (calc-a-list func-list width height)
  (define (show l)
    (map displayln l)
    (displayln "finished")
  )
  (show
    (map (lambda (func) (func width height)) func-list)
  )
)
(calc-a-list rect-calc-list 2 3)
; 6
; 10
; finished
(calc-a-list rect-calc-list 5 5)
; 25
; 20
; finished


