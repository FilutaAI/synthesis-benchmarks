(define (domain barman)
(:requirements :strips :typing :negative-preconditions)
  (:types
    hand - object
    level - object
    beverage - object
    dispenser - object
    container - object
    ingredient - beverage
    cocktail - beverage
    shot - container
    shaker - container
  )

  (:predicates
    (clean ?c - container)
    (cocktail-part1 ?c - cocktail ?i - ingredient)
    (cocktail-part2 ?c - cocktail ?i - ingredient)
    (contains ?c - container ?b - beverage)
    (dispenses ?d - dispenser ?i - ingredient)
    (empty ?c - container)
    (handempty ?h - hand)
    (holding ?h - hand ?c - container)
    (next ?l1 - level ?l2 - level)
    (ontable ?c - container)
    (shaked ?s - shaker)
    (shaker-empty-level ?s - shaker ?l - level)
    (shaker-level ?s - shaker ?l - level)
    (unshaked ?s - shaker)
    (used ?c - container ?b - beverage)
  )
  (:action leave
    :parameters (?h - hand ?c - container)
    :precondition (
    )
    :effect (
    )
  )

  (:action clean-shot
    :parameters (?s - shot ?b - beverage ?h1 - hand ?h2 - hand)
    :precondition (
    )
    :effect (
    )
  )

  (:action fill-shot
    :parameters (?s - shot ?i - ingredient ?h1 - hand ?h2 - hand ?d - dispenser)
    :precondition (
    )
    :effect (
    )
  )

  (:action pour-shot-to-clean-shaker
    :parameters (?s - shot ?i - ingredient ?d - shaker ?h1 - hand ?l - level ?l1 - level)
    :precondition (
    )
    :effect (
    )
  )

  (:action pour-shot-to-used-shaker
    :parameters (?s - shot ?i - ingredient ?d - shaker ?h1 - hand ?l - level ?l1 - level)
    :precondition (
    )
    :effect (
    )
  )

  (:action clean-shaker
    :parameters (?h1 - hand ?h2 - hand ?s - shaker)
    :precondition (
    )
    :effect (
    )
  )

  (:action grasp
    :parameters (?h - hand ?c - container)
    :precondition (
    )
    :effect (
    )
  )

  (:action shake
    :parameters (?b - cocktail ?d1 - ingredient ?d2 - ingredient ?s - shaker ?h1 - hand ?h2 - hand)
    :precondition (
    )
    :effect (
    )
  )

  (:action refill-shot
    :parameters (?s - shot ?i - ingredient ?h1 - hand ?h2 - hand ?d - dispenser)
    :precondition (
    )
    :effect (
    )
  )

  (:action pour-shaker-to-shot
    :parameters (?b - beverage ?d - shot ?h - hand ?s - shaker ?l - level ?l1 - level)
    :precondition (
    )
    :effect (
    )
  )

  (:action empty-shaker
    :parameters (?h - hand ?s - shaker ?b - cocktail ?l - level ?l1 - level)
    :precondition (
    )
    :effect (
    )
  )

  (:action empty-shot
    :parameters (?h - hand ?p - shot ?b - beverage)
    :precondition (
    )
    :effect (
    )
  )

)

