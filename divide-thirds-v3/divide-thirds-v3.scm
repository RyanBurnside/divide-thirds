#!/usr/bin/env gimp-script-fu-interpreter-3.0
;;;; Ryan Burnside GIMP tinkerings
;;;; Yeah, could have used Python but Scheme is more fun. Mostly.
;;;;
;;;; 2026-07-25: Ported to Gimp 3.0/3.2 (@jkbzh)
;;;;

(script-fu-register-filter
 "script-fu-divide-grid"                                     ;func name
 "Divide into rows and columns using guides."                ;menu label
 "Divide the canvas into rows and columns by adding guides." ;Description
 "Ryan Burnside"                                             ;author
 "No copyright protection"                                   ;copyright
 "August 4 2022"                                             ;date
 "*"                                                         ;image type

 ;; Widgets and top level parameters
 SF-ONE-DRAWABLE
 SF-ADJUSTMENT  "_Horizontal Divisions" '(3 1 300 1 4 0 SF-SLIDER)
 SF-ADJUSTMENT  "_Vertical  Divisions" '(3 1 300 1 4 0 SF-SLIDER))


;; Register the main function
(script-fu-menu-register "script-fu-divide-grid"
                         "<Image>/Script-Fu/Guides/")


;; Helper function
(define (script-fu-divide-sections the-image the-drawables divisions horiz) ; 0 for horiz 1 for vert
  (let loop ((i 0))
    (when (<= i divisions)
      (script-fu-guide-new-percent #:image the-image #:drawables the-drawables
				   #:option horiz
				   #:adjustment (* (/ i divisions) 100.0))
      (loop (+ i 1)))))


;; Main function
(define (script-fu-divide-grid the-image the-drawables horizontal-divisions vertical-divisions)
  (script-fu-use-v3)
  (gimp-image-undo-group-start the-image)
  (let ((horiz 0)
        (vert 1))
    (script-fu-divide-sections the-image the-drawables horizontal-divisions horiz)
    (script-fu-divide-sections the-image the-drawables vertical-divisions vert))
  (gimp-image-undo-group-end the-image))


(script-fu-register-filter
 "script-fu-divide-thirds"                         ;func name
 "Divide into thirds using guides."                ;menu label
 "Divide the canvas into thirds by adding guides." ;Description
 "Ryan Burnside"                                   ;author
 "No copyright protection"                         ;copyright
 "August 4 2022"                                   ;date
 "*"                                               ;image type

 ;; Widgets and top level parameters
 SF-ONE-DRAWABLE)


;; Register the main function
(script-fu-menu-register "script-fu-divide-thirds"
                         "<Image>/Script-Fu/Guides/")


;; Main function
(define (script-fu-divide-thirds the-image the-drawables)
  (script-fu-use-v3)
  (gimp-image-undo-group-start the-image)
  (script-fu-divide-grid the-image the-drawables 3 3)
  (gimp-image-undo-group-end the-image))


(script-fu-register-filter
 "script-fu-frame-guides"             ;func name
 "Frame the image using guides."      ;menu label
 "Frame the canvas by adding guides." ;Description
 "Ryan Burnside"                      ;author
 "No copyright protection"            ;copyright
 "August 4 2022"                      ;date
 "*"                                  ;image type

 ;; Widgets and top level parameters
 SF-ONE-DRAWABLE)


;; Register the main function
(script-fu-menu-register "script-fu-frame-guides"
                         "<Image>/Script-Fu/Guides/")

;; Main function
(define (script-fu-frame-guides the-image the-drawables)
  (script-fu-use-v3)
  (gimp-image-undo-group-start the-image)
  (script-fu-divide-grid the-image the-drawables 1 1)
  (gimp-image-undo-group-end the-image))


(script-fu-register-filter
 "script-fu-divide-center"    ;func name
 "Draw guides at the center." ;menu label
 "Draw guides at the center." ;Description
 "Ryan Burnside"              ;author
 "No copyright protection"    ;copyright
 "August 4 2022"              ;date
 "*"                          ;image type

 ;; Widgets and top level parameters
 SF-ONE-DRAWABLE)


;; Register the main function
(script-fu-menu-register "script-fu-divide-center"
                         "<Image>/Script-Fu/Guides/")


;; Main function
(define (script-fu-divide-center the-image the-drawables)
  (script-fu-use-v3)
  (gimp-image-undo-group-start the-image)
  (script-fu-divide-grid the-image the-drawables 2 2)
  (gimp-image-undo-group-end the-image))


(script-fu-register-filter
 "script-fu-golden-ratio-guides" ;func name
 "Add guides at Golden Ratio."   ;menu label
 "Add guides at Golden Ratio."   ;Description
 "Ryan Burnside"                 ;author
 "No copyright protection"       ;copyright
 "August 5 2022"                 ;date
 "*"                             ;image type

 ;; Widgets and top level parameters
 SF-ONE-DRAWABLE)


;; Register the main function
(script-fu-menu-register "script-fu-golden-ratio-guides"
                         "<Image>/Script-Fu/Guides/")


;; Main function
(define (script-fu-golden-ratio-guides the-image the-drawables)
  (script-fu-use-v3)
  (gimp-image-undo-group-start the-image)
  (let ((horiz 0)
        (vert 1))
    (script-fu-guide-new-percent #:image the-image #:drawables the-drawables
				 #:option horiz
				 #:adjustment 61.8)
    (script-fu-guide-new-percent #:image the-image #:drawables the-drawables
				 #:option horiz
				 #:adjustment 38.2)
    (script-fu-guide-new-percent #:image the-image #:drawables the-drawables
				 #:option vert
				 #:adjustment 61.8)
    (script-fu-guide-new-percent #:image the-image #:drawables the-drawables
				 #:option vert
				 #:adjustment 38.2))
  (gimp-image-undo-group-end the-image))
