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
  (:action drive
    :parameters (?fuellevel1 - fuellevel ?fuellevel2 - fuellevel ?fuellevel3 - fuellevel ?location1 - location ?location2 - location ?truck1 - truck)
    :precondition (and
      (at ?truck1 ?location2)
      (connected ?location1 ?location2)
      (connected ?location2 ?location1)
      (fuel ?truck1 ?fuellevel2)
      (fuelcost ?fuellevel3 ?location1 ?location2)
      (fuelcost ?fuellevel3 ?location2 ?location1)
      (not(at ?truck1 ?location1))
      (not(fuel ?truck1 ?fuellevel1))
      (sum ?fuellevel1 ?fuellevel3 ?fuellevel2)
      (sum ?fuellevel3 ?fuellevel1 ?fuellevel2)
    )
    :effect (and
      (at ?truck1 ?location1)
      (fuel ?truck1 ?fuellevel1)
      (not(at ?truck1 ?location2))
      (not(fuel ?truck1 ?fuellevel2))
    )
  )

  (:action load
    :parameters (?location1 - location ?package1 - package ?truck1 - truck)
    :precondition (and
      (at ?package1 ?location1)
      (at ?truck1 ?location1)
      (not(in ?package1 ?truck1))
    )
    :effect (and
      (in ?package1 ?truck1)
      (not(at ?package1 ?location1))
    )
  )

  (:action unload
    :parameters (?location1 - location ?package1 - package ?truck1 - truck)
    :precondition (and
      (at ?truck1 ?location1)
      (in ?package1 ?truck1)
      (not(at ?package1 ?location1))
    )
    :effect (and
      (at ?package1 ?location1)
      (not(in ?package1 ?truck1))
    )
  )

)
