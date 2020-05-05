;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Scheme_5_6) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;#lang racket
;1.) Aufgabe
;Sie haben das Sortierens durch Einfügen aus „Programmierübung zu Scheme 3+4“ mit einem zusätzlichen Parameter implementiert:
; Sortieren durch Einfügen

;(define (sort-a-list op a-list)
;(cond
;  ((empty? a-list) empty)
;  (else (insert op (first a-list)
;                (sort-a-list op (rest a-list))))
;))

; Einfügen in sortierter Liste

(define (insert op item a-list)
(cond
  ((empty? a-list) (list item))
  ((op item (first a-list)) (cons item a-list))
  (else (cons (first a-list) (insert op item (rest a-list)))) ))

;Die Hilfsfunktion insert wird eigentlich nur innerhalb der Funktion sort-by-insert benötigt.
;Integrieren Sie deshalb die Hilfsfunktion insert als lokale Funktion in die Funktion sort-by-insert.

(define (sort-a-list num-list sortFunction)                                         ; --> Funktion definieren param: num-List und sortFunction
  (local                                                                           ; --> definiert lokaler Namen
    (
     (define (insert item a-list sortFunction)                                     ; --> lokal definierte Funktion insert
      (cond                                                                        ; --> condition
        ((empty? a-list) (list item))                                              ; --> überprüfen ob Liste leer ist
        ((sortFunction item (first a-list)) (cons item  a-list))                   ; --> Aktuelles Item vergleichen mit erstem Element der Liste, wenn false wird Element an erster Stelle eigefügt
        (else (cons (first a-list) (insert item (rest a-list) sortFunction))))))   ; --> sonst (Paar) erstes Element der Liste mit dem Aufruf von Insert
    (cond                                                                          ; --> cond
      ((empty? num-list) empty)                                                    ; --> sonst Aufruf insert, Aufruf sort-a-list
      (else (insert (first num-list)
                    (sort-a-list (rest num-list) sortFunction) sortFunction)))))


(define numbers '(18 27 33 66 44 75 62 89 94))
;(sort-a-list numbers <=) 
;(sort-a-list numbers >=)


;--------------------------------------------------------------------------------------------------------------------

;2.) Aufgabe *
;Sie kennen die Fibonacci-Folge:
; fib(n)
;0 n = 0
;1 n = 1
;fib(n - 1) + fib(n - 2) n>=2

;Die Definition einer strukturellen Rekursion könnte so aussehen

(define (fib n)
  (cond
    ((or (= n 0) (= n 1)) n)
    (else (+ (fib (- n 1))
             (fib (- n 2)))))
)  
  
; a) Implementieren Sie eine Rekursion mit Akkumulator. Nutzen Sie dazu die local Definition.

(define (fibbo-with-accumulator n)
  (local
    (
     (define (fib n prev accumulator)
       (cond
         ((or (= n 0) (= n 1)) accumulator)
         (else
           (fib (- n 1) accumulator (+ prev accumulator))))))
    (fib n 0 1)))

;(fibbo-with-accumulator 10)
  
; b) Führen Sie Vergleich Tests mit und ohne Akkumulator durch. Welche Unterschiede sehen Sie?


;(define test-for-value 4)
;cpu time: 0 real time: 0 gc time: 0 --> 3
;cpu time: 0 real time: 0 gc time: 0 --> 3

;(define test-for-value 10)
;cpu time: 0 real time: 0 gc time: 0 --> 55
;cpu time: 0 real time: 0 gc time: 0 --> 55

;(define test-for-value 20)
;cpu time: 1 real time: 1 gc time: 0
;cpu time: 0 real time: 0 gc time: 0

;(define test-for-value 40)
;cpu time: 11237 real time: 11285 gc time: 56 --> 102334155
;cpu time: 1 real time: 0 gc time: 0 --> 102334155


;(time (fib test-for-value))
;(time (fibbo-with-accumulator test-for-value))


;-----------------------------------------------------------------------------------------------------------

;3.) Aufgabe *
;a) Was ist die Ausgabe des folgenden Scheme-Programms?

;(define a 42)                      ; --> Ausgabe 43 - Die Reihenfolge der let spielt eine Rolle Bindungspaare
;(let ((a 1)                        ; --> Kein Zugriff auf a=1
;      (b (+ a 1))                  ; --> b= 42 + 1
;      )
;  b)

;(let* ((a 1)                       ; --> Ausgabe 2 - Spezielle Form let*, hat dieselbe Syntax wie let
;       (b (+ a 1)))                ; --> Die Auswertung erfolg jedoch von links nach rechts (squentielles let))
;  b)                               ; --> Zugriff auf a=1

;b) Erklären Sie, warum sich die beiden Ausdrücke unterscheiden.
; Let schaut zuerst nach allen Ausdrücken. Danach werden die Werte den Variablen zugewiesen.
; Let* weist fortlaufend von links nach rechts den Variablen die Werte zu.


;----------------------------------------------------------------------------------------------------------------

;Anonyme Funktionen
;(Einstellung in DrRacket: "Advanced Student")
;4.) Aufgabe *

;a) Was ist die Ausgabe des folgenden Scheme-Programms?
(define x 1)
(define y 5)
((lambda (x y)
   (+ (* 2 x) y))
 y x)
((lambda (a b)
   (+ (* 2 x) y))
 y x)



;b) Erklären Sie, warum sich die beiden Ausdrücke unterscheiden.






