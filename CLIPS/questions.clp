(defmodule QUESTIONS (import MAIN ?ALL)(import TEMPLATES ?ALL) (export ?ALL))

;;*******************
;;* QUESTIONS FUNCTIONS *
;;*******************

 ; interacts with user when an allowed values is required (it handles both integer and strings values)
(deffunction MAIN::ask-question-av (?question ?allowed-values)
   (printout t ?question)
   (bind ?answer (read))
   ; lexemep check if the variable is a string or a symbol
   (if (lexemep ?answer) then (bind ?answer (lowcase ?answer)))
   (while (not (member ?answer ?allowed-values)) do
      (printout t "Inserire un valore tra quelli validi ")
      (bind ?answer (read))
      (if (lexemep ?answer) then (bind ?answer (lowcase ?answer))))
   ?answer)

; interacts with user when an integer without allowed values is required
(deffunction MAIN::ask-question-int (?question)
   (printout t ?question)
   (bind ?answer (read))
   ; lexemep check if the variable is a string or a symbol
   (if (lexemep ?answer) then (bind ?answer (lowcase ?answer))) ; usefull for "stop"
   (while (or (not (integerp ?answer)) (<= ?answer 0)) do ; or is lazy, if the first cond is true does not verify the second
      (printout t "Inserire un numero intero postivo ")
      (bind ?answer (read))
      (if (lexemep ?answer) then (bind ?answer (lowcase ?answer))))
   ?answer)

;;*******************
;;* QUESTIONS RULES *
;;*******************

; handle tourism type
(defrule QUESTIONS::tourism-question
   ?f <- (question (already-asked FALSE)
                   (attribute tourism) ; SE NON SERVE SI POSSONO ACCORPARE ALCUNE DELLE REGOLE SOTTO
                   (the-question ?the-question)
                   (valid-answers $?valid-answers))
   =>
   (modify ?f (already-asked TRUE))
   (bind ?answer (ask-question-av ?the-question ?valid-answers))
   (while (not (eq ?answer stop))
      (assert (attribute (name tourism)  ; LASCIARE ATTRIBUTE O METTERE QUALCOSA DI PIù EVOCATIVO? + LA CERTAINTY VA GESTITA GIà QUA?????
                         (value ?answer)))
      (bind ?answer (ask-question-av ?the-question ?valid-answers))
   )
)

; handle ok region
(defrule QUESTIONS::ok-region-question
   ?f <- (question (already-asked FALSE)
                   (attribute ok-region)
                   (the-question ?the-question)
                   (valid-answers $?valid-answers))
   =>
   (modify ?f (already-asked TRUE))
   (bind ?answer (ask-question-av ?the-question ?valid-answers))
   (while (not (eq ?answer stop))
      (assert (attribute (name ok-region)  ; LASCIARE ATTRIBUTE O METTERE QUALCOSA DI PIù EVOCATIVO? + LA CERTAINTY VA GESTITA GIà QUA?????
                         (value ?answer)))
      (bind ?answer (ask-question-av ?the-question ?valid-answers))
   )
)

; handle region not liked
(defrule QUESTIONS::no-region-question
   ?f <- (question (already-asked FALSE)
                   (attribute no-region)
                   (the-question ?the-question)
                   (valid-answers $?valid-answers))
   =>
   (modify ?f (already-asked TRUE))
   (bind ?answer (ask-question-av ?the-question ?valid-answers))
   (while (not (eq ?answer stop))
      (assert (attribute (name no-region)  ; LASCIARE ATTRIBUTE O METTERE QUALCOSA DI PIù EVOCATIVO? + LA CERTAINTY VA GESTITA GIà QUA?????
                         (value ?answer)))
      (bind ?answer (ask-question-av ?the-question ?valid-answers))
   )
)

; handle how much the user wants to spend
(defrule QUESTIONS::money-question
   ?f <- (question (already-asked FALSE)
                   (attribute money)
                   (the-question ?the-question))
   =>
   (modify ?f (already-asked TRUE))
   (bind ?answer (ask-question-int ?the-question))
   (if (not (eq ?answer stop))
   then (assert (attribute (name money)  ; LASCIARE ATTRIBUTE O METTERE QUALCOSA DI PIù EVOCATIVO? + LA CERTAINTY VA GESTITA GIà QUA?????
                           (value ?answer))))
)

