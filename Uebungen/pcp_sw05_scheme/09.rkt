;;; 9.) Bei Skelettfunden schließt man aus der Länge der Knochen auf die
;;; Körpergröße; und zwar gilt (als statistischer Mittelwert) in cm:
;;; 
;;; * Körpergröße = 69.089 + 2.238 * Oberschenkelknochenlänge bei Männern
;;; * Körpergröße = 61.412 + 2.317 * Oberschenkelknochenlänge bei Frauen
;;;
;;; Ab dem 30. Lebensjahr nimmt die Körpergröße um 0,06 cm pro Jahr ab.
;;;
;;; a) Definieren Sie einen Datentyp human mit den Feldern Alter, Geschlecht
;;; und Oberschenkelknochenlänge.

(define-struct human (
  ;; must be >= 0
  age
  ;; must be either 'male or 'female
  sex
  ;; in centimeters
  thigh-bone-length
))


;;; b) Erstellen Sie eine Funktion b-length, die aus einem Objekt vom Typ human
;;; die vermutete Körpergrösse berechnet.

(define (avg-b-length-from-thigh-bone-length human)
  (let (
      [sex (human-sex human)]
      [bone-length (human-thigh-bone-length human)]
    )
    (cond
      ((symbol=? 'male   sex) (+ 69.089 (* 2.238 bone-length)))
      ((symbol=? 'female sex) (+ 61.412 (* 2.317 bone-length)))
      (else "Only sex 'male and 'female supported")
    )
  )
)

(define (b-length-decrease-due-age human)
  (let (
      [age (human-age human)]
      [edge-age 30]
    )
    (if (> age edge-age)
      (* 0.06 (- age edge-age))
      0
    )
  )
)

(define (b-length human)
  (- (avg-b-length-from-thigh-bone-length human)
     (b-length-decrease-due-age human)
  )
)

(define oetzi (make-human 43 'male  53))
(display "b-length oetzi: ")
(displayln (b-length oetzi))

(define eve   (make-human 24 'female 51))
(display "b-length eve: ")
(displayln (b-length eve))
