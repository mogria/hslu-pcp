; GIMP Skript das ein konfigurierbares Gitternetz im GIMP zeichnet
; Im GIMP und im Menu registrieren
(script-fu-register 
 "script-fu-grid-lines" ; Funktionsname
 "New gridlines"	; Menu Punkt
 "Illustrates the structure of GIMP-script, creates image with gridlines" ; Beschreibung
 "Roger Diehl, Moritz Küttel"          ; Autor
 "2020, HSLU - I"       ; Copyright Notiz
 "April 2020"           ; Erstellungsdatum
 ""                     ; Bild Typ des Skript - "" heisst, es muss kein Bild geladen sein
 ; aktuelle Parameter von script-fu-grid-lines
 SF-ADJUSTMENT "Image width" '(200 10 10000 1 1 0 1) ; drawable_width - default 200
 SF-ADJUSTMENT "Image height" '(200 10 10000 1 1 0 1); drawable_height - default 200
 SF-ADJUSTMENT "Spacing" '(20 2 100 1 1 0 1)         ; spacing - default 20
 SF-BRUSH "Brush" '("Circle (01)" 100.0 1 0)         ; brush - default Circle (01)
 SF-COLOR "Background" '(255 255 255)                ; background color - default black
 SF-COLOR "Foreground" '(0 0 0)                      ; foreground color - default white
 SF-TOGGLE "Transparent Layer" FALSE                 ; transparent - default FALSE
 SF-TOGGLE "Horizontal lines" TRUE                   ; horizontal - default TRUE
 SF-TOGGLE "Vertical lines" FALSE                    ; vertical - default FALSE
 SF-TOGGLE "Dashed lines" FALSE                      ; dashed - default FALSE
 )
(script-fu-menu-register "script-fu-grid-lines"
                         "<Image>/File/Create/Gridlines")

; Das eigentliche Skript
(define (script-fu-grid-lines drawable_width drawable_height spacing brush background foreground transparent horizontal vertical dashed)
  
  (gimp-context-push)
  (let*(
        ; Grundeinstellungen - Farbe, Breite, Höhe, Ebene...
        (color 0)
        (image (car(gimp-image-new drawable_width drawable_height RGB)))
        (layer (car(gimp-layer-new image drawable_width drawable_height RGBA-IMAGE "grid-layer" 100 NORMAL-MODE)))
        (layer_width (car(gimp-drawable-width layer)))
        (layer_height (car(gimp-drawable-height layer)))
        ; (brush_info (gimp-brush-get-info (gimp-context-get-brush)))
        ; (brush_width (car(brush_info)))
        ; (brush_height (cadr(brush_info)))
        ; Anfangs- und Endpunkt einer Linie definieren x1, y1, x2, y2
        (point (cons-array 4 'double))
        (invert FALSE)
        )
    ; Gimp Kontext sezten - Transparenz, Hintergrund, Vordergrund, Pinsel, Füllfarbe, Ebene...
    (if(= transparent TRUE)
       (set! color TRANSPARENT-FILL)
       (set! color BACKGROUND-FILL)
       )
    (gimp-context-set-background background)
    (gimp-context-set-foreground  foreground)
    (gimp-context-set-brush (car brush))
    (gimp-drawable-fill layer color)
    (gimp-image-add-layer image layer -1)
    
    ; Demo zum Zeichnen einer Linie
    (define (draw_line x1 y1 x2 y2)
      ; Variablen x1, y1, x2, y2 den Anfangs- und Endpunkten der Linie zuordnen
      (aset point 0 x1)
      (aset point 1 y1)
      (aset point 2 x2)
      (aset point 3 y2)
      ; Linie zeichnen
      (gimp-paintbrush-default layer 4 point)
      )

    ; ab hier die Gitterlinien-Funktionen...
    (define (draw_single_line h d spacing offset)
      (let* ( 
          (directed_func (if (= h TRUE) draw_line (swapped_draw_func draw_line)))
          (draw_func (if (= d TRUE) (make_dashed_draw_func directed_func h spacing) directed_func))
        )
        (draw_func 0 offset (get_layer_limit (if (= h TRUE) FALSE TRUE)) offset)
      )
    )


    ;; make_dashed_draw_func
    ; converts a call to draw_func which normally just draws a line
    ; to draw a dashed line with the given spacing
    (define (draw_dashed_lines_acc draw_func x1 y1 x2 y2 h spacing pos)
      (if (> pos 0) (draw_func x1 y1 x2 y2) pos)
      (cond 
        ((> pos (get_layer_limit h)) pos)
        (else (draw_dashed_lines_acc draw_func pos y1 (+ pos spacing) y2 h spacing (+ pos spacing spacing)))
      )
    )
    (define (make_dashed_draw_func draw_func h spacing)
      (lambda (x1 y1 x2 y2) 
        (draw_dashed_lines_acc draw_func x1 y1 x2 y2 (if (= h TRUE) FALSE TRUE) spacing 0)
      )
    )

    ;; swapped_draw_func
    ; swap the x and y coordinates of a line draw function
    ; this results in a conversion from/to horizontal/vertical
    (define (swapped_draw_func draw_func) 
      (lambda (x1 y1 x2 y2) (draw_func y1 x1 y2 x2))
    )


    ;; get the limit of the gimp layer in the given direction
    (define (get_layer_limit h)
      (if (= h TRUE) layer_height layer_width)
    )

    ;; true when we should stop drawing grid lines in this direction
    (define (limit_reached? h offset)
      (> offset (get_layer_limit h))
    )

    (define (draw_grid_lines_acc h d spacing offset)
      (cond 
        ((limit_reached? h offset) offset)
        (else
          (draw_single_line h d spacing offset)
          (draw_grid_lines_acc h d spacing (+ offset spacing))
        )
      )
    )

    ;; draw grid lines
    ; h:  draw grid lines in the horizonal (h = TRUE) or vertical (h = FALSE) direction
    ; dashed:  whether to use dashed lines or not 
    ; spacing: the spacing between the grid lines and
    ;          the spacing between the lines when using dashed lines
    (define (draw_grid_lines h dashed spacing)
      (draw_grid_lines_acc h dashed spacing 0)
    )


    ; ...Ende der Gitterlinien-Funktionen

    (if (= horizontal TRUE) (draw_grid_lines TRUE dashed spacing))
    (if (= vertical TRUE) (draw_grid_lines FALSE dashed spacing))

    ; Bild anzeigen
    (gimp-display-new image)
    (gimp-context-pop)
    (gimp-displays-flush)
    )
  )
