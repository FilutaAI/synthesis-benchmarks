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
  (:action push-to-goal
    :parameters (?p - player ?s - stone ?ppos - location ?from - location ?to - location ?dir - direction)
    :precondition (
    )
    :effect (
    )
  )

  (:action push-to-nongoal
    :parameters (?p - player ?s - stone ?ppos - location ?from - location ?to - location ?dir - direction)
    :precondition (
    )
    :effect (
    )
  )

  (:action move
    :parameters (?p - player ?from - location ?to - location ?dir - direction)
    :precondition (
    )
    :effect (
    )
  )

)

