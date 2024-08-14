(define (domain TPP-Propositional)
(:requirements :strips :typing :negative-preconditions)
  (:types
    place - object
    locatable - object
    level - object
    depot - place
    market - place
    truck - locatable
    goods - locatable
  )

  (:predicates
    (at ?t - truck ?p - place)
    (connected ?p1 - place ?p2 - place)
    (loaded ?g - goods ?t - truck ?l - level)
    (next ?l1 - level ?l2 - level)
    (on-sale ?g - goods ?m - market ?l - level)
    (ready-to-load ?g - goods ?m - market ?l - level)
    (stored ?g - goods ?l - level)
  )
  (:action drive
    :parameters (?place1 - place ?place2 - place ?truck1 - truck)
    :precondition (and
      (at ?truck1 ?place2)
      (connected ?place1 ?place2)
      (connected ?place2 ?place1)
      (not(at ?truck1 ?place1))
    )
    :effect (and
      (at ?truck1 ?place1)
      (not(at ?truck1 ?place2))
    )
  )

  (:action buy
    :parameters (?goods1 - goods ?level1 - level ?level2 - level ?market1 - market ?truck1 - truck)
    :precondition (and
      (at ?truck1 ?market1)
      (loaded ?goods1 ?truck1 ?level2)
      (next ?level1 ?level2)
      (not(on-sale ?goods1 ?market1 ?level2))
      (not(ready-to-load ?goods1 ?market1 ?level1))
      (on-sale ?goods1 ?market1 ?level1)
      (ready-to-load ?goods1 ?market1 ?level2)
      (stored ?goods1 ?level2)
    )
    :effect (and
      (not(on-sale ?goods1 ?market1 ?level1))
      (not(ready-to-load ?goods1 ?market1 ?level2))
      (on-sale ?goods1 ?market1 ?level2)
      (ready-to-load ?goods1 ?market1 ?level1)
    )
  )

  (:action load
    :parameters (?goods1 - goods ?level1 - level ?level2 - level ?market1 - market ?truck1 - truck)
    :precondition (and
      (at ?truck1 ?market1)
      (loaded ?goods1 ?truck1 ?level2)
      (next ?level1 ?level2)
      (not(loaded ?goods1 ?truck1 ?level1))
      (not(ready-to-load ?goods1 ?market1 ?level2))
      (on-sale ?goods1 ?market1 ?level2)
      (ready-to-load ?goods1 ?market1 ?level1)
      (stored ?goods1 ?level2)
    )
    :effect (and
      (loaded ?goods1 ?truck1 ?level1)
      (not(loaded ?goods1 ?truck1 ?level2))
      (not(ready-to-load ?goods1 ?market1 ?level1))
      (ready-to-load ?goods1 ?market1 ?level2)
    )
  )

  (:action unload
    :parameters (?depot1 - depot ?goods1 - goods ?level1 - level ?level2 - level ?truck1 - truck)
    :precondition (and
      (at ?truck1 ?depot1)
      (loaded ?goods1 ?truck1 ?level2)
      (next ?level2 ?level1)
      (not(loaded ?goods1 ?truck1 ?level1))
      (not(stored ?goods1 ?level2))
      (stored ?goods1 ?level1)
    )
    :effect (and
      (loaded ?goods1 ?truck1 ?level1)
      (not(loaded ?goods1 ?truck1 ?level2))
      (not(stored ?goods1 ?level1))
      (stored ?goods1 ?level2)
    )
  )

)
