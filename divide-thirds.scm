;;;; Ryan Burnside GIMP tinkerings
;;;; Yeah, could have used Python but Scheme is more fun. Mostly.


(script-fu-register
 "script-fu-divide-grid"                                     ;func name
 "Divide into rows and columns using guides."                ;menu label
 "Divide the canvas into rows and columns by adding guides." ;Description
 "Ryan Burnside"                                             ;author
 "No copyright protection"                                   ;copyright
 "August 4 2022"                                             ;date
 ""                                                          ;image type

 ;; Widgets and top level parameters
 SF-IMAGE       "Image"          0
 SF-DRAWABLE    "Drawable"       0
 SF-ADJUSTMENT  "Horizontal Divisions" '(3 1 300 1 4 0 SF-SLIDER)
 SF-ADJUSTMENT  "Vertical  Divisions" '(3 1 300 1 4 0 SF-SLIDER))


;; Register the main function
(script-fu-menu-register "script-fu-divide-grid"
                         "<Image>/Script-Fu/Guides/")


;; Helper function
(define (script-fu-divide-sections the-image the-drawable divisions horiz) ; 0 for horiz 1 for vert
  (let loop ((i 0))
    (when (<= i divisions)
      (script-fu-guide-new-percent the-image the-drawable horiz (* (/ i divisions) 100.0))
      (loop (+ i 1)))))


;; Main function
(define (script-fu-divide-grid the-image the-drawable horizontal-divisions vertical-divisions)
  (gimp-image-undo-group-start the-image)
  (let ((horiz 0)
        (vert 1))
    (script-fu-divide-sections the-image the-drawable horizontal-divisions horiz)
    (script-fu-divide-sections the-image the-drawable vertical-divisions vert))
  (gimp-image-undo-group-end the-image))


(script-fu-register
 "script-fu-divide-thirds"                         ;func name
 "Divide into thirds using guides."                ;menu label
 "Divide the canvas into thirds by adding guides." ;Description
 "Ryan Burnside"                                   ;author
 "No copyright protection"                         ;copyright
 "August 4 2022"                                   ;date
 ""                                                ;image type

 ;; Widgets and top level parameters
 SF-IMAGE    "Image"    0
 SF-DRAWABLE "Drawable" 0)


;; Register the main function
(script-fu-menu-register "script-fu-divide-thirds"
                         "<Image>/Script-Fu/Guides/")


;; Main function
(define (script-fu-divide-thirds the-image the-drawable)
  (script-fu-divide-grid the-image the-drawable 3 3))

(script-fu-register
 "script-fu-frame-guides"             ;func name
 "Frame the image using guides."      ;menu label
 "Frame the canvas by adding guides." ;Description
 "Ryan Burnside"                      ;author
 "No copyright protection"            ;copyright
 "August 4 2022"                      ;date
 ""                                   ;image type

 ;; Widgets and top level parameters
 SF-IMAGE    "Image"    0
 SF-DRAWABLE "Drawable" 0)


;; Register the main function
(script-fu-menu-register "script-fu-frame-guides"
                         "<Image>/Script-Fu/Guides/")

;; Main function
(define (script-fu-frame-guides the-image the-drawable)
  (script-fu-divide-grid the-image the-drawable 1 1))


(script-fu-register
 "script-fu-divide-center"    ;func name
 "Draw guides at the center." ;menu label
 "Draw guides at the center." ;Description
 "Ryan Burnside"              ;author
 "No copyright protection"    ;copyright
 "August 4 2022"              ;date
 ""                           ;image type

 ;; Widgets and top level parameters
 SF-IMAGE    "Image"    0
 SF-DRAWABLE "Drawable" 0)


;; Register the main function
(script-fu-menu-register "script-fu-divide-center"
                         "<Image>/Script-Fu/Guides/")

;; Main function
(define (script-fu-divide-center the-image the-drawable)
  (script-fu-divide-grid the-image the-drawable 2 2))

(script-fu-register
 "script-fu-golden-ratio-guides" ;func name
 "Add guides at Golden Ratio."   ;menu label
 "Add guides at Golden Ratio."   ;Description
 "Ryan Burnside"                 ;author
 "No copyright protection"       ;copyright
 "August 5 2022"                 ;date
 ""                              ;image type

 ;; Widgets and top level parameters
 SF-IMAGE    "Image"    0
 SF-DRAWABLE "Drawable" 0)


;; Register the main function
(script-fu-menu-register "script-fu-golden-ratio-guides"
                         "<Image>/Script-Fu/Guides/")

;; Main function
(define (script-fu-golden-ratio-guides the-image the-drawable)
  (gimp-image-undo-group-start the-image)
  (let ((horiz 0)
        (vert 1))
    (script-fu-guide-new-percent the-image the-drawable horiz 61.8)
    (script-fu-guide-new-percent the-image the-drawable horiz 38.2)
    (script-fu-guide-new-percent the-image the-drawable vert 61.8)
    (script-fu-guide-new-percent the-image the-drawable vert 38.2))
  (gimp-image-undo-group-end the-image))
