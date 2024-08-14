(define (domain hanoi-domain)
    (:requirements :strips :typing)
    (:types
        disc - object
    )
    (:predicates
        (clear ?x - disc)
        (on ?x - disc ?y - disc)
        (smaller ?x - disc ?y - disc)
    )

    (:action move
        :parameters ( ?to ?disc ?from - disc)
        :precondition (and
            (smaller ?disc ?to)
            (on ?disc ?from)
            (clear ?disc)
            (clear ?to)
        )
        :effect (and
            (clear ?from)
            (on ?disc ?to)
            (not (on ?disc ?from))
            (not (clear ?to))
        )
    )
)
