(define (domain thoughtful-typed)
(:requirements :strips :typing :negative-preconditions)
  (:types
    card - object
    colnum - object
    num - object
    suittype - object
  )

  (:predicates
    (ace ?c - card)
    (bottomcol ?c - card)
    (bottomtalon ?c - card)
    (canstack ?c1 - card ?c2 - card)
    (clear ?c - card)
    (colspace ?n - colnum)
    (colsuccessor ?n1 - colnum ?n0 - colnum)
    (faceup ?c - card)
    (home ?c - card)
    (instack ?c - card)
    (king ?c - card)
    (on ?c1 - card ?c2 - card)
    (ontalon ?c1 - card ?c2 - card)
    (successor ?n1 - num ?n0 - num)
    (suit ?c - card ?s - suittype)
    (talonplayable ?c - card)
    (toptalon ?c - card)
    (value ?c - card ?v - num)
  )
  (:action turn-deck
    :parameters (?card - card ?c1 - card)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-col-e
    :parameters (?card - card ?oldcard - card ?cardabove - card ?cols - colnum ?ncols - colnum)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-col-to-col-c
    :parameters (?card - card ?oldcard - card ?cols - colnum ?ncols - colnum)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-col-to-col
    :parameters (?card - card ?oldcard - card ?newcard - card)
    :precondition (
    )
    :effect (
    )
  )

  (:action turn-deck-a
    :parameters (?card - card ?c1 - card)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-col-to-col-b
    :parameters (?card - card ?newcard - card ?cols - colnum ?ncols - colnum)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-home-b
    :parameters (?card - card ?cardabove - card ?homecard - card ?cardsuit - suittype ?vcard - num ?vhomecard - num)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-col-d
    :parameters (?card - card ?newcard - card)
    :precondition (
    )
    :effect (
    )
  )

  (:action home-to-col-a
    :parameters (?card - card ?cardbelow - card ?cardsuit - suittype ?vcard - num ?vcardbelow - num ?cols - colnum ?ncols - colnum)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-col-c
    :parameters (?card - card ?newcard - card ?oldcard - card)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-col
    :parameters (?card - card ?oldcard - card ?newcard - card ?cardabove - card)
    :precondition (
    )
    :effect (
    )
  )

  (:action col-to-home
    :parameters (?card - card ?oldcard - card ?suit - suittype ?vcard - num ?homecard - card ?vhomecard - num)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-col-h
    :parameters (?card - card ?cols - colnum ?ncols - colnum)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-col-f
    :parameters (?card - card ?cardabove - card ?cols - colnum ?ncols - colnum)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-col-g
    :parameters (?card - card ?oldcard - card ?cols - colnum ?ncols - colnum)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-home
    :parameters (?card - card ?cardabove - card ?cardbelow - card ?homecard - card ?cardsuit - suittype ?vcard - num ?vhomecard - num)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-home-d
    :parameters (?card - card ?homecard - card ?cardsuit - suittype ?vcard - num ?vhomecard - num)
    :precondition (
    )
    :effect (
    )
  )

  (:action home-to-col
    :parameters (?card - card ?cardbelow - card ?newcard - card ?cardsuit - suittype ?vcard - num ?vcardbelow - num)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-home-c
    :parameters (?card - card ?cardbelow - card ?homecard - card ?cardsuit - suittype ?vcard - num ?vhomecard - num)
    :precondition (
    )
    :effect (
    )
  )

  (:action tal-to-col-b
    :parameters (?card - card ?newcard - card ?cardabove - card)
    :precondition (
    )
    :effect (
    )
  )

  (:action col-to-home-b
    :parameters (?card - card ?homecard - card ?suit - suittype ?vcard - num ?vhomecard - num ?cols - colnum ?ncols - colnum)
    :precondition (
    )
    :effect (
    )
  )

)

