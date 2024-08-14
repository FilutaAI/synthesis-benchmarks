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
  (:action make_sandwich_no_gluten
    :parameters (?bread-portion1 - bread-portion ?content-portion1 - content-portion ?sandwich1 - sandwich)
    :precondition (and
      (at_kitchen_bread ?bread-portion1)
      (at_kitchen_content ?content-portion1)
      (no_gluten_bread ?bread-portion1)
      (no_gluten_content ?content-portion1)
      (not(at_kitchen_sandwich ?sandwich1))
      (not(no_gluten_sandwich ?sandwich1))
      (notexist ?sandwich1)
    )
    :effect (and
      (at_kitchen_sandwich ?sandwich1)
      (no_gluten_sandwich ?sandwich1)
      (not(at_kitchen_bread ?bread-portion1))
      (not(at_kitchen_content ?content-portion1))
      (not(notexist ?sandwich1))
    )
  )

  (:action put_on_tray
    :parameters (?sandwich1 - sandwich ?tray1 - tray)
    :precondition (and
      (at ?tray1 kitchen)
      (at_kitchen_sandwich ?sandwich1)
      (not(ontray ?sandwich1 ?tray1))
    )
    :effect (and
      (not(at_kitchen_sandwich ?sandwich1))
      (ontray ?sandwich1 ?tray1)
    )
  )

  (:action move_tray
    :parameters (?place1 - place ?place2 - place ?tray1 - tray)
    :precondition (and
      (at ?tray1 ?place2)
      (not(at ?tray1 ?place1))
    )
    :effect (and
      (at ?tray1 ?place1)
      (not(at ?tray1 ?place2))
    )
  )

  (:action serve_sandwich_no_gluten
    :parameters (?child1 - child ?place1 - place ?sandwich1 - sandwich ?tray1 - tray)
    :precondition (and
      (allergic_gluten ?child1)
      (at ?tray1 ?place1)
      (no_gluten_sandwich ?sandwich1)
      (not(served ?child1))
      (ontray ?sandwich1 ?tray1)
      (waiting ?child1 ?place1)
    )
    :effect (and
      (not(ontray ?sandwich1 ?tray1))
      (served ?child1)
    )
  )

  (:action make_sandwich
    :parameters (?bread-portion1 - bread-portion ?content-portion1 - content-portion ?sandwich1 - sandwich)
    :precondition (and
      (at_kitchen_bread ?bread-portion1)
      (at_kitchen_content ?content-portion1)
      (not(at_kitchen_sandwich ?sandwich1))
      (notexist ?sandwich1)
    )
    :effect (and
      (at_kitchen_sandwich ?sandwich1)
      (not(at_kitchen_bread ?bread-portion1))
      (not(at_kitchen_content ?content-portion1))
      (not(notexist ?sandwich1))
    )
  )

  (:action serve_sandwich
    :parameters (?child1 - child ?place1 - place ?sandwich1 - sandwich ?tray1 - tray)
    :precondition (and
      (at ?tray1 ?place1)
      (not(served ?child1))
      (not_allergic_gluten ?child1)
      (ontray ?sandwich1 ?tray1)
      (waiting ?child1 ?place1)
    )
    :effect (and
      (not(ontray ?sandwich1 ?tray1))
      (served ?child1)
    )
  )

)
