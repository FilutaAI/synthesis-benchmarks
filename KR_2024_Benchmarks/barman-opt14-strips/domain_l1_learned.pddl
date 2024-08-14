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
  (:action grasp
    :parameters (?container1 - container ?hand1 - hand)
    :precondition (and
      (handempty ?hand1)
      (not(holding ?hand1 ?container1))
      (ontable ?container1)
    )
    :effect (and
      (holding ?hand1 ?container1)
      (not(handempty ?hand1))
      (not(ontable ?container1))
    )
  )

  (:action fill-shot
    :parameters (?dispenser1 - dispenser ?hand1 - hand ?hand2 - hand ?ingredient1 - ingredient ?shot1 - shot)
    :precondition (and
      (clean ?shot1)
      (dispenses ?dispenser1 ?ingredient1)
      (empty ?shot1)
      (handempty ?hand2)
      (holding ?hand1 ?shot1)
      (not(contains ?shot1 ?ingredient1))
      (not(used ?shot1 ?ingredient1))
    )
    :effect (and
      (contains ?shot1 ?ingredient1)
      (not(clean ?shot1))
      (not(empty ?shot1))
      (used ?shot1 ?ingredient1)
    )
  )

  (:action pour-shot-to-clean-shaker
    :parameters (?hand1 - hand ?ingredient1 - ingredient ?level1 - level ?level2 - level ?shaker1 - shaker ?shot1 - shot)
    :precondition (and
      (clean ?shaker1)
      (contains ?shot1 ?ingredient1)
      (empty ?shaker1)
      (holding ?hand1 ?shot1)
      (next ?level2 ?level1)
      (not(contains ?shaker1 ?ingredient1))
      (not(empty ?shot1))
      (not(shaker-level ?shaker1 ?level1))
      (not(unshaked ?shaker1))
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

  (:action clean-shot
    :parameters (?hand1 - hand ?hand2 - hand ?ingredient1 - ingredient ?shot1 - shot)
    :precondition (and
      (empty ?shot1)
      (handempty ?hand2)
      (holding ?hand1 ?shot1)
      (not(clean ?shot1))
      (used ?shot1 ?ingredient1)
    )
    :effect (and
      (clean ?shot1)
      (not(used ?shot1 ?ingredient1))
    )
  )

  (:action pour-shot-to-used-shaker
    :parameters (?hand1 - hand ?ingredient1 - ingredient ?level1 - level ?level2 - level ?shaker1 - shaker ?shot1 - shot)
    :precondition (and
      (contains ?shot1 ?ingredient1)
      (holding ?hand1 ?shot1)
      (next ?level2 ?level1)
      (not(contains ?shaker1 ?ingredient1))
      (not(empty ?shot1))
      (not(shaker-level ?shaker1 ?level1))
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

  (:action leave
    :parameters (?container1 - container ?hand1 - hand)
    :precondition (and
      (holding ?hand1 ?container1)
      (not(handempty ?hand1))
      (not(ontable ?container1))
    )
    :effect (and
      (handempty ?hand1)
      (not(holding ?hand1 ?container1))
      (ontable ?container1)
    )
  )

  (:action shake
    :parameters (?cocktail1 - cocktail ?hand1 - hand ?hand2 - hand ?ingredient1 - ingredient ?ingredient2 - ingredient ?ingredient3 - ingredient ?ingredient4 - ingredient ?shaker1 - shaker)
    :precondition (and
      (cocktail-part1 ?cocktail1 ?ingredient3)
      (cocktail-part2 ?cocktail1 ?ingredient4)
      (contains ?shaker1 ?ingredient1)
      (contains ?shaker1 ?ingredient2)
      (contains ?shaker1 ?ingredient3)
      (contains ?shaker1 ?ingredient4)
      (handempty ?hand2)
      (holding ?hand1 ?shaker1)
      (not(contains ?shaker1 ?cocktail1))
      (not(shaked ?shaker1))
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

  (:action pour-shaker-to-shot
    :parameters (?cocktail1 - cocktail ?hand1 - hand ?level1 - level ?level2 - level ?shaker1 - shaker ?shot1 - shot)
    :precondition (and
      (clean ?shot1)
      (contains ?shaker1 ?cocktail1)
      (empty ?shot1)
      (holding ?hand1 ?shaker1)
      (next ?level1 ?level2)
      (not(contains ?shot1 ?cocktail1))
      (not(shaker-level ?shaker1 ?level1))
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

  (:action empty-shaker
    :parameters (?cocktail1 - cocktail ?hand1 - hand ?level1 - level ?level2 - level ?shaker1 - shaker)
    :precondition (and
      (contains ?shaker1 ?cocktail1)
      (holding ?hand1 ?shaker1)
      (next ?level2 ?level1)
      (not(empty ?shaker1))
      (not(shaker-level ?shaker1 ?level2))
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

  (:action clean-shaker
    :parameters (?hand1 - hand ?hand2 - hand ?shaker1 - shaker)
    :precondition (and
      (empty ?shaker1)
      (handempty ?hand2)
      (holding ?hand1 ?shaker1)
      (not(clean ?shaker1))
    )
    :effect (and
      (clean ?shaker1)
    )
  )

)