; handle the minimum number of stars the user wants
(defrule QUESTIONS::min-star-number-question
   ?f <- (question (already-asked FALSE)
                   (attribute min-star-number)
                   (the-question ?the-question)
                   (valid-answers $?valid-answers))
   =>
   (modify ?f (already-asked TRUE))
   (bind ?answer (ask-question-av ?the-question ?valid-answers))
   (if (not (eq ?answer stop)) then
      (assert (attribute (name min-star-number)  ; LASCIARE ATTRIBUTE O METTERE QUALCOSA DI PIù EVOCATIVO? + LA CERTAINTY VA GESTITA GIà QUA?????
                         (value ?answer)))
   )
)

; handle the maximum number of stars the user wants
(defrule QUESTIONS::max-star-number-question
   ?f <- (question (already-asked FALSE)
                   (attribute max-star-number)
                   (the-question ?the-question)
                   (valid-answers $?valid-answers))
   =>
   (modify ?f (already-asked TRUE))
   (bind ?answer (ask-question-av ?the-question ?valid-answers))
   (if (not (eq ?answer stop)) then
      (assert (attribute (name max-star-number)  ; LASCIARE ATTRIBUTE O METTERE QUALCOSA DI PIù EVOCATIVO? + LA CERTAINTY VA GESTITA GIà QUA?????
                         (value ?answer)))
   )
)

; handle how many nights the user wants to spend in the hotels
(defrule QUESTIONS::night-question
   ?f <- (question (already-asked FALSE)
                   (attribute night)
                   (the-question ?the-question))
   =>
   (modify ?f (already-asked TRUE))
   (bind ?answer (ask-question-int ?the-question))
   (if (not (eq ?answer stop))
   then (assert (attribute (name night)  ; LASCIARE ATTRIBUTE O METTERE QUALCOSA DI PIù EVOCATIVO? + LA CERTAINTY VA GESTITA GIà QUA?????
                           (value ?answer))))
)

; handle how many people will spend the nights in the hotels
(defrule QUESTIONS::people-question
   ?f <- (question (already-asked FALSE)
                   (attribute people)
                   (the-question ?the-question))
   =>
   (modify ?f (already-asked TRUE))
   (bind ?answer (ask-question-int ?the-question))
   (if (not (eq ?answer stop))
   then (assert (attribute (name people)  ; LASCIARE ATTRIBUTE O METTERE QUALCOSA DI PIù EVOCATIVO? + LA CERTAINTY VA GESTITA GIà QUA?????
                           (value ?answer))))
)

;;**********************
;;* POSSIBLE QUESTIONS *
;;**********************

(deffacts QUESTIONS::question-attributes
  (question (attribute tourism) ; used in QUESTIONS RULES
            (the-question "Quali tipologie di turismo preferisci? (tra: balneare, montano, lacustre, naturalistico, termale, culturale, religioso, sportivo, enogastronomico): ")
            (valid-answers balneare
                           montano
                           lacustre
                           naturalistico
                           termale
                           culturale
                           religioso
                           sportivo
                           enogastronomico
                           stop))
  (question (attribute ok-region)
            (the-question "Quali regioni italiane vuoi visitare? ")
            (valid-answers piemonte
                           valle-aosta
                           liguria
                           lombardia
                           trentino
                           veneto
                           friuli
                           emilia-romagna
                           toscana
                           umbria
                           marche
                           lazio
                           abruzzo
                           molise
                           campania
                           puglia
                           basilicata
                           calabria
                           sicilia
                           sardegna
                           stop))
  (question (attribute no-region)
            (the-question "Quali regioni italiane NON vuoi visitare? ")
            (valid-answers piemonte
                           valle-aosta
                           liguria
                           lombardia
                           trentino
                           veneto
                           friuli
                           emilia-romagna
                           toscana
                           umbria
                           marche
                           lazio
                           abruzzo
                           molise
                           campania
                           puglia
                           basilicata
                           calabria
                           sicilia
                           sardegna
                           stop))
  (question (attribute money)
            (the-question "Quanto vuoi spendere per il tuo soggiorno? "))
  (question (attribute min-star-number)
            (the-question "Qual è il numero minimo di stelle che deve avere l'hotel in cui vuoi soggiornare? ")
            (valid-answers 1 2 3 4 stop))
  (question (attribute max-star-number)
            (the-question "Qual è il numero massimo di stelle che deve avere l'hotel in cui vuoi soggiornare? ")
            (valid-answers 1 2 3 4 stop))
  (question (attribute night)
            (the-question "Quante notti vuoi trascorrere in vacanza? "))
  (question (attribute people)
            (the-question "Quante persone sarete? "))
)