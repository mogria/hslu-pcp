;; 3. Aufgabe *
;; a) Was ist die Ausgabe des folgenden Scheme-Programms?

(define a 42)
(let ((a 1)
     (b (+ a 1)))
  b)

;; 43

(let* ((a 1)
        (b (+ a 1)))
   b)
;; 2

;;; 43 und dann 2

;; b) Erklären Sie, warum sich die beiden Ausdrücke unterscheiden.
;; (let ) (ohne Stern) bindet die Variablen erst innerhalb des Ausdrucks und beeinflussen weitere Variablendefinitionen nicht
;; (lei* ) (mit stern) werden die Variablen sofort gebunden und beeinflussen die nächste Variablendefinitionen.

