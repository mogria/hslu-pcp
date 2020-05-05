;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname Scheme_3_4) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #t #t none #f () #f)))
;1.) Aufgabe
;Folgende Definitionen liegen vor:
(define couple (list (cons "Adam" (cons "Eva" empty))     ;---> cons = 2 Felder Struktur (cons BeliebigerDatenTyp Liste)
                     (cons "Paul" (cons "Paula" empty))   ;---> Liste mit 2 Elem: (define list2 (cons 'a (cons 'b empty)))
               )
 )

(define spec-list (list 1 (list 2 3 (list 5 7) 9)))


;a) Welche Ergebnisse bringen folgende Funktionsaufrufe?

;(rest (first couple)) --> rest (das zweite Element) first (das erste Element)
; = ("Eva")

;(first (rest couple))
; = ("Paul" "Paula")

;(rest (rest couple))
; = ()

;(first (first (rest couple)))
; = "Paul"

;(rest (first (rest couple)))
; = ("Paula")

;(cons? (rest (rest couple)))
; = #f

;b)
;Gibt es eine Kombination von first und rest an, mit der man den Wert 7 aus der spec-list herausfiltern kann?

;(first(rest(first(rest(rest(first(rest spec-list)))))))

;(first (rest (first (rest (rest (first (rest spec-list)))))))


;--------------------------------------------------------------------------------------------------------


;2.) Aufgabe
;Verallgemeinern Sie die Funktion redoubler (Folie Beispiel: Listen-Elemente verdoppeln) so, dass jedes
;Element einer Zahlen-Liste mit einem beliebigen Faktor multipliziert wird.


(define (multiplier factor1 factor2) (* factor1 factor2))

(define (redoubler list factor)
  (cond
    ((empty? list) empty)
    (else
     (cons
      (multiplier (first list) factor)
      (redoubler (rest list) factor)))))

;(define list1 '(2 4 6 8 10))
;(redoubler list1 3)

;--------------------------------------------------------------------------------------------------------

;3.) Aufgabe *
;Untersuchen Sie die folgenden Funktionen. Was bewirken diese Funktionen?
;a)

(define (f liste)               ; --> Definiert die Funktion
  (if (empty? liste)            ; --> Prüft ob die Liste leer ist (Boolean)
      empty                     ; --> Gibt die leere Liste zurück
      (if (empty? (rest liste)) ; --> oder(else Statement) Prüft Rest der Liste ob es leer ist
          (first liste)         ; --> wenn ja, erstes Element
          (f (rest liste)))))   ; --> else letztes Element

