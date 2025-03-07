(define (domain TIDYBOT)
(:requirements :strips :typing :negative-preconditions :equality)
  (:types
    robot - object
    cart - object
    xc - object
    yc - object
    xrel - object
    yrel - object
    tobject - object
  )

  (:predicates
    (above ?y1 - yc ?y2 - yc)
    (above-rel ?y1 - yrel ?y2 - yrel)
    (base-obstacle ?x - xc ?y - yc)
    (base-pos ?r - robot ?x - xc ?y - yc)
    (cart-pos ?c - cart ?x - xc ?y - yc)
    (gripper-empty ?r - robot)
    (gripper-obstacle ?x - xc ?y - yc)
    (gripper-rel ?r - robot ?x - xrel ?y - yrel)
    (holding ?r - robot ?o - tobject)
    (leftof ?x1 - xc ?x2 - xc)
    (leftof-rel ?x1 - xrel ?x2 - xrel)
    (not-pushed ?c - cart)
    (not-pushing ?r - robot)
    (object-done ?o - tobject)
    (object-goal ?o - tobject ?x - xc ?y - yc)
    (object-pos ?o - tobject ?x - xc ?y - yc)
    (on-cart ?o - tobject ?c - cart)
    (parked ?r - robot)
    (pushing ?r - robot ?c - cart)
    (sum-x ?x - xc ?xr - xrel ?xsum - xc)
    (sum-y ?y - yc ?yr - yrel ?ysum - yc)
    (surface ?x - xc ?y - yc)
    (zerox-rel ?x - xrel)
    (zeroy-rel ?y - yrel)
  )
  (:action gripper-up
    :parameters (?robot1 - robot ?xc1 - xc ?xrel1 - xrel ?yc1 - yc ?yc2 - yc ?yrel1 - yrel ?yrel2 - yrel)
    :precondition (and
      (above-rel ?yrel1 ?yrel2)
      (gripper-rel ?robot1 ?xrel1 ?yrel2)
      (not-pushing ?robot1)
      (parked ?robot1)
    )
    :effect (and
      (gripper-obstacle ?xc1 ?yc2)
      (gripper-rel ?robot1 ?xrel1 ?yrel1)
      (not(gripper-obstacle ?xc1 ?yc1))
      (not(gripper-rel ?robot1 ?xrel1 ?yrel2))
    )
  )

  (:action base-up
    :parameters (?robot1 - robot ?xc1 - xc ?yc1 - yc ?yc2 - yc)
    :precondition (and
      (above ?yc1 ?yc2)
      (base-obstacle ?xc1 ?yc2)
      (base-pos ?robot1 ?xc1 ?yc2)
      (not-pushing ?robot1)
    )
    :effect (and
      (base-obstacle ?xc1 ?yc1)
      (base-pos ?robot1 ?xc1 ?yc1)
      (not(base-obstacle ?xc1 ?yc2))
      (not(base-pos ?robot1 ?xc1 ?yc2))
    )
  )

  (:action get-left
    :parameters (?robot1 - robot ?tobject1 - tobject ?xc1 - xc ?yc1 - yc)
    :precondition (and
      (gripper-empty ?robot1)
      (gripper-obstacle ?xc1 ?yc1)
      (not-pushing ?robot1)
      (object-pos ?tobject1 ?xc1 ?yc1)
      (parked ?robot1)
      (surface ?xc1 ?yc1)
    )
    :effect (and
      (holding ?robot1 ?tobject1)
      (not(gripper-empty ?robot1))
      (not(gripper-obstacle ?xc1 ?yc1))
      (not(object-pos ?tobject1 ?xc1 ?yc1))
    )
  )

  (:action gripper-left
    :parameters (?robot1 - robot ?xc1 - xc ?xc2 - xc ?xrel1 - xrel ?xrel2 - xrel ?yc1 - yc ?yrel1 - yrel)
    :precondition (and
      (gripper-rel ?robot1 ?xrel2 ?yrel1)
      (leftof-rel ?xrel1 ?xrel2)
      (not-pushing ?robot1)
      (parked ?robot1)
    )
    :effect (and
      (gripper-obstacle ?xc2 ?yc1)
      (gripper-rel ?robot1 ?xrel1 ?yrel1)
      (not(gripper-obstacle ?xc1 ?yc1))
      (not(gripper-rel ?robot1 ?xrel2 ?yrel1))
    )
  )

  (:action gripper-down
    :parameters (?robot1 - robot ?xc1 - xc ?xrel1 - xrel ?yc1 - yc ?yc2 - yc ?yrel1 - yrel ?yrel2 - yrel)
    :precondition (and
      (above-rel ?yrel2 ?yrel1)
      (gripper-rel ?robot1 ?xrel1 ?yrel2)
      (not-pushing ?robot1)
      (parked ?robot1)
    )
    :effect (and
      (gripper-obstacle ?xc1 ?yc2)
      (gripper-rel ?robot1 ?xrel1 ?yrel1)
      (not(gripper-obstacle ?xc1 ?yc1))
      (not(gripper-rel ?robot1 ?xrel1 ?yrel2))
    )
  )

  (:action put-up
    :parameters (?robot1 - robot ?tobject1 - tobject ?xc1 - xc ?yc1 - yc)
    :precondition (and
      (holding ?robot1 ?tobject1)
      (not-pushing ?robot1)
      (object-goal ?tobject1 ?xc1 ?yc1)
      (parked ?robot1)
      (surface ?xc1 ?yc1)
    )
    :effect (and
      (gripper-empty ?robot1)
      (gripper-obstacle ?xc1 ?yc1)
      (not(holding ?robot1 ?tobject1))
      (object-pos ?tobject1 ?xc1 ?yc1)
    )
  )

  (:action finish-object
    :parameters (?tobject1 - tobject)
    :precondition (
    )
    :effect (and
      (object-done ?tobject1)
    )
  )

  (:action put-down
    :parameters (?robot1 - robot ?tobject1 - tobject ?xc1 - xc ?yc1 - yc)
    :precondition (and
      (holding ?robot1 ?tobject1)
      (not-pushing ?robot1)
      (object-goal ?tobject1 ?xc1 ?yc1)
      (parked ?robot1)
      (surface ?xc1 ?yc1)
    )
    :effect (and
      (gripper-empty ?robot1)
      (gripper-obstacle ?xc1 ?yc1)
      (not(holding ?robot1 ?tobject1))
      (object-pos ?tobject1 ?xc1 ?yc1)
    )
  )

  (:action gripper-right
    :parameters (?robot1 - robot ?xc1 - xc ?xc2 - xc ?xrel1 - xrel ?xrel2 - xrel ?yc1 - yc ?yrel1 - yrel)
    :precondition (and
      (gripper-rel ?robot1 ?xrel2 ?yrel1)
      (leftof-rel ?xrel2 ?xrel1)
      (not-pushing ?robot1)
      (parked ?robot1)
    )
    :effect (and
      (gripper-obstacle ?xc2 ?yc1)
      (gripper-rel ?robot1 ?xrel1 ?yrel1)
      (not(gripper-obstacle ?xc1 ?yc1))
      (not(gripper-rel ?robot1 ?xrel2 ?yrel1))
    )
  )

  (:action base-down
    :parameters (?robot1 - robot ?xc1 - xc ?yc1 - yc ?yc2 - yc)
    :precondition (and
      (above ?yc2 ?yc1)
      (base-obstacle ?xc1 ?yc2)
      (base-pos ?robot1 ?xc1 ?yc2)
      (not-pushing ?robot1)
    )
    :effect (and
      (base-obstacle ?xc1 ?yc1)
      (base-pos ?robot1 ?xc1 ?yc1)
      (not(base-obstacle ?xc1 ?yc2))
      (not(base-pos ?robot1 ?xc1 ?yc2))
    )
  )

  (:action base-left
    :parameters (?robot1 - robot ?xc1 - xc ?xc2 - xc ?yc1 - yc)
    :precondition (and
      (base-obstacle ?xc2 ?yc1)
      (base-pos ?robot1 ?xc2 ?yc1)
      (leftof ?xc1 ?xc2)
      (not-pushing ?robot1)
    )
    :effect (and
      (base-obstacle ?xc1 ?yc1)
      (base-pos ?robot1 ?xc1 ?yc1)
      (not(base-obstacle ?xc2 ?yc1))
      (not(base-pos ?robot1 ?xc2 ?yc1))
    )
  )

  (:action get-down
    :parameters (?robot1 - robot ?tobject1 - tobject ?xc1 - xc ?yc1 - yc)
    :precondition (and
      (gripper-empty ?robot1)
      (gripper-obstacle ?xc1 ?yc1)
      (not-pushing ?robot1)
      (object-pos ?tobject1 ?xc1 ?yc1)
      (parked ?robot1)
      (surface ?xc1 ?yc1)
    )
    :effect (and
      (holding ?robot1 ?tobject1)
      (not(gripper-empty ?robot1))
      (not(gripper-obstacle ?xc1 ?yc1))
      (not(object-pos ?tobject1 ?xc1 ?yc1))
    )
  )

  (:action base-cart-right
    :parameters (?cart1 - cart ?robot1 - robot ?xc1 - xc ?xc2 - xc ?yc1 - yc ?yc2 - yc)
    :precondition (and
      (above ?yc1 ?yc2)
      (base-obstacle ?xc2 ?yc1)
      (base-obstacle ?xc2 ?yc2)
      (base-pos ?robot1 ?xc2 ?yc1)
      (cart-pos ?cart1 ?xc2 ?yc2)
      (gripper-empty ?robot1)
      (leftof ?xc2 ?xc1)
      (pushing ?robot1 ?cart1)
    )
    :effect (and
      (base-obstacle ?xc1 ?yc1)
      (base-obstacle ?xc1 ?yc2)
      (base-pos ?robot1 ?xc1 ?yc1)
      (cart-pos ?cart1 ?xc1 ?yc2)
      (not(base-obstacle ?xc2 ?yc1))
      (not(base-obstacle ?xc2 ?yc2))
      (not(base-pos ?robot1 ?xc2 ?yc1))
      (not(cart-pos ?cart1 ?xc2 ?yc2))
    )
  )

  (:action park
    :parameters (?robot1 - robot)
    :precondition (and
      (not-pushing ?robot1)
    )
    :effect (and
      (parked ?robot1)
    )
  )

  (:action put-left
    :parameters (?robot1 - robot ?tobject1 - tobject ?xc1 - xc ?yc1 - yc)
    :precondition (and
      (holding ?robot1 ?tobject1)
      (not-pushing ?robot1)
      (object-goal ?tobject1 ?xc1 ?yc1)
      (parked ?robot1)
      (surface ?xc1 ?yc1)
    )
    :effect (and
      (gripper-empty ?robot1)
      (gripper-obstacle ?xc1 ?yc1)
      (not(holding ?robot1 ?tobject1))
      (object-pos ?tobject1 ?xc1 ?yc1)
    )
  )

  (:action get-right
    :parameters (?robot1 - robot ?tobject1 - tobject ?xc1 - xc ?yc1 - yc)
    :precondition (and
      (gripper-empty ?robot1)
      (gripper-obstacle ?xc1 ?yc1)
      (not-pushing ?robot1)
      (object-pos ?tobject1 ?xc1 ?yc1)
      (parked ?robot1)
      (surface ?xc1 ?yc1)
    )
    :effect (and
      (holding ?robot1 ?tobject1)
      (not(gripper-empty ?robot1))
      (not(gripper-obstacle ?xc1 ?yc1))
      (not(object-pos ?tobject1 ?xc1 ?yc1))
    )
  )

  (:action grasp-cart-below
    :parameters (?cart1 - cart ?robot1 - robot)
    :precondition (and
      (gripper-empty ?robot1)
      (not-pushed ?cart1)
      (not-pushing ?robot1)
    )
    :effect (and
      (not(not-pushed ?cart1))
      (not(not-pushing ?robot1))
      (pushing ?robot1 ?cart1)
    )
  )

  (:action ungrasp-cart
    :parameters (?cart1 - cart ?robot1 - robot)
    :precondition (and
      (gripper-empty ?robot1)
      (pushing ?robot1 ?cart1)
    )
    :effect (and
      (not(pushing ?robot1 ?cart1))
      (not-pushed ?cart1)
      (not-pushing ?robot1)
    )
  )

  (:action get-up
    :parameters (?robot1 - robot ?tobject1 - tobject ?xc1 - xc ?yc1 - yc)
    :precondition (and
      (base-obstacle ?xc1 ?yc1)
      (gripper-empty ?robot1)
      (gripper-obstacle ?xc1 ?yc1)
      (not-pushing ?robot1)
      (object-pos ?tobject1 ?xc1 ?yc1)
      (parked ?robot1)
      (surface ?xc1 ?yc1)
    )
    :effect (and
      (holding ?robot1 ?tobject1)
      (not(gripper-empty ?robot1))
      (not(gripper-obstacle ?xc1 ?yc1))
      (not(object-pos ?tobject1 ?xc1 ?yc1))
    )
  )

  (:action put-right
    :parameters (?robot1 - robot ?tobject1 - tobject ?xc1 - xc ?yc1 - yc)
    :precondition (and
      (base-obstacle ?xc1 ?yc1)
      (holding ?robot1 ?tobject1)
      (not-pushing ?robot1)
      (parked ?robot1)
      (surface ?xc1 ?yc1)
    )
    :effect (and
      (gripper-empty ?robot1)
      (gripper-obstacle ?xc1 ?yc1)
      (not(holding ?robot1 ?tobject1))
      (object-pos ?tobject1 ?xc1 ?yc1)
    )
  )

  (:action base-right
    :parameters (?robot1 - robot ?xc1 - xc ?xc2 - xc ?yc1 - yc)
    :precondition (and
      (base-obstacle ?xc2 ?yc1)
      (base-pos ?robot1 ?xc2 ?yc1)
      (leftof ?xc2 ?xc1)
      (not-pushing ?robot1)
    )
    :effect (and
      (base-obstacle ?xc1 ?yc1)
      (base-pos ?robot1 ?xc1 ?yc1)
      (not(base-obstacle ?xc2 ?yc1))
      (not(base-pos ?robot1 ?xc2 ?yc1))
    )
  )

  (:action unpark
    :parameters (?robot1 - robot)
    :precondition (and
      (not-pushing ?robot1)
      (parked ?robot1)
    )
    :effect (and
      (not(parked ?robot1))
    )
  )

)
