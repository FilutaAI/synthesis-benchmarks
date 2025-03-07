(define (domain termes)
(:requirements :strips :typing :negative-preconditions :equality)
  (:types
    numb - object
    position - object
  )

  (:predicates
    (at ?p - position)
    (has-block )
    (height ?p - position ?h - numb)
    (is-depot ?p - position)
    (neighbor ?p1 - position ?p2 - position)
    (succ ?n1 - numb ?n2 - numb)
  )
  (:action move
    :parameters (?position1 - position ?position2 - position)
    :precondition (and
      (at ?position2)
      (neighbor ?position1 ?position2)
      (neighbor ?position2 ?position1)
    )
    :effect (and
      (at ?position1)
      (not(at ?position2))
    )
  )

  (:action move-up
    :parameters (?position1 - position ?position2 - position)
    :precondition (and
      (at ?position2)
      (neighbor ?position1 ?position2)
      (neighbor ?position2 ?position1)
    )
    :effect (and
      (at ?position1)
      (not(at ?position2))
    )
  )

  (:action destroy-block
    :parameters ()
    :precondition (and
      (has-block)
    )
    :effect (and
      (not(has-block))
    )
  )

  (:action remove-block
    :parameters (?numb1 - numb ?numb2 - numb ?position1 - position)
    :precondition (and
      (height ?position1 ?numb2)
      (succ ?numb2 ?numb1)
    )
    :effect (and
      (has-block)
      (height ?position1 ?numb1)
      (not(height ?position1 ?numb2))
    )
  )

  (:action move-down
    :parameters (?position1 - position ?position2 - position)
    :precondition (and
      (at ?position2)
      (neighbor ?position1 ?position2)
      (neighbor ?position2 ?position1)
    )
    :effect (and
      (at ?position1)
      (not(at ?position2))
    )
  )

  (:action place-block
    :parameters (?numb1 - numb ?numb2 - numb ?position1 - position)
    :precondition (and
      (has-block)
      (height ?position1 ?numb2)
      (succ ?numb1 ?numb2)
    )
    :effect (and
      (height ?position1 ?numb1)
      (not(has-block))
      (not(height ?position1 ?numb2))
    )
  )

  (:action create-block
    :parameters ()
    :precondition (
    )
    :effect (and
      (has-block)
    )
  )

)
