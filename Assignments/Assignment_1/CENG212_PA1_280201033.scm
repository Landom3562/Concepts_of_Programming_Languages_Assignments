#lang scheme
;PART 1:

(define (lambda1 number) (* number number))
(define (lambda2) (println "I am a simple lambda function which only prints to screen :)"))

(define (figure) (cons (cons (cons 3 (cons 1992 (cons (cons (cons "Adil" "Burak") (list (cons "Hüseyin" "Samet") '() "Dilek" "Altuğ")) (list "Cansu" "Ege" (cons (cons (cons 1923 "Güliz") "Nuri") (cons "Eren" (cons '() lambda2))) (list "Didem" lambda1 (cons "Büşra" (cons "Serhat" (cons (cons (cons 1923 "Güliz") "Nuri") (cons "Eren" (cons '() lambda2)))))))))) (cons 3 (cons 1992 (cons (cons (cons "Adil" "Burak") (list (cons "Hüseyin" "Samet") '() "Dilek" "Altuğ")) (list "Cansu" "Ege" (cons (cons (cons 1923 "Güliz") "Nuri") (cons "Eren" (cons '() lambda2))) (list "Didem" lambda1 (cons "Büşra" (cons "Serhat" (cons (cons (cons 1923 "Güliz") "Nuri") (cons "Eren" (cons '() lambda2))))))))))) (cons (cons 1992 (cons (cons (cons "Adil" "Burak") (list (cons "Hüseyin" "Samet") '() "Dilek" "Altuğ")) (list "Cansu" "Ege" (cons (cons (cons 1923 "Güliz") "Nuri") (cons "Eren" (cons '() lambda2))) (list "Didem" lambda1 (cons "Büşra" (cons "Serhat" (cons (cons (cons 1923 "Güliz") "Nuri") (cons "Eren" (cons '() lambda2))))))))) (cons (cons (cons (cons "Adil" "Burak") (cons "Ersin" 7)) "Didem") lambda1))))

;PART 2:

(define (last-index list) (if (null? (cdr list)) (car list) (last-index (cdr list))))

(define (delete item list1) (if (equal? item (car list1)) (cdr list1) (cons (car list1) (delete item (cdr list1)))))

(define (string-or-number? item) (or (string? item) (number? item)))

(define visited '())
(define (myproc v1 v2 v3) (cond ((member v1 visited) '()) ((pair? v1) (cons (myproc (cdr v1) v2 v3) (myproc (car v1) v2 v3))) ((and (list? v1) (not (null? v1))) (cons (myproc (last-index v1) v2 v3) (myproc (delete (last-index v1) v1) v2 v3))) (else (cond ((null? v1) '()) ((string-or-number? v1) (if (v2 v1) (cons (v3 v1) (set! visited (append visited (list v1)))) '())) ((procedure? v1) (cons (v3 v1) (set! visited (append visited (list v1)))))))))

;PART 3:

(define (longer-than-5? item) (if (string? item) (if (> (string-length item) 5) #t #f) #f))

(define (print-strings-and-numbers item) (if (string-or-number? item) (println item) (void)))

(define (prime? item)  (if (number? item) (if (= (sqrt item) (truncate (sqrt item))) #f (is-divisible-to-numbers-lower? item (truncate (sqrt item)))) #f))

(define (is-divisible-to-numbers-lower? number diviser) (cond ((< diviser 2) #t) ((= 0.0 (modulo number diviser)) #f) (else (is-divisible-to-numbers-lower? number (- diviser 1)))))

(define (apply-lambdas proc) (if (equal? proc lambda1) (println (proc 17)) (proc)))

(define (delete-voids item) (void)) ;Because I used cons for doing two tasks at the same time in myproc function, output of myproc turns into a bunch of voids.This function solves that by making the output void.


(println 'Part_3.a)
(delete-voids (myproc (figure) string-or-number? println))
(set! visited '()) ;To reset visited list so the new statement can work properly.


(println 'Part_3.b)
(delete-voids (myproc (figure) prime? print-strings-and-numbers))
(set! visited '())


(println 'Part_3.c)
(delete-voids (myproc (figure) longer-than-5? print-strings-and-numbers))
(set! visited '())


(println 'Part_3.d)
(delete-voids (myproc (figure) procedure? apply-lambdas))
(set! visited '())
