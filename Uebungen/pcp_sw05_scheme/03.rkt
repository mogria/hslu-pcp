;; Die ersten drei Zeilen dieser Datei wurden von DrRacket eingefügt. Sie enthalten Metadaten
;; über die Sprachebene dieser Datei in einer Form, die DrRacket verarbeiten kann.
#reader(lib "advanced-reader.rkt" "deinprogramm" "sdp")((modname |03|) (read-case-sensitive #f) (teachpacks ()) (deinprogramm-settings #(#f write repeating-decimal #f #t none datum #f ())))
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

