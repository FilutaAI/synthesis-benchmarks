(define (domain termes)
(:requirements :strips :typing :negative-preconditions)
  (:types
    numb - object
    position - object
  )

  (:predicates
    (is-depot ?p - position)
    (neighbor ?p1 - position ?p2 - position)
    (succ ?n1 - numb ?n2 - numb)
    (at ?p - position)
    (has-block )
    (height ?p - position ?h - numb)
  )
  (:action move
    :parameters (?from - position ?to - position ?h - numb)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-up
    :parameters (?from - position ?hfrom - numb ?to - position ?hto - numb)
    :precondition (
    )
    :effect (
    )
  )

  (:action destroy-block
    :parameters (?p - position)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-down
    :parameters (?from - position ?hfrom - numb ?to - position ?hto - numb)
    :precondition (
    )
    :effect (
    )
  )

  (:action create-block
    :parameters (?p - position)
    :precondition (
    )
    :effect (
    )
  )

  (:action remove-block
    :parameters (?rpos - position ?bpos - position ?hbefore - numb ?hafter - numb)
    :precondition (
    )
    :effect (
    )
  )

  (:action place-block
    :parameters (?rpos - position ?bpos - position ?hbefore - numb ?hafter - numb)
    :precondition (
    )
    :effect (
    )
  )

)

