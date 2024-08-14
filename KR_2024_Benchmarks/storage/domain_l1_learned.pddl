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
  (:action go-out
    :parameters (?hoist1 - hoist ?storearea1 - storearea ?transitarea1 - transitarea)
    :precondition (and
      (at ?hoist1 ?storearea1)
      (available ?hoist1)
      (connected ?storearea1 ?transitarea1)
      (connected ?transitarea1 ?storearea1)
      (not(at ?hoist1 ?transitarea1))
      (not(clear ?storearea1))
    )
    :effect (and
      (at ?hoist1 ?transitarea1)
      (clear ?storearea1)
      (not(at ?hoist1 ?storearea1))
    )
  )

  (:action lift
    :parameters (?container1 - container ?crate1 - crate ?hoist1 - hoist ?storearea1 - storearea ?transitarea1 - transitarea)
    :precondition (and
      (at ?hoist1 ?transitarea1)
      (available ?hoist1)
      (connected ?storearea1 ?transitarea1)
      (connected ?transitarea1 ?storearea1)
      (in ?crate1 ?container1)
      (in ?storearea1 ?container1)
      (not(clear ?storearea1))
      (not(lifting ?hoist1 ?crate1))
      (on ?crate1 ?storearea1)
    )
    :effect (and
      (clear ?storearea1)
      (lifting ?hoist1 ?crate1)
      (not(available ?hoist1))
      (not(in ?crate1 ?container1))
      (not(on ?crate1 ?storearea1))
    )
  )

  (:action drop
    :parameters (?area1 - area ?crate1 - crate ?depot1 - depot ?hoist1 - hoist ?storearea1 - storearea)
    :precondition (and
      (at ?hoist1 ?area1)
      (clear ?storearea1)
      (connected ?area1 ?storearea1)
      (connected ?storearea1 ?area1)
      (in ?storearea1 ?depot1)
      (lifting ?hoist1 ?crate1)
      (not(available ?hoist1))
      (not(in ?crate1 ?depot1))
      (not(on ?crate1 ?storearea1))
    )
    :effect (and
      (available ?hoist1)
      (in ?crate1 ?depot1)
      (not(clear ?storearea1))
      (not(lifting ?hoist1 ?crate1))
      (on ?crate1 ?storearea1)
    )
  )

  (:action move
    :parameters (?hoist1 - hoist ?storearea1 - storearea ?storearea2 - storearea)
    :precondition (and
      (at ?hoist1 ?storearea2)
      (available ?hoist1)
      (clear ?storearea1)
      (connected ?storearea1 ?storearea2)
      (connected ?storearea2 ?storearea1)
      (not(at ?hoist1 ?storearea1))
      (not(clear ?storearea2))
    )
    :effect (and
      (at ?hoist1 ?storearea1)
      (clear ?storearea2)
      (not(at ?hoist1 ?storearea2))
      (not(clear ?storearea1))
    )
  )

  (:action go-in
    :parameters (?hoist1 - hoist ?storearea1 - storearea ?transitarea1 - transitarea)
    :precondition (and
      (at ?hoist1 ?transitarea1)
      (clear ?storearea1)
      (connected ?storearea1 ?transitarea1)
      (connected ?transitarea1 ?storearea1)
      (not(at ?hoist1 ?storearea1))
    )
    :effect (and
      (at ?hoist1 ?storearea1)
      (not(at ?hoist1 ?transitarea1))
      (not(clear ?storearea1))
    )
  )

)
