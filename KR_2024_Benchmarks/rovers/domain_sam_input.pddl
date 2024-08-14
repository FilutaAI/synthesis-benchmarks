(define (domain Rover)
(:requirements :strips :typing :negative-preconditions)
  (:types
    rover - object
    waypoint - object
    store - object
    camera - object
    mode - object
    lander - object
    objective - object
  )

  (:predicates
    (at ?x - rover ?y - waypoint)
    (at_lander ?x - lander ?y - waypoint)
    (at_rock_sample ?w - waypoint)
    (at_soil_sample ?w - waypoint)
    (available ?r - rover)
    (calibrated ?c - camera ?r - rover)
    (calibration_target ?i - camera ?o - objective)
    (can_traverse ?r - rover ?x - waypoint ?y - waypoint)
    (channel_free ?l - lander)
    (communicated_image_data ?o - objective ?m - mode)
    (communicated_rock_data ?w - waypoint)
    (communicated_soil_data ?w - waypoint)
    (empty ?s - store)
    (equipped_for_imaging ?r - rover)
    (equipped_for_rock_analysis ?r - rover)
    (equipped_for_soil_analysis ?r - rover)
    (full ?s - store)
    (have_image ?r - rover ?o - objective ?m - mode)
    (have_rock_analysis ?r - rover ?w - waypoint)
    (have_soil_analysis ?r - rover ?w - waypoint)
    (on_board ?i - camera ?r - rover)
    (store_of ?s - store ?r - rover)
    (supports ?c - camera ?m - mode)
    (visible ?w - waypoint ?p - waypoint)
    (visible_from ?o - objective ?w - waypoint)
  )
  (:action sample_rock
    :parameters (?x - rover ?s - store ?p - waypoint)
    :precondition (
    )
    :effect (
    )
  )

  (:action communicate_image_data
    :parameters (?r - rover ?l - lander ?o - objective ?m - mode ?x - waypoint ?y - waypoint)
    :precondition (
    )
    :effect (
    )
  )

  (:action take_image
    :parameters (?r - rover ?p - waypoint ?o - objective ?i - camera ?m - mode)
    :precondition (
    )
    :effect (
    )
  )

  (:action navigate
    :parameters (?x - rover ?y - waypoint ?z - waypoint)
    :precondition (
    )
    :effect (
    )
  )

  (:action drop
    :parameters (?x - rover ?y - store)
    :precondition (
    )
    :effect (
    )
  )

  (:action communicate_rock_data
    :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
    :precondition (
    )
    :effect (
    )
  )

  (:action communicate_soil_data
    :parameters (?r - rover ?l - lander ?p - waypoint ?x - waypoint ?y - waypoint)
    :precondition (
    )
    :effect (
    )
  )

  (:action sample_soil
    :parameters (?x - rover ?s - store ?p - waypoint)
    :precondition (
    )
    :effect (
    )
  )

  (:action calibrate
    :parameters (?r - rover ?i - camera ?t - objective ?w - waypoint)
    :precondition (
    )
    :effect (
    )
  )

)

