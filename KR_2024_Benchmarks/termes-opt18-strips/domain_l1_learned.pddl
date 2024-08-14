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
  (:action create-block
    :parameters (?position1 - position)
    :precondition (and
      (at ?position1)
      (is-depot ?position1)
      (not(has-block))
    )
    :effect (and
      (has-block)
    )
  )

  (:action move
    :parameters (?numb1 - numb ?position1 - position ?position2 - position)
    :precondition (and
      (at ?position2)
      (height ?position1 ?numb1)
      (height ?position2 ?numb1)
      (neighbor ?position1 ?position2)
      (neighbor ?position2 ?position1)
      (not(at ?position1))
    )
    :effect (and
      (at ?position1)
      (not(at ?position2))
    )
  )

  (:action place-block
    :parameters (?numb1 - numb ?numb2 - numb ?position1 - position ?position2 - position)
    :precondition (and
      (at ?position1)
      (has-block)
      (height ?position1 ?numb2)
      (height ?position2 ?numb2)
      (neighbor ?position1 ?position2)
      (neighbor ?position2 ?position1)
      (not(height ?position2 ?numb1))
      (not(is-depot ?position2))
      (succ ?numb1 ?numb2)
    )
    :effect (and
      (height ?position2 ?numb1)
      (not(has-block))
      (not(height ?position2 ?numb2))
    )
  )

  (:action remove-block
    :parameters (?numb1 - numb ?numb2 - numb ?position1 - position ?position2 - position)
    :precondition (and
      (at ?position1)
      (height ?position1 ?numb2)
      (height ?position2 ?numb1)
      (neighbor ?position1 ?position2)
      (neighbor ?position2 ?position1)
      (not(has-block))
      (not(height ?position2 ?numb2))
      (succ ?numb1 ?numb2)
    )
    :effect (and
      (has-block)
      (height ?position2 ?numb2)
      (not(height ?position2 ?numb1))
    )
  )

  (:action move-up
    :parameters (?numb1 - numb ?numb2 - numb ?position1 - position ?position2 - position)
    :precondition (and
      (at ?position2)
      (height ?position1 ?numb2)
      (height ?position2 ?numb1)
      (neighbor ?position1 ?position2)
      (neighbor ?position2 ?position1)
      (not(at ?position1))
      (succ ?numb2 ?numb1)
    )
    :effect (and
      (at ?position1)
      (not(at ?position2))
    )
  )

  (:action move-down
    :parameters (?numb1 - numb ?numb2 - numb ?position1 - position ?position2 - position)
    :precondition (and
      (at ?position2)
      (height ?position1 ?numb1)
      (height ?position2 ?numb2)
      (neighbor ?position1 ?position2)
      (neighbor ?position2 ?position1)
      (not(at ?position1))
      (succ ?numb2 ?numb1)
    )
    :effect (and
      (at ?position1)
      (not(at ?position2))
    )
  )

  (:action destroy-block
    :parameters (?position1 - position)
    :precondition (and
      (at ?position1)
      (has-block)
      (is-depot ?position1)
    )
    :effect (and
      (not(has-block))
    )
  )

)
