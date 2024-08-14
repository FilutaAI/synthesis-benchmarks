(define (domain grid-visit-all)
(:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
  )

  (:predicates
    (at-robot ?x - place)
    (connected ?x - place ?y - place)
    (visited ?x - place)
  )
  (:action move
    :parameters (?curpos - place ?nextpos - place)
    :precondition (
    )
    :effect (
    )
  )

)

