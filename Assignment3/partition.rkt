#lang racket

; Checks if a given number is greater than 0, therefore chekcing if it's positive
(define (positive? x)
  (> x 0))

; Splits a list into two sublists: 1. contains elements that satisfy pred and 2. constains elements that don't satisfy pred
(define (partition pred lst)                                                                        ; Input 'pred' is a predicate funciton that takes an element and returns a boolean. Input 'lst' is a list of elementions to be partitioned
  (letrec                                                                                           ; Defines a helper function for tail-recursive processing
      ((partition-helper                                                                            ; Recursively processes the list accumulating elements into 'true-part' and 'false-part'
         (lambda (lst true-part false-part)                                                         ; Input 'lst' is the remaining part of the list still to be processed. 'true-part' is the accumulated list of elements satisfying 'pred' and 'false-part' is of the ones not satisfying 'pred'
           (if (null? lst)
               (list true-part false-part)                                                          ; Base case. If the list is empty, returns the two accumulated sublists 'true-part' and 'false-part'
               (if (pred (car lst))                                                                 ; Recursive case that processes the first element
                   (partition-helper (cdr lst) (append true-part (list (car lst))) false-part)      ; If 'pred' is true for the first element, adds it to 'true-part'
                   (partition-helper (cdr lst) true-part (append false-part (list (car lst))))))))) ; If 'pred' is false, adds it to 'false-part'
    (partition-helper lst '() '())))                                                                ; Calls the helper function with the intiial list and empty siblists