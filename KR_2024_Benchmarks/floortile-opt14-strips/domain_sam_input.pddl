(define (domain floor-tile)
(:requirements :strips :typing :negative-preconditions)
  (:types
    robot - object
    tile - object
    color - object
  )

  (:predicates
    (available-color ?c - color)
    (clear ?x - tile)
    (down ?x - tile ?y - tile)
    (free-color ?r - robot)
    (left ?x - tile ?y - tile)
    (painted ?x - tile ?c - color)
    (right ?x - tile ?y - tile)
    (robot-at ?r - robot ?x - tile)
    (robot-has ?r - robot ?c - color)
    (up ?x - tile ?y - tile)
  )
  (:action up
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (
    )
    :effect (
    )
  )

  (:action change-color
    :parameters (?r - robot ?c - color ?c2 - color)
    :precondition (
    )
    :effect (
    )
  )

  (:action paint-up
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (
    )
    :effect (
    )
  )

  (:action right
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (
    )
    :effect (
    )
  )

  (:action down
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (
    )
    :effect (
    )
  )

  (:action paint-down
    :parameters (?r - robot ?y - tile ?x - tile ?c - color)
    :precondition (
    )
    :effect (
    )
  )

  (:action left
    :parameters (?r - robot ?x - tile ?y - tile)
    :precondition (
    )
    :effect (
    )
  )

)

