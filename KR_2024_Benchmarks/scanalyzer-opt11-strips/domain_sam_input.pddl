(define (domain scanalyzer3d)
(:requirements :strips :typing :negative-preconditions)
  (:types
    segment - object
    car - object
  )

  (:predicates
    (cycle-2 ?s1 - segment ?s2 - segment)
    (cycle-2-with-analysis ?s1 - segment ?s2 - segment)
    (cycle-4 ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment)
    (cycle-4-with-analysis ?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment)
    (analyzed ?c - car)
    (on ?c - car ?s - segment)
  )
  (:action rotate-4
    :parameters (?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment ?c1 - car ?c2 - car ?c3 - car ?c4 - car)
    :precondition (
    )
    :effect (
    )
  )

  (:action analyze-4
    :parameters (?s1 - segment ?s2 - segment ?s3 - segment ?s4 - segment ?c1 - car ?c2 - car ?c3 - car ?c4 - car)
    :precondition (
    )
    :effect (
    )
  )

  (:action analyze-2
    :parameters (?s1 - segment ?s2 - segment ?c1 - car ?c2 - car)
    :precondition (
    )
    :effect (
    )
  )

  (:action rotate-2
    :parameters (?s1 - segment ?s2 - segment ?c1 - car ?c2 - car)
    :precondition (
    )
    :effect (
    )
  )

)

