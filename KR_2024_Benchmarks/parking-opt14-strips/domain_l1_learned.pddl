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
  (:action move-car-to-curb
    :parameters (?car1 - car ?car2 - car ?curb1 - curb)
    :precondition (and
      (at-curb ?car1)
      (behind-car ?car2 ?car1)
      (car-clear ?car2)
      (curb-clear ?curb1)
      (not(at-curb ?car2))
      (not(at-curb-num ?car2 ?curb1))
      (not(car-clear ?car1))
    )
    :effect (and
      (at-curb ?car2)
      (at-curb-num ?car2 ?curb1)
      (car-clear ?car1)
      (not(behind-car ?car2 ?car1))
      (not(curb-clear ?curb1))
    )
  )

  (:action move-car-to-car
    :parameters (?car1 - car ?car2 - car ?car3 - car)
    :precondition (and
      (at-curb ?car1)
      (at-curb ?car3)
      (behind-car ?car2 ?car1)
      (car-clear ?car2)
      (car-clear ?car3)
      (not(behind-car ?car2 ?car3))
      (not(car-clear ?car1))
    )
    :effect (and
      (behind-car ?car2 ?car3)
      (car-clear ?car1)
      (not(behind-car ?car2 ?car1))
      (not(car-clear ?car3))
    )
  )

  (:action move-curb-to-car
    :parameters (?car1 - car ?car2 - car ?curb1 - curb)
    :precondition (and
      (at-curb ?car1)
      (at-curb ?car2)
      (at-curb-num ?car2 ?curb1)
      (car-clear ?car1)
      (car-clear ?car2)
      (not(behind-car ?car2 ?car1))
      (not(curb-clear ?curb1))
    )
    :effect (and
      (behind-car ?car2 ?car1)
      (curb-clear ?curb1)
      (not(at-curb ?car2))
      (not(at-curb-num ?car2 ?curb1))
      (not(car-clear ?car1))
    )
  )

)
