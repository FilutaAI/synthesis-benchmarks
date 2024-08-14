(define (domain hanoi-domain)
(:requirements :strips :typing :negative-preconditions)
  (:types
    disc - object
  )

  (:predicates
    (clear ?x - disc)
    (on ?x - disc ?y - disc)
    (smaller ?x - disc ?y - disc)
  )
  (:action move
    :parameters (?disc1 - disc ?disc2 - disc ?disc3 - disc)
    :precondition (and
      (clear ?disc2)
      (clear ?disc3)
      (not(clear ?disc1))
      (not(on ?disc3 ?disc2))
      (on ?disc3 ?disc1)
      (smaller ?disc3 ?disc1)
      (smaller ?disc3 ?disc2)
    )
    :effect (and
      (clear ?disc1)
      (not(clear ?disc2))
      (not(on ?disc3 ?disc1))
      (on ?disc3 ?disc2)
    )
  )

)
