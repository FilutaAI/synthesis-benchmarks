(define (domain TIDYBOT)
(:requirements :strips :typing :negative-preconditions)
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
  (:action gripper-left
    :parameters (?r - robot ?basex - xc ?basey - yc ?cgxrel - xrel ?dgxrel - xrel ?cgxabs - xc ?dgxabs - xc ?gyrel - yrel ?gyabs - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action get-down
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - tobject ?oy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action get-left
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - tobject ?ox - xc)
    :precondition (
    )
    :effect (
    )
  )

  (:action get-from-cart
    :parameters (?r - robot ?x - xc ?y - yc ?gxrel - xrel ?gyrel - yrel ?o - tobject ?c - cart ?cx - xc ?cy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action get-up
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - tobject ?oy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action put-left
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - tobject ?ox - xc)
    :precondition (
    )
    :effect (
    )
  )

  (:action gripper-down
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?cgyrel - yrel ?dgyrel - yrel ?cgyabs - yc ?dgyabs - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action base-right
    :parameters (?r - robot ?cx - xc ?dx - xc ?y - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action base-cart-right
    :parameters (?r - robot ?c - cart ?x1 - xc ?x2 - xc ?y - yc ?cx1 - xc ?cx2 - xc ?cy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action put-on-cart
    :parameters (?r - robot ?x - xc ?y - yc ?gxrel - xrel ?gyrel - yrel ?o - tobject ?c - cart ?cx - xc ?cy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action put-right
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - tobject ?ox - xc)
    :precondition (
    )
    :effect (
    )
  )

  (:action put-down
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - tobject ?oy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action ungrasp-cart
    :parameters (?r - robot ?c - cart)
    :precondition (
    )
    :effect (
    )
  )

  (:action grasp-cart-right
    :parameters (?r - robot ?c - cart ?x - xc ?y - yc ?cx - xc)
    :precondition (
    )
    :effect (
    )
  )

  (:action gripper-up
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?cgyrel - yrel ?dgyrel - yrel ?cgyabs - yc ?dgyabs - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action base-up
    :parameters (?r - robot ?x - xc ?cy - yc ?dy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action park
    :parameters (?r - robot)
    :precondition (
    )
    :effect (
    )
  )

  (:action grasp-cart-above
    :parameters (?r - robot ?c - cart ?x - xc ?y - yc ?cy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action put-up
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - tobject ?oy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action base-cart-left
    :parameters (?r - robot ?c - cart ?x1 - xc ?x2 - xc ?y - yc ?cx1 - xc ?cx2 - xc ?cy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action base-down
    :parameters (?r - robot ?x - xc ?cy - yc ?dy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action grasp-cart-left
    :parameters (?r - robot ?c - cart ?x - xc ?y - yc ?cx - xc)
    :precondition (
    )
    :effect (
    )
  )

  (:action grasp-cart-below
    :parameters (?r - robot ?c - cart ?x - xc ?y - yc ?cy - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action base-left
    :parameters (?r - robot ?cx - xc ?dx - xc ?y - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action base-cart-down
    :parameters (?r - robot ?c - cart ?x - xc ?y1 - yc ?y2 - yc ?cx - xc ?cy1 - yc ?cy2 - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action gripper-right
    :parameters (?r - robot ?basex - xc ?basey - yc ?cgxrel - xrel ?dgxrel - xrel ?cgxabs - xc ?dgxabs - xc ?gyrel - yrel ?gyabs - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action get-right
    :parameters (?r - robot ?basex - xc ?basey - yc ?gxrel - xrel ?gxabs - xc ?gyrel - yrel ?gyabs - yc ?o - tobject ?ox - xc)
    :precondition (
    )
    :effect (
    )
  )

  (:action base-cart-up
    :parameters (?r - robot ?c - cart ?x - xc ?y1 - yc ?y2 - yc ?cx - xc ?cy1 - yc ?cy2 - yc)
    :precondition (
    )
    :effect (
    )
  )

  (:action unpark
    :parameters (?r - robot ?x - xrel ?y - yrel)
    :precondition (
    )
    :effect (
    )
  )

  (:action finish-object
    :parameters (?o - tobject ?x - xc ?y - yc)
    :precondition (
    )
    :effect (
    )
  )

)

