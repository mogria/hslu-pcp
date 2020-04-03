;;; 8.) Strukturen
;;; Erstellen Sie eine Funktion für die Abstandsberechnung vom Ursprung (0|0).
;;; Nehmen Sie dazu das Beispiel 2D Punkt (Folie in Scheme-2) als
;;; Vorlagedefine-struct point (x y))

(define-struct point (x y))

(define (square x) (* x x))

(define (distance-to-origin point)
  (sqrt
    (+
      (square (point-x point))
      (square (point-y point))
    )
  )
)



(define p (make-point 6 8))
(display (distance-to-origin p))
