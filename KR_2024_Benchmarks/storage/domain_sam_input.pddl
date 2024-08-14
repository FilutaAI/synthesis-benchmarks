(define (domain Storage-Propositional)
(:requirements :strips :typing :negative-preconditions)
  (:types
    hoist - object
    surface - object
    place - object
    container - place
    depot - place
    area - surface
    crate - surface
    storearea - area
    transitarea - area
  )

  (:predicates
    (at ?h - hoist ?a - area)
    (available ?h - hoist)
    (clear ?s - storearea)
    (compatible ?c1 - crate ?c2 - crate)
    (connected ?a1 - area ?a2 - area)
    (in ?x - surface ?p - place)
    (lifting ?h - hoist ?c - crate)
    (on ?c - crate ?s - storearea)
  )
  (:action go-in
    :parameters (?h - hoist ?from - transitarea ?to - storearea)
    :precondition (
    )
    :effect (
    )
  )

  (:action go-out
    :parameters (?h - hoist ?from - storearea ?to - transitarea)
    :precondition (
    )
    :effect (
    )
  )

  (:action drop
    :parameters (?h - hoist ?c - crate ?a1 - storearea ?a2 - area ?p - place)
    :precondition (
    )
    :effect (
    )
  )

  (:action lift
    :parameters (?h - hoist ?c - crate ?a1 - storearea ?a2 - area ?p - place)
    :precondition (
    )
    :effect (
    )
  )

  (:action move
    :parameters (?h - hoist ?from - storearea ?to - storearea)
    :precondition (
    )
    :effect (
    )
  )

)

