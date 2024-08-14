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
  (:action change-color
    :parameters (?color1 - color ?color2 - color ?robot1 - robot)
    :precondition (and
      (available-color ?color1)
      (available-color ?color2)
      (not(robot-has ?robot1 ?color1))
      (robot-has ?robot1 ?color2)
    )
    :effect (and
      (not(robot-has ?robot1 ?color2))
      (robot-has ?robot1 ?color1)
    )
  )

  (:action up
    :parameters (?robot1 - robot ?tile1 - tile ?tile2 - tile)
    :precondition (and
      (clear ?tile1)
      (down ?tile2 ?tile1)
      (not(clear ?tile2))
      (not(robot-at ?robot1 ?tile1))
      (robot-at ?robot1 ?tile2)
      (up ?tile1 ?tile2)
    )
    :effect (and
      (clear ?tile2)
      (not(clear ?tile1))
      (not(robot-at ?robot1 ?tile2))
      (robot-at ?robot1 ?tile1)
    )
  )

  (:action paint-up
    :parameters (?color1 - color ?robot1 - robot ?tile1 - tile ?tile2 - tile)
    :precondition (and
      (available-color ?color1)
      (clear ?tile2)
      (down ?tile1 ?tile2)
      (not(painted ?tile2 ?color1))
      (robot-at ?robot1 ?tile1)
      (robot-has ?robot1 ?color1)
      (up ?tile2 ?tile1)
    )
    :effect (and
      (not(clear ?tile2))
      (painted ?tile2 ?color1)
    )
  )

  (:action left
    :parameters (?robot1 - robot ?tile1 - tile ?tile2 - tile)
    :precondition (and
      (clear ?tile1)
      (left ?tile1 ?tile2)
      (not(clear ?tile2))
      (not(robot-at ?robot1 ?tile1))
      (right ?tile2 ?tile1)
      (robot-at ?robot1 ?tile2)
    )
    :effect (and
      (clear ?tile2)
      (not(clear ?tile1))
      (not(robot-at ?robot1 ?tile2))
      (robot-at ?robot1 ?tile1)
    )
  )

  (:action down
    :parameters (?robot1 - robot ?tile1 - tile ?tile2 - tile)
    :precondition (and
      (clear ?tile1)
      (down ?tile1 ?tile2)
      (not(clear ?tile2))
      (not(robot-at ?robot1 ?tile1))
      (robot-at ?robot1 ?tile2)
      (up ?tile2 ?tile1)
    )
    :effect (and
      (clear ?tile2)
      (not(clear ?tile1))
      (not(robot-at ?robot1 ?tile2))
      (robot-at ?robot1 ?tile1)
    )
  )

  (:action right
    :parameters (?robot1 - robot ?tile1 - tile ?tile2 - tile)
    :precondition (and
      (clear ?tile1)
      (left ?tile2 ?tile1)
      (not(clear ?tile2))
      (not(robot-at ?robot1 ?tile1))
      (right ?tile1 ?tile2)
      (robot-at ?robot1 ?tile2)
    )
    :effect (and
      (clear ?tile2)
      (not(clear ?tile1))
      (not(robot-at ?robot1 ?tile2))
      (robot-at ?robot1 ?tile1)
    )
  )

)
