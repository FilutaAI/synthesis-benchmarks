(define (domain elevators-sequencedstrips)
(:requirements :strips :typing :negative-preconditions)
  (:types
    elevator - object
    slow-elevator - elevator
    fast-elevator - elevator
    passenger - object
    count - object
  )

  (:predicates
    (above ?floor1 - count ?floor2 - count)
    (boarded ?person - passenger ?lift - elevator)
    (can-hold ?lift - elevator ?n - count)
    (lift-at ?lift - elevator ?floor - count)
    (next ?n1 - count ?n2 - count)
    (passenger-at ?person - passenger ?floor - count)
    (passengers ?lift - elevator ?n - count)
    (reachable-floor ?lift - elevator ?floor - count)
  )
  (:action move-up-slow
    :parameters (?lift - slow-elevator ?f1 - count ?f2 - count)
    :precondition (
    )
    :effect (
    )
  )

  (:action board
    :parameters (?p - passenger ?lift - elevator ?f - count ?n1 - count ?n2 - count)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-down-slow
    :parameters (?lift - slow-elevator ?f1 - count ?f2 - count)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-down-fast
    :parameters (?lift - fast-elevator ?f1 - count ?f2 - count)
    :precondition (
    )
    :effect (
    )
  )

  (:action move-up-fast
    :parameters (?lift - fast-elevator ?f1 - count ?f2 - count)
    :precondition (
    )
    :effect (
    )
  )

  (:action leave
    :parameters (?p - passenger ?lift - elevator ?f - count ?n1 - count ?n2 - count)
    :precondition (
    )
    :effect (
    )
  )

)

