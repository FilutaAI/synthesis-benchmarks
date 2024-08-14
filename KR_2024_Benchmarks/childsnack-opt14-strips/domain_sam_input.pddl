(define (domain child-snack)
(:requirements :strips :typing :negative-preconditions)
  (:types
    child - object
    bread-portion - object
    content-portion - object
    sandwich - object
    tray - object
    place - object
  )
  (:constants
    kitchen - place
  )

  (:predicates
    (allergic_gluten ?c - child)
    (at ?t - tray ?p - place)
    (at_kitchen_bread ?b - bread-portion)
    (at_kitchen_content ?c - content-portion)
    (at_kitchen_sandwich ?s - sandwich)
    (no_gluten_bread ?b - bread-portion)
    (no_gluten_content ?c - content-portion)
    (no_gluten_sandwich ?s - sandwich)
    (not_allergic_gluten ?c - child)
    (notexist ?s - sandwich)
    (ontray ?s - sandwich ?t - tray)
    (served ?c - child)
    (waiting ?c - child ?p - place)
  )
  (:action make_sandwich
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (
    )
    :effect (
    )
  )

  (:action serve_sandwich
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (
    )
    :effect (
    )
  )

  (:action move_tray
    :parameters (?t - tray ?p1 - place ?p2 - place)
    :precondition (
    )
    :effect (
    )
  )

  (:action put_on_tray
    :parameters (?s - sandwich ?t - tray)
    :precondition (
    )
    :effect (
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?s - sandwich ?c - child ?t - tray ?p - place)
    :precondition (
    )
    :effect (
    )
  )

  (:action make_sandwich_no_gluten
    :parameters (?s - sandwich ?b - bread-portion ?c - content-portion)
    :precondition (
    )
    :effect (
    )
  )

)

