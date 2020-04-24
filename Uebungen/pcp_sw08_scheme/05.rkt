;; 5. Aufgabe *
;; Angenommen, man hat die Liste

(define a-list (list (list 1 2 3) (list 1 2) (list 1 2 3 4)))

; und möchte jede Liste mit 0 beginnen lassen. Wie kann man dies erreichen,
; ohne, dass extra eine Funktion (mit Namen) geschrieben werden muss?

(displayln
  (cons 0
    (map
      (lambda (list) (cons 0 list))
      a-list)
  )
)
