(define (domain transport)
(:requirements :strips :typing :negative-preconditions)
  (:types
    location - object
    target - object
    locatable - object
    vehicle - locatable
    package - locatable
    capacity-number - object
  )

  (:predicates
    (at ?x - locatable ?v - location)
    (capacity ?v - vehicle ?s1 - capacity-number)
    (capacity-predecessor ?s1 - capacity-number ?s2 - capacity-number)
    (in ?x - package ?v - vehicle)
    (road ?l1 - location ?l2 - location)
  )
  (:action drive
    :parameters (?v - vehicle ?l1 - location ?l2 - location)
    :precondition (
    )
    :effect (
    )
  )

  (:action pick-up
    :parameters (?v - vehicle ?l - location ?p - package ?s1 - capacity-number ?s2 - capacity-number)
    :precondition (
    )
    :effect (
    )
  )

  (:action drop
    :parameters (?v - vehicle ?l - location ?p - package ?s1 - capacity-number ?s2 - capacity-number)
    :precondition (
    )
    :effect (
    )
  )

)

