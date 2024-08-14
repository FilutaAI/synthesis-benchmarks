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
  (:action move-down-slow
    :parameters (?count1 - count ?count2 - count ?slow-elevator1 - slow-elevator)
    :precondition (and
      (above ?count1 ?count2)
      (lift-at ?slow-elevator1 ?count2)
      (not(lift-at ?slow-elevator1 ?count1))
      (reachable-floor ?slow-elevator1 ?count1)
      (reachable-floor ?slow-elevator1 ?count2)
    )
    :effect (and
      (lift-at ?slow-elevator1 ?count1)
      (not(lift-at ?slow-elevator1 ?count2))
    )
  )

  (:action move-up-slow
    :parameters (?count1 - count ?count2 - count ?slow-elevator1 - slow-elevator)
    :precondition (and
      (above ?count2 ?count1)
      (lift-at ?slow-elevator1 ?count2)
      (not(lift-at ?slow-elevator1 ?count1))
      (reachable-floor ?slow-elevator1 ?count1)
      (reachable-floor ?slow-elevator1 ?count2)
    )
    :effect (and
      (lift-at ?slow-elevator1 ?count1)
      (not(lift-at ?slow-elevator1 ?count2))
    )
  )

  (:action board
    :parameters (?count1 - count ?count2 - count ?count3 - count ?elevator1 - elevator ?passenger1 - passenger)
    :precondition (and
      (above ?count2 ?count3)
      (can-hold ?elevator1 ?count3)
      (lift-at ?elevator1 ?count1)
      (next ?count2 ?count3)
      (not(boarded ?passenger1 ?elevator1))
      (not(passengers ?elevator1 ?count3))
      (passenger-at ?passenger1 ?count1)
      (passengers ?elevator1 ?count2)
      (reachable-floor ?elevator1 ?count1)
    )
    :effect (and
      (boarded ?passenger1 ?elevator1)
      (not(passenger-at ?passenger1 ?count1))
      (not(passengers ?elevator1 ?count2))
      (passengers ?elevator1 ?count3)
    )
  )

  (:action leave
    :parameters (?count1 - count ?count2 - count ?count3 - count ?elevator1 - elevator ?passenger1 - passenger)
    :precondition (and
      (above ?count1 ?count3)
      (boarded ?passenger1 ?elevator1)
      (can-hold ?elevator1 ?count3)
      (lift-at ?elevator1 ?count2)
      (next ?count1 ?count3)
      (not(passenger-at ?passenger1 ?count2))
      (not(passengers ?elevator1 ?count1))
      (passengers ?elevator1 ?count3)
      (reachable-floor ?elevator1 ?count2)
    )
    :effect (and
      (not(boarded ?passenger1 ?elevator1))
      (not(passengers ?elevator1 ?count3))
      (passenger-at ?passenger1 ?count2)
      (passengers ?elevator1 ?count1)
    )
  )

  (:action move-down-fast
    :parameters (?count1 - count ?count2 - count ?fast-elevator1 - fast-elevator)
    :precondition (and
      (above ?count1 ?count2)
      (lift-at ?fast-elevator1 ?count2)
      (not(lift-at ?fast-elevator1 ?count1))
      (reachable-floor ?fast-elevator1 ?count1)
      (reachable-floor ?fast-elevator1 ?count2)
    )
    :effect (and
      (lift-at ?fast-elevator1 ?count1)
      (not(lift-at ?fast-elevator1 ?count2))
    )
  )

  (:action move-up-fast
    :parameters (?count1 - count ?count2 - count ?fast-elevator1 - fast-elevator)
    :precondition (and
      (above ?count1 ?count2)
      (can-hold ?fast-elevator1 ?count2)
      (lift-at ?fast-elevator1 ?count1)
      (not(lift-at ?fast-elevator1 ?count2))
      (reachable-floor ?fast-elevator1 ?count1)
      (reachable-floor ?fast-elevator1 ?count2)
    )
    :effect (and
      (lift-at ?fast-elevator1 ?count2)
      (not(lift-at ?fast-elevator1 ?count1))
    )
  )

)
