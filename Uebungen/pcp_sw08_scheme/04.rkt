;; Anonyme Funktionen
;; 4. Aufgabe *
;; a) Was ist die Ausgabe des folgenden Scheme-Programms?

(define x 1)
(define y 5)
((lambda (x y)
  (+ (* 2 x) y))
y x)
;11

((lambda (a b)
  (+ (* 2 x) y))
 y x)
;7

;; b) Erklären Sie, warum sich die beiden Ausdrücke unterscheiden.

; Der erste lambda-Ausdruck erstellt ein neues scope für die Variablen x und y
; und die global definierten variablen x & y werden überdeckt.  Das heisst es
; wird (+ (* 5) 1) gerechnet (x & y werden ja beim übergeben vertauscht).
; Dies ergibt somit 11

; Der zweite lambda-Ausdruck erstellt ein neues scope für die Variablen a und b. Die globalen variablen x und y werden aber nicht überdeckt.
; Das heisst es wird (+ (* 2 1) 5) gerechnet (die werte der globalen variablen).
; Dies ergibt somit 7
