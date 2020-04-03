;;; 3.) Definieren Sie Länge und Breite eines Rechtecks und berechnen Sie dessen Diagonale.
(define (square x) (* x x))
(define (diagonal width height) 
  (sqrt (+ (square width) (square height)))
  )


(define width 7)
(define height 9)

(display "The diagonal of ")
(display width)
(display " and ")
(display height)
(display " is ")
(display (diagonal width height))

