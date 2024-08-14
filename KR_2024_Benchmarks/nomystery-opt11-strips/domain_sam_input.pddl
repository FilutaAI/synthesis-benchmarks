(define (domain transport-strips)
(:requirements :strips :typing :negative-preconditions)
  (:types
    location - object
    fuellevel - object
    locatable - object
    package - locatable
    truck - locatable
  )

  (:predicates
    (at ?o - locatable ?l - location)
    (connected ?l1 - location ?l2 - location)
    (fuel ?t - truck ?level - fuellevel)
    (fuelcost ?level - fuellevel ?l1 - location ?l2 - location)
    (in ?p - package ?t - truck)
    (sum ?a - fuellevel ?b - fuellevel ?c - fuellevel)
  )
  (:action unload
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (
    )
    :effect (
    )
  )

  (:action load
    :parameters (?p - package ?t - truck ?l - location)
    :precondition (
    )
    :effect (
    )
  )

  (:action drive
    :parameters (?t - truck ?l1 - location ?l2 - location ?fuelpost - fuellevel ?fueldelta - fuellevel ?fuelpre - fuellevel)
    :precondition (
    )
    :effect (
    )
  )

)

