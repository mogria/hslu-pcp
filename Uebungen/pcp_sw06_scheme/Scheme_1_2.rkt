;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname Scheme1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f () #f)))
;1)
;Gliedern Sie folgende Terme im Editor und verfolgen Sie die Berechnung jedes Terms mit dem Stepper:
;a)
;(42+(25-3*4)):11
;b)
;(24+32):7+3*(17-15)
;c)
;34428 : 38 - (1103 - 197)
;
;Die Syntax der Ausdrücke ist nicht korrekt. Die Ausdrücke müssen alle in Klammern gesetzt werden.
;a)
;(/(+ 42(- 25 (* 3 4))) 11)
; = 5
;b)
;(+(/(+ 24 32) 7) (* 3(- 17 15)))
; = 14
;c)
;(- (/ 34428 38) (- 1103 197))
; = 0
;
;------------------------------------------------------------------------------------------------------
;2)
;Schreiben Sie in mathematischer Notation und berechnen Sie folgende Formen
;(/ 1 (+ 1 1))
; = 0.5
; 1 : (1+1)
;
;(/ 1 (+ 1 (/ 1 (+ 1 1))))
; = 0.666666...
; 1 : (1 + (1 : (1+1))) --> 0.666...
;
;(/ 1 (+ 1 (/ 1 (+ 1 (/ 1 (+ 1 1))))))
; = 0.6
; 1 : (1 + (1 : (1 + (1 : (1+1))))) --> 0.60000024
;
;Was fällt bei den Ergebnissen auf?
;Werte werden gerundet nach einer bestimmten Anzahl Nullen.
;
;
;-----------------------------------------------------------------------------------------------------
;
;3)
;Definieren Sie Länge und Breite eines Rechtecks und berechnen Sie dessen Diagonale.
; Satz von Pytagoras: a^2 + b^2 = c^2
;
;L = 4, B = 3

;(define (area L B) (* L B))
;(area 4 3)
;
;(define (diaganal L B) (sqrt (+ (* L L) (* B B))) ) 
;(diaganal 4 3)
;
;------------------------------------------------------------------------------------------------------
;
;4)
;Gegeben ist der komplexe Term: -(10a + 20b - 40c) - (-(7a - 14c) - (-(15b - 4c) - (27a – 5b)))
;a) Erstellen Sie eine Funktion, der man die Parameter a, b, c übergeben kann und diese dann den Term berechnet.
;
;
;(define (komplex a b c) (-(-(+(* 10 a)(-(* 20 b)(* 40 c))))       (-(-(* 7 a)(* 14 c))    (-(-(-(* 15 b)(* 4 c)) (-(* 27 a)(* 5 b)))))) )
;(komplex 1 1 1)
;
;b) Wie lassen sich die Koeffizienten von a, b und c einfach zusammen zählen?
;
;
;(define (komplexFirst a b) (- (- (* 27 a) (* 5 b))))
;(define (komplexSecond a b c) (- (- (- (* 15 b)(* 4 c)))))
;(define (komplexThird a c) (- (- (- (* 7 a)(* 14 c)))))
;(define (komplexFourth a b c) (- (+ (* 10 a)(- (* 20 b)(* 40 c)))))
;
;Hauptfunktion:
;(define (komplexMain a b c) (+ (komplexFourth a b c)(komplexThird a c)(komplexSecond a b c)(komplexFirst a b)))
;
;(komplexFirst 1 1)
;(komplexSecond 1 1 1)
;(komplexThird 1 1)
;(komplexFourth 1 1 1)
;(komplexMain 1 1 1)
;
;
;-------------------------------------------------------------------------------------------------------------------------------------------------
;
;5)
;Darf man bei folgenden Beispielen die (cond ...)-Klauseln vertauschen ohne dass sich die Semantik des Programms ändert?
;Temperaturen
;(cond
;((> temperatur 35) "heiss")
;((> temperatur 25) "warm")
;((> temperatur 15) "mittel")
;(else "kalt"))
;(define temperatur 35)
;
;Nein, das Programm ändert sich, weil die Abarbeitung von oben nach unten stattfindet.
;Beim ersten "True" wird die Funktion abgebrochen.
;
;b) Teilbar
;(cond
;((zero? (remainder zahl 2)) "durch 2 teilbar")
;((zero? (remainder zahl 3)) "durch 3 teilbar")
;(else "weder durch 2 noch durch 3 teilbar"))
;(define zahl 12)
;
;------------------------------------------------------------------------------------------------------------------------------------------------
;
;6. Aufgabe *
;Analysieren Sie die folgende Funktion zur Maut Berechnung
;(define (toll total-weight) (cond
;((not (number? total-weight)) "Eingabe muss Zahl sein!") ((<= total-weight 0) "Zahl muss größer 0 sein!")
;((<= total-weight 1000) 20)
;((<= total-weight 2000) 30)
;((<= total-weight 5000) 50) ((<= total-weight 10000) 100) (else 250)))
;(toll "")
;a) Welchen Sinn haben die beiden ersten Klauseln?
;   Es wird geprüft ob der Wert ein eZahl ist oder einen String. Danach wird geprüft ob die Zahl grösser als 0 ist.
;
;
;b) Auch hier ist es so, dass beim ersten TRUE die Funktion abgebrochen wird. Weiter wird zuerst geprüft ob es eine Zahl ist.
;   Erfolgt dies erst am Schluss, hat der Compiler ein Problem (Typenprüfung erfolgt zur Laufzeit)
;
;c) Z.B beim Prädikat Equals --> gibt erst True wenn effektiv gleich. (f)
;
;
;-----------------------------------------------------------------------------------------------------------------------------------------------
;7.)
;Gegeben ist
;(* (cond ((> a b) a) ((< a b) b)
;(else -1)) (+ a 1))
;
;a) Handelt es sich um einen korrekten Scheme-Ausdruck? Begründung!
;   Nein, die Funktion muss noch definiert werden. ZUdem fehlen die Eingabeparameter. (f)
;
;b) Definieren Sie a und b jeweils so, dass alle Klauseln einmal zutreffen. Welche Ergebnisse
;erhalten Sie?
;
;(define (test a b)
;(*
;(cond ((> a b) a) ((< a b) b)
;(else -1)) (+ a 1)
;           ))
;
;(test 3 4)
;=16

