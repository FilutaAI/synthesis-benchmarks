(define (domain barman)
(:requirements :strips :typing :negative-preconditions :equality)
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
  (:action empty-shaker
    :parameters (?cocktail1 - cocktail ?level1 - level ?level2 - level ?shaker1 - shaker)
    :precondition (and
      (contains ?shaker1 ?cocktail1)
      (next ?level2 ?level1)
      (shaked ?shaker1)
      (shaker-empty-level ?shaker1 ?level2)
      (shaker-level ?shaker1 ?level1)
    )
    :effect (and
      (empty ?shaker1)
      (not(contains ?shaker1 ?cocktail1))
      (not(shaked ?shaker1))
      (not(shaker-level ?shaker1 ?level1))
      (shaker-level ?shaker1 ?level2)
    )
  )

  (:action shake
    :parameters (?cocktail1 - cocktail ?ingredient1 - ingredient ?ingredient2 - ingredient ?shaker1 - shaker)
    :precondition (and
      (contains ?shaker1 ?ingredient1)
      (contains ?shaker1 ?ingredient2)
      (unshaked ?shaker1)
    )
    :effect (and
      (contains ?shaker1 ?cocktail1)
      (not(contains ?shaker1 ?ingredient1))
      (not(contains ?shaker1 ?ingredient2))
      (not(unshaked ?shaker1))
      (shaked ?shaker1)
    )
  )

  (:action pour-shot-to-used-shaker
    :parameters (?ingredient1 - ingredient ?level1 - level ?level2 - level ?shaker1 - shaker ?shot1 - shot)
    :precondition (and
      (contains ?shot1 ?ingredient1)
      (next ?level2 ?level1)
      (shaker-level ?shaker1 ?level2)
      (unshaked ?shaker1)
      (used ?shot1 ?ingredient1)
    )
    :effect (and
      (contains ?shaker1 ?ingredient1)
      (empty ?shot1)
      (not(contains ?shot1 ?ingredient1))
      (not(shaker-level ?shaker1 ?level2))
      (shaker-level ?shaker1 ?level1)
    )
  )

  (:action pour-shaker-to-shot
    :parameters (?cocktail1 - cocktail ?level1 - level ?level2 - level ?shaker1 - shaker ?shot1 - shot)
    :precondition (and
      (clean ?shot1)
      (contains ?shaker1 ?cocktail1)
      (empty ?shot1)
      (next ?level1 ?level2)
      (ontable ?shot1)
      (shaked ?shaker1)
      (shaker-level ?shaker1 ?level2)
    )
    :effect (and
      (contains ?shot1 ?cocktail1)
      (not(clean ?shot1))
      (not(empty ?shot1))
      (not(shaker-level ?shaker1 ?level2))
      (shaker-level ?shaker1 ?level1)
    )
  )

  (:action clean-shaker
    :parameters (?shaker1 - shaker)
    :precondition (and
      (empty ?shaker1)
    )
    :effect (and
      (clean ?shaker1)
    )
  )

  (:action pour-shot-to-clean-shaker
    :parameters (?ingredient1 - ingredient ?level1 - level ?level2 - level ?shaker1 - shaker ?shot1 - shot)
    :precondition (and
      (clean ?shaker1)
      (contains ?shot1 ?ingredient1)
      (empty ?shaker1)
      (next ?level2 ?level1)
      (ontable ?shaker1)
      (shaker-empty-level ?shaker1 ?level2)
      (shaker-level ?shaker1 ?level2)
      (used ?shot1 ?ingredient1)
    )
    :effect (and
      (contains ?shaker1 ?ingredient1)
      (empty ?shot1)
      (not(clean ?shaker1))
      (not(contains ?shot1 ?ingredient1))
      (not(empty ?shaker1))
      (not(shaker-level ?shaker1 ?level2))
      (shaker-level ?shaker1 ?level1)
      (unshaked ?shaker1)
    )
  )

  (:action grasp
    :parameters (?container1 - container ?hand1 - hand)
    :precondition (and
      (handempty ?hand1)
      (ontable ?container1)
    )
    :effect (and
      (holding ?hand1 ?container1)
      (not(handempty ?hand1))
      (not(ontable ?container1))
    )
  )

  (:action clean-shot
    :parameters (?ingredient1 - ingredient ?shot1 - shot)
    :precondition (and
      (empty ?shot1)
      (used ?shot1 ?ingredient1)
    )
    :effect (and
      (clean ?shot1)
      (not(used ?shot1 ?ingredient1))
    )
  )

  (:action fill-shot
    :parameters (?ingredient1 - ingredient ?shot1 - shot)
    :precondition (and
      (clean ?shot1)
      (empty ?shot1)
    )
    :effect (and
      (contains ?shot1 ?ingredient1)
      (not(clean ?shot1))
      (not(empty ?shot1))
      (used ?shot1 ?ingredient1)
    )
  )

  (:action leave
    :parameters (?container1 - container ?hand1 - hand)
    :precondition (and
      (holding ?hand1 ?container1)
    )
    :effect (and
      (handempty ?hand1)
      (not(holding ?hand1 ?container1))
      (ontable ?container1)
    )
  )

)
