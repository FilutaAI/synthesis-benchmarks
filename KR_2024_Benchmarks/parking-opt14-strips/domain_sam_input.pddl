(define (domain parking)
(:requirements :strips :typing :negative-preconditions)
  (:types
    car - object
    curb - object
  )

  (:predicates
    (at-curb ?car - car)
    (at-curb-num ?car - car ?curb - curb)
    (behind-car ?car - car ?front-car - car)
    (car-clear ?car - car)
    (curb-clear ?curb - curb)
  )
  (:action move-curb-to-curb
    :parameters (?car - car ?curbsrc - curb ?curbdest - curb)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-curb-to-car
    :parameters (?car - car ?curbsrc - curb ?cardest - car)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-car-to-car
    :parameters (?car - car ?carsrc - car ?cardest - car)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-car-to-curb
    :parameters (?car - car ?carsrc - car ?curbdest - curb)
    :precondition (
    )
    :effect (
    )
  )

)