;(f '(- 1 *))

; Funktion liefert letztes Element

(define (g liste)                             ; --> Definiert die Funktion
  (cond                                       ; --> Condition (Fallunterschiedung)
    ((empty? liste) empty)                    ; --> Prüft, ob die Liste leer ist
    ((empty? (rest liste)) (first liste))     ; --> Prüft, ob der Rest (zweites Element) der Liste leer ist, sonst erstes Element der liste
    (else                                     ; --> sonst
     (if (> (first liste) (g (rest liste)))   ; --> Vergleich erstes Element mit (Aufruf g) rest der Liste
         (first liste)                        ; --> Dies ist grösstes Elment der Liste
         (g (rest liste))))))                 ; --> Erneuter Aufruf der Funktion

;(g '(1 20 30 33 40 11 54))

; Funktion sucht grösstes Element in der Liste.

;----------------------------------------------------------------------------------------------------------------------------------

;4.) Aufgabe *
;Entwickeln Sie eine Funktion, die ein bestimmtes Element aus einer Liste entfernt. Die Definition der Funktion lautet:

;Beispiel zur Anwendung der Funktion:
;> (delete 3 (list 1 2 3 4)) (list 1 2 4)
;> (delete 'c '(a b c d)) (list 'a 'b 'd)
;> (delete 'f '(a b c d)) (list 'a 'b 'c 'd)
;> (delete 'f empty)
;'()
;> (delete 'f (list 1 2 3 4)) (list 1 2 3 4)


(define (delete item a-list)                                   ; --> Funktions definition 
  (cond                                                        ; --> Condition
    ((empty? a-list) empty)                                    ; --> Prüft ob die Liste leer ist, gibt llere Liste zurück
    ((eq? (first a-list) item) (delete item (rest a-list)))    ; --> Vergleicht item mit erstem Element der Liste und ruft Funktion erneut auf mit dem Rest (zweitem Element der Liste)
    (else
      (cons (first a-list) (delete item (rest a-list))))))     ; --> Aufruf der Liste, erstem Element der Liste, rek. Aufruf mit dem iteme und dem Rest (zweiten Element) der Liste

;(delete 3 (list 1 2 3 4)) ; '(1 2 4)
;(delete 'c '(a b c d)) ; '(a b d)
;(delete 'b '(a b c d)) ; '(a b c d)
;(delete 'f empty) ; '()
;(delete 'f (list 1 2 3 4)) ; '(1 2 3 4)


;--------------------------------------------------------------------------------------------------------------------

;Funktionen höherer Ordnung
;(Einstellung in DrRacket: "Advanced Student")
;6.) Aufgabe
;Die Folie 23 aus PCP-Scheme-4 zeigt die Funktion list-filter, um eine Liste zu untersuchen und ggf. eine Resultatliste zu erstellen.

;(define (list-filter rel-op a-list value)
;  (cond
;    [(empty? a-list) empty]
;    [else
;     (cond
;       [(rel-op (first a-list) value)
;        (cons (first a-list)
;              (list-filter rel-op (rest a-list) value))]
;        [else (list-filter rel-op (rest a-list) value)])
;]))

;Die Tests wurden nur mit Listen von Zahlen durchgeführt. Testen Sie die Funktion auch für folgende Situationen:
; Es werden alle nachfolgendne Zahlen ausgegegeben. Z.B:

;(define my-list (list 3 5 14 6 4 23 6 77 31 30 2))
;(list-filter > my-list 1)
;(list 3 5 14 6 4 23 6 77 31 30 2)
;(list-filter > my-list 30)
;(list 77 31)

; a) Suche ein bestimmtes Symbol in einer Liste von Symbolen
;
(define symbol1 1)
(define symbol2 10)
(define symbol3 3)
(define symbol4 10)
(define my-list1 (list symbol1 symbol2 symbol3 symbol4))
;(list-filter eqv? my-list1 symbol2) ; --> Das gesuchte Symbol wird mit der Funktion eqv? gefunden.


; b) Suche ein bestimmtes Zeichen in einer Liste von Zeichen
;
;(define my-list2 (list - + *))
;(list-filter eqv? my-list2 *) ; --> Das gesuchte Zeichen wird mit der Funktion eqv? gefunden.
;
;(define my-list3 (list "John" "Jerry" "Tom"))
;(list-filter eqv? my-list3 "Jerry") ; --> Der gesuchte String wird mit der Funktion eqv? gefunden.


;---------------------------------------------------------------------------------------------------------

;7.) Aufgabe *
;Schreiben Sie eine eigene Prädikatfunktion für die Funktion list-filter, welche untersucht, ob es eine
;oder mehrere Zahlen in einer Liste von Zahlen gibt, die teilbar durch eine bestimmte (als Parameter gegebene) Zahl ist.

(define (list-filter rel-op a-list value)
  (cond
    [(empty? a-list) empty]
    [else
     (cond
       [(rel-op (first a-list) value)
        (cons (first a-list)
              (list-filter rel-op (rest a-list) value))]
        [else (list-filter rel-op (rest a-list) value)])
]))



(define (lookingForDividing? x y) (= 0 (remainder x y)))          ; --> (remainder != modulo) remainder gibt unexakte Werte zurück und nimmt unexakte Werte entgegen

(list-filter lookingForDividing? '(1 2 3 4 5 6 7 8 9) 4)

;(list 4 8)


;-----------------------------------------------------------------------------------------------------------------------------------------
;8.) Aufgabe *
;Sie kennen die Implementation des Sortierens durch Einfügen:
; Sortieren durch Einfügen

;(define (sort-a-list num-list)
;  (cond
;    ((empty? num-list) empty)
;    (else (insert (first num-list)
;                  (sort-a-list (rest num-list))))
;))

; Einfügen in sortierter Liste
;(define (insert item a-list)
;  (cond
;    ((empty? a-list) (list item))
;    ((<= item (first a-list)) (cons item a-list))
;    (else (cons (first a-list) (insert item (rest a-list))))
;    ))

;Die sort-a-list Funktion sortiert nur Zahlen von klein nach gross. Ändern Sie die sort-a- list
;Funktion so, dass die Sortierrichtung bestimmt und nicht nur Zahlen sondern auch Strings sortiert
;werden können.

(define (sort-a-list num-list sortFunction)
  (cond
    ((empty? num-list) empty)                                                ; --> Prüft ob Liste leer ist
    (else (insert (first num-list)                                           ; --> Aufruf insert erster Zahl von num-list
                  (sort-a-list (rest num-list) sortFunction) sortFunction)))); --> Aufruf sort-a-list mit zweiter Zahl der Liste

(define (insert item a-list sortFunction)                                    ; --> insert Funktion
  (cond
    ((empty? a-list) (list item))                                            ; --> Prüft ob Liste leer ist, sonst ist es eine List item
    ((sortFunction item (first a-list)) (cons item a-list))                  ; --> Vergleicht item mit erstem Element der List - item ist erstes Element von a-list
    (else (cons (first a-list) (insert item (rest a-list) sortFunction)))))  ; --> sonst Liste mit ersteme Elemnet von a-List mit Aufruf von insert mit vergleich zwischen item und zeitem Element von a-list 


;(define numbers '(11 3 1 33 17 43 54 2 68 4))
;(sort-a-list numbers <=) 
;(sort-a-list numbers >=)

(define strings '("Ruedi" "Anton" "Elvis" "Zorro" "Luis"))
(sort-a-list strings string<?)                                               ; --> procedure: string<? string1 string2


;------------------------------------------------------------------------------------------------------------------------------------------------------

;9.) Aufgabe*
;a) Untersuchen Sie die folgende Funktion. Was macht die Funktionen genau?

(define (a-op a)
  (cond
    [(>= a 0) +]
    [else -]))

;(a-op 2) ---> +
;(a-op -1) ---> -
;Je nach Zahl, die mitgegegeben wird, wechselt das Vorzeichen.


;b) Schreiben Sie eine Funktion abs-a-plus-b, welche die absoluten Werte von a und b zusammen zählt.


(define (abs-a-plus-b a b)
  (+ (if (>= a 0) a (* a -1)) (if (>= b 0) b (* b -1)))) ; --> (if a >= 0 then a sonst a*-1) + (if b >= 0 then b sonst b*-1)

;(abs-a-plus-b 11 12)
;(abs-a-plus-b -1 3) 
;(abs-a-plus-b 2 -4) 
;(abs-a-plus-b -5 -5) 


  
;c) Erweitern Sie die Funktion abs-a-plus-b zu abs-a-op-b damit man eine beliebige Operation mit den absoluten Werten von a und b durchführen kann.


(define (abs-a-op-b a b op)          
  (op (abs a)                   ; --> a (op) b
      (abs b)))

(abs-a-op-b 2 5 +) 
(abs-a-op-b -7 8 *) 
(abs-a-op-b 3 -15 -) 
(abs-a-op-b -3 0 /) 
