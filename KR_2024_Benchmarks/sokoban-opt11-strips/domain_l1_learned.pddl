(define (domain sokoban-sequential)
(:requirements :strips :typing :negative-preconditions)
  (:types
    thing - object
    location - object
    direction - object
    player - thing
    stone - thing
  )

  (:predicates
    (is-goal ?l - location)
    (is-nongoal ?l - location)
    (move-dir ?from - location ?to - location ?dir - direction)
    (at ?t - thing ?l - location)
    (at-goal ?s - stone)
    (clear ?l - location)
  )
  (:action move
    :parameters (?direction1 - direction ?location1 - location ?location2 - location ?player1 - player)
    :precondition (and
      (at ?player1 ?location2)
      (clear ?location1)
      (move-dir ?location2 ?location1 ?direction1)
      (not(at ?player1 ?location1))
      (not(clear ?location2))
    )
    :effect (and
      (at ?player1 ?location1)
      (clear ?location2)
      (not(at ?player1 ?location2))
      (not(clear ?location1))
    )
  )

  (:action push-to-nongoal
    :parameters (?direction1 - direction ?location1 - location ?location2 - location ?location3 - location ?player1 - player ?stone1 - stone)
    :precondition (and
      (at ?player1 ?location1)
      (at ?stone1 ?location3)
      (clear ?location2)
      (is-nongoal ?location2)
      (move-dir ?location1 ?location3 ?direction1)
      (move-dir ?location3 ?location2 ?direction1)
      (not(at ?player1 ?location3))
      (not(at ?stone1 ?location2))
      (not(clear ?location1))
    )
    :effect (and
      (at ?player1 ?location3)
      (at ?stone1 ?location2)
      (clear ?location1)
      (not(at ?player1 ?location1))
      (not(at ?stone1 ?location3))
      (not(at-goal ?stone1))
      (not(clear ?location2))
    )
  )

  (:action push-to-goal
    :parameters (?direction1 - direction ?location1 - location ?location2 - location ?location3 - location ?player1 - player ?stone1 - stone)
    :precondition (and
      (at ?player1 ?location1)
      (at ?stone1 ?location3)
      (clear ?location2)
      (is-goal ?location2)
      (move-dir ?location1 ?location3 ?direction1)
      (move-dir ?location3 ?location2 ?direction1)
      (not(at ?player1 ?location3))
      (not(at ?stone1 ?location2))
      (not(clear ?location1))
    )
    :effect (and
      (at ?player1 ?location3)
      (at ?stone1 ?location2)
      (at-goal ?stone1)
      (clear ?location1)
      (not(at ?player1 ?location1))
      (not(at ?stone1 ?location3))
      (not(clear ?location2))
    )
  )

)
