(define (domain pegsolitaire-sequential)
(:requirements :strips :typing :negative-preconditions)
  (:types
    location - object
  )

  (:predicates
    (in-line ?x - location ?y - location ?z - location)
    (free ?l - location)
    (last-visited ?l - location)
    (move-ended )
    (occupied ?l - location)
  )
  (:action jump-continue-move
    :parameters (?from - location ?over - location ?to - location)
    :precondition (
    )
    :effect (
    )
  )

  (:action end-move
    :parameters (?loc - location)
    :precondition (
    )
    :effect (
    )
  )

  (:action jump-new-move
    :parameters (?from - location ?over - location ?to - location)
    :precondition (
    )
    :effect (
    )
  )

)

