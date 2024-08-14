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
  (:action pick-up
    :parameters (?capacity-number1 - capacity-number ?capacity-number2 - capacity-number ?location1 - location ?package1 - package ?vehicle1 - vehicle)
    :precondition (and
      (at ?package1 ?location1)
      (at ?vehicle1 ?location1)
      (capacity ?vehicle1 ?capacity-number2)
      (capacity-predecessor ?capacity-number1 ?capacity-number2)
      (not(capacity ?vehicle1 ?capacity-number1))
      (not(in ?package1 ?vehicle1))
    )
    :effect (and
      (capacity ?vehicle1 ?capacity-number1)
      (in ?package1 ?vehicle1)
      (not(at ?package1 ?location1))
      (not(capacity ?vehicle1 ?capacity-number2))
    )
  )

  (:action drive
    :parameters (?location1 - location ?location2 - location ?vehicle1 - vehicle)
    :precondition (and
      (at ?vehicle1 ?location2)
      (not(at ?vehicle1 ?location1))
      (road ?location1 ?location2)
      (road ?location2 ?location1)
    )
    :effect (and
      (at ?vehicle1 ?location1)
      (not(at ?vehicle1 ?location2))
    )
  )

  (:action drop
    :parameters (?capacity-number1 - capacity-number ?capacity-number2 - capacity-number ?location1 - location ?package1 - package ?vehicle1 - vehicle)
    :precondition (and
      (at ?vehicle1 ?location1)
      (capacity ?vehicle1 ?capacity-number2)
      (capacity-predecessor ?capacity-number2 ?capacity-number1)
      (in ?package1 ?vehicle1)
      (not(at ?package1 ?location1))
      (not(capacity ?vehicle1 ?capacity-number1))
    )
    :effect (and
      (at ?package1 ?location1)
      (capacity ?vehicle1 ?capacity-number1)
      (not(capacity ?vehicle1 ?capacity-number2))
      (not(in ?package1 ?vehicle1))
    )
  )

)
