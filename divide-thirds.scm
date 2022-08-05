(script-fu-register
 "script-fu-divide-thirds"                        ;func name
 "Divide into thirds using guides."               ;menu label
 "Divide the canvas into thirds by adding guides" ;Description
 "Ryan Burnside"                                  ;author
 "No copyright protection"                        ;copyright
 "August 4 2022"                                  ;date
 ""                                               ;image type

 ;; Widgets and top level parameters
 SF-IMAGE       "Image"          0
 SF-DRAWABLE    "Drawable"       0)


;; Register the main function
(script-fu-menu-register "script-fu-divide-thirds"
                         "<Image>/Guides/")

;; Main function
(define (script-fu-divide-thirds the-image the-drawable)
  (script-fu-guide-new-percent 1 1 0 66.666)
  (script-fu-guide-new-percent 1 1 0 33.333)
  (script-fu-guide-new-percent 1 1 1 66.666)
  (script-fu-guide-new-percent 1 1 1 33.333))
