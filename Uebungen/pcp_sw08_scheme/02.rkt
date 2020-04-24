;; 2. Aufgabe *
;; Sie kennen die Fibonacci-Folge:
;; Die Definition einer strukturellen Rekursion könnte so aussehen

(define (fib n)
  (cond
    ((or (= n 0) (= n 1)) n)
    (else (+ (fib (- n 1))
             (fib (- n 2)))))
  )

; a) Implementieren Sie eine Rekursion mit Akkumulator. Nutzen Sie dazu die local Definition.
(define (fib_acc n)
  (local (
    (define (acc c n f p)
      (cond 
        [(>= c n) f]
        [else (acc (+ c 1) n (+ f p) f)]
      )
    )
  ) (acc 1 n 1 0))
)

;; Hinweis: beide haben keinen < 0 check und sind dann nicht wohldefiniert rekursiv.

; b) Führen Sie Vergleich Tests mit und ohne Akkumulator durch. Welche Unterschiede sehen Sie?

(displayln "fib.)")
; (displayln (fib -1)) ; stack-overflow? nicht tail recursive (2 aufrufe, einer nicht am ende)
(displayln (fib 0))
(displayln (fib 1))
(displayln (fib 12))
(displayln "fib 40.)")
(time (displayln (fib 40)))
(displayln "fib_acc.)")
; (displayln (fib_acc 0)) 
(displayln (fib_acc 0)) 
(displayln (fib_acc  1))
(displayln "fib_acc 40.)")
(time (displayln (fib_acc 40)))

;; Die Implementation mit der Rekursion mit dem Akkumulator ist um einiges effizienter.
;; Die Strukturelle Rekursion führt hier dazu, dass viele Sachen doppelt berechnet werden müssen.
