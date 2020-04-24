(define layer_width 600)
(define layer_height 400)
(define TRUE 1)
(define FALSE 0)

; Demo zum Zeichnen einer Linie
(define (draw_line x1 y1 x2 y2)
  ; Variablen x1, y1, x2, y2 den Anfangs- und Endpunkten der Linie zuordnen
  (display x1)
  (display " ")
  (display y1)
  (display " ")
  (display x2)
  (display " ")
  (displayln y2)
  )

;; (cond ((and (eq? vertical FALSE) (eq? horizontal FALSE))
;;       (draw_line spacing spacing (- layer_width spacing) (- layer_height spacing))
;;       ))

; ab hier die Gitterlinien-Funktionen...


(define (draw_dashed_lines_acc draw_func x1 y1 x2 y2 h spacing pos)
  (cond 
    ((>= pos (get_layer_limit h)) pos)
    (else
      (if (> pos 0) (draw_func x1 y1 x2 y2) pos)
      (draw_dashed_lines_acc draw_func pos y1 (+ pos spacing) y2 h spacing (+ pos spacing spacing))
    )
  )
)

(define (make_dashed_draw_func draw_func h spacing)
  (lambda (x1 y1 x2 y2) 
    (draw_dashed_lines_acc draw_func x1 y1 x2 y2 (if (= h TRUE) FALSE TRUE) spacing 0)
  )
)

(define (swapped_draw_func draw_func) 
  (lambda (x1 y1 x2 y2) (draw_func y1 x1 y2 x2))
)

(define (get_layer_limit h)
  (if (= h TRUE) layer_width layer_height)
)

(define (limit_reached? h offset)
  (>= offset (get_layer_limit h))
)

(define (draw_single_line h d spacing offset)
  (let* (
      (directed_func (if (= h TRUE) draw_line (swapped_draw_func draw_line)))
      (draw_func (if (= d TRUE) (make_dashed_draw_func directed_func h spacing) directed_func))
    )
    (draw_func 0 offset (get_layer_limit h) offset)
  )
)

(define (draw_lines_acc h d spacing offset)
  (cond 
    ((limit_reached? h offset) offset)
    (else
      (draw_single_line h d spacing offset)
      (draw_lines_acc h d spacing (+ offset spacing))
    )
  )
)
(define (draw_lines h dashed spacing)
  (draw_lines_acc h dashed spacing 0)
)


(displayln '(draw_lines TRUE FALSE 55))
(draw_lines TRUE FALSE 55)
(displayln '(draw_lines FALSE FALSE 88))
(draw_lines FALSE FALSE 88)
(displayln '(draw_lines TRUE TRUE 31))
(draw_lines TRUE TRUE 31)
(displayln '(draw_lines FALSE TRUE 17))
(draw_lines FALSE TRUE 17)

