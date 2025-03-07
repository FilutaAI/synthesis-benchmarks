(define (domain pegsolitaire-sequential)
(:requirements :strips :typing :negative-preconditions :equality)
  (:types
    location - object
  )

  (:predicates
    (free ?l - location)
    (in-line ?x - location ?y - location ?z - location)
    (last-visited ?l - location)
    (move-ended )
    (occupied ?l - location)
  )
  (:action end-move
    :parameters (?location1 - location)
    :precondition (and
      (last-visited ?location1)
      (occupied ?location1)
    )
    :effect (and
      (move-ended)
      (not(last-visited ?location1))
    )
  )

  (:action jump-new-move
    :parameters (?location1 - location ?location2 - location ?location3 - location)
    :precondition (and
      (free ?location3)
      (move-ended)
      (occupied ?location1)
      (occupied ?location2)
    )
    :effect (and
      (free ?location1)
      (free ?location2)
      (last-visited ?location3)
      (not(free ?location3))
      (not(move-ended))
      (not(occupied ?location1))
      (not(occupied ?location2))
      (occupied ?location3)
    )
  )

  (:action jump-continue-move
    :parameters (?location1 - location ?location2 - location ?location3 - location)
    :precondition (and
      (free ?location2)
      (in-line ?location2 ?location1 ?location3)
      (in-line ?location3 ?location1 ?location2)
      (last-visited ?location3)
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

)
