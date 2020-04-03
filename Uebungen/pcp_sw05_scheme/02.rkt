;;; 2.) Schreiben Sie in mathematischer Notation und berechnen Sie folgende Formen

;;> (/ 1 (+ 1 1))
; 1/2
; Mathematische Notation: 1 / (1 + 1)
; => Resultat wird als Bruch versucht darzustellen.

;;> (/ 1 (+ 1 (/ 1 (+ 1 1))))
; 2/3
; Mathematische Notation: 1 / (1 + (1 / (+ 1 1)))

;;> (/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 1))))))
; 3/5
; Mathematische Notation: 1 / (1 + (1 / (1 + (1 / (1 + 1)))))

;;; Was fllt bei den Ergebnissen auf?
;
; Fibonacci Abfolge mit Zähler und Nenner

(define (incr-inv-fib n)
  (if (<= n 0)
    1
    (/ 1
       (+ 1 (incr-inv-fib (- n 1)))
    )
  )
)

(define (fib n)
  (denominator (incr-inv-fib n))
)

(displayln (fib 0))
(displayln (fib 1))
(displayln (fib 2))
(displayln (fib 3))
(displayln (fib 4))
(displayln (fib 5))
(displayln (fib 6))
(displayln (fib 7))
(displayln (fib 8))
