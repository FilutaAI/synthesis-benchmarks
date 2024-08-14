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
    :parameters (?place1 - place ?place2 - place)
    :precondition (and
      (at-robot ?place2)
      (connected ?place1 ?place2)
      (connected ?place2 ?place1)
      (not(at-robot ?place1))
      (visited ?place2)
    )
    :effect (and
      (at-robot ?place1)
      (not(at-robot ?place2))
      (visited ?place1)
    )
  )

)
