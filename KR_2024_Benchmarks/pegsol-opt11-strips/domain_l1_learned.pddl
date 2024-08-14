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
  (:action jump-new-move
    :parameters (?location1 - location ?location2 - location ?location3 - location ?location4 - location ?location5 - location)
    :precondition (and
      (free ?location5)
      (in-line ?location2 ?location1 ?location5)
      (in-line ?location5 ?location1 ?location2)
      (move-ended)
      (not(free ?location3))
      (not(free ?location4))
      (not(last-visited ?location5))
      (not(occupied ?location5))
      (occupied ?location1)
      (occupied ?location2)
      (occupied ?location3)
      (occupied ?location4)
    )
    :effect (and
      (free ?location3)
      (free ?location4)
      (last-visited ?location5)
      (not(free ?location5))
      (not(move-ended))
      (not(occupied ?location3))
      (not(occupied ?location4))
      (occupied ?location5)
    )
  )

  (:action jump-continue-move
    :parameters (?location1 - location ?location2 - location ?location3 - location)
    :precondition (and
      (free ?location2)
      (in-line ?location2 ?location1 ?location3)
      (in-line ?location3 ?location1 ?location2)
      (last-visited ?location3)
      (not(free ?location1))
      (not(free ?location3))
      (not(last-visited ?location2))
      (not(occupied ?location2))
      (occupied ?location1)
      (occupied ?location3)
    )
    :effect (and
      (free ?location1)
      (free ?location3)
      (last-visited ?location2)
      (not(free ?location2))
      (not(last-visited ?location3))
      (not(occupied ?location1))
      (not(occupied ?location3))
      (occupied ?location2)
    )
  )

  (:action end-move
    :parameters (?location1 - location)
    :precondition (and
      (last-visited ?location1)
      (not(move-ended))
      (occupied ?location1)
    )
    :effect (and
      (move-ended)
      (not(last-visited ?location1))
    )
  )

)
