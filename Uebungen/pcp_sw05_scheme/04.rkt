;;; 4.) Gegeben ist der komplexe Term:
;;
;; -(10a + 20b - 40c) - (-(7a - 14c) - (-(15b - 4c) - (27a – 5b)))
;;
;;; a) Erstellen Sie eine Funktion, der man die Parameter a, b, c übergeben kann und diese dann den Term berechnet.

;; a=3
;; b=5
;; c=(-2)
;;
;; Ersetzt
;; -(10*3 + 20*5 - 40*(-2)) - (-(7*3 - 14*(-2)) - (-(15*5 - 4*(-2)) - (27*3 - 5*5)))
;; => 300


(define a 3)
(define b 5)
(define c -2)


(define (funktion a b c)
  (-
    (- (+ (* 10 a) (* 20 b) (* -40 c)))
    (- (- (- (* 7 a) (* 14 c)))
      (- (- (- (* 15 b) (* 4 c)))
         (- (* 27 a) (* 5 b))
      )
    )
  )
)

(writeln 'a.)
(writeln (funktion a b c))

;;;b) Wie lassen sich die Koeffizienten von a, b und c einfach zusammen zählen?

(define (co-add ca a cb b cc c)
  (+
    (* ca a)
    (* cb b)
    (* cc c)
  )
)

(define (funktion2 a b c)
  (-
    (- (co-add 10 a 20 b -40 c))
    (-
      (- (co-add 7 a 0 b -14 c))
      (-
        (- (co-add  0 a 15 b -4 c))
        (co-add 27 a -5 b  0 c)
      )
    )
  )
)

;; vereinfacht
(define (funktion3 a b c)
  (-
    (co-add -10 a -20 b 40 c)
    (co-add  -7 a   0 b 14 c)
    (co-add   0 a  15 b -4 c)
    (co-add  27 a  -5 b  0 c)
  )
)

(writeln 'b.)
(writeln (funktion3 a b c))
