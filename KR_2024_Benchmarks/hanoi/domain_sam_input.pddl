(define (domain hanoi-domain)
(:requirements :strips :typing :negative-preconditions)
  (:types
    disc - object
  )

  (:predicates
    (clear ?x - disc)
    (on ?x - disc ?y - disc)
    (smaller ?x - disc ?y - disc)
  )
  (:action move
    :parameters (?to - disc ?disc - disc ?from - disc)
    :precondition (
    )
    :effect (
    )
  )

)