;(test 4 3)
; = 20

;(test 2 2)
;= -3
;
;----------------------------------------------------------------------------------------------------------
;
;8)
;Erstellen Sie eine Funktion für die Abstandsberechnung vom Ursprung (0|0).
;Nehmen Sie dazu das Beispiel 2D Punkt (Folie in Scheme-2) als Vorlage.
;
;
;
;(define-struct point (x y))
;(define (square x) (* x x))
;(define (distance-to-origin point)
;  (sqrt
;    (+
;      (square (point-x point))
;      (square (point-y point))
;    )
;  )
;)
;(define p (make-point 6 8))
;(distance-to-origin p)
;
;
;-----------------------------------------------------------------------------------------------------------
;
;9)
;Bei Skelettfunden schließt man aus der Länge der Knochen auf die Körpergröße; und zwar gilt (als statistischer Mittelwert) in cm:
; - Körpergröße = 69.089 + 2.238 * Oberschenkelknochenlänge bei Männern
; - Körpergröße = 61.412 + 2.317 * Oberschenkelknochenlänge bei Frauen
;Ab dem 30. Lebensjahr nimmt die Körpergröße um 0,06 cm pro Jahr ab.
;
;a) Definieren Sie einen Datentyp human mit den Feldern Alter, Geschlecht und Oberschenkelknochenlänge.
;
;
;(define-struct human (
;                     alter
;                     geschlecht
;                     oberschenkelknochenlaenge
;                     )
;  )
;
;b) Erstellen Sie eine Funktion b-length, die aus einem Objekt vom Typ human die vermutete Körpergrösse berechnet.
; 
;

                      
;(define-struct human (bonelength sex))
;(define patrick (make-human 5 'male))
;(define (b-length human)
;  (cond
;      ((symbol=? 'male (human-sex human)) (* (+ 69.089 2.238)(human-bonelength human)))
;      ((symbol=? 'female (human-sex human)) (* (+ 61.412 2.317)(human-bonelength human)))
;      (else "Only sex 'male and 'female supported")
;  )    
;)     
;(b-length patrick)

(define-struct human (age bonelength sex))
(define patrick (make-human 20 40 'male))
(define (b-length human)
  (cond
      ((symbol=? 'male (human-sex human)) (- (+  69.089 (* 2.238 (human-bonelength human)))((>= 30 (human-age human) 1)(human-age human))))
      ((symbol=? 'female (human-sex human)) (+  61.412 (* 2.317 (human-bonelength human))))
      (else "Only sex 'male and 'female supported")
  )    
)     
(b-length patrick)



