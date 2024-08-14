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
  (:action load
    :parameters (?g - goods ?t - truck ?m - market ?l1 - level ?l2 - level ?l3 - level ?l4 - level)
    :precondition (
    )
    :effect (
    )
  )

  (:action unload
    :parameters (?g - goods ?t - truck ?d - depot ?l1 - level ?l2 - level ?l3 - level ?l4 - level)
    :precondition (
    )
    :effect (
    )
  )

  (:action drive
    :parameters (?t - truck ?from - place ?to - place)
    :precondition (
    )
    :effect (
    )
  )

  (:action buy
    :parameters (?t - truck ?g - goods ?m - market ?l1 - level ?l2 - level ?l3 - level ?l4 - level)
    :precondition (
    )
    :effect (
    )
  )

)

