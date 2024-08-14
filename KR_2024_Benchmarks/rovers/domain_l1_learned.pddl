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
  (:action calibrate
    :parameters (?camera1 - camera ?objective1 - objective ?rover1 - rover ?waypoint1 - waypoint)
    :precondition (and
      (at ?rover1 ?waypoint1)
      (at_rock_sample ?waypoint1)
      (available ?rover1)
      (calibration_target ?camera1 ?objective1)
      (equipped_for_imaging ?rover1)
      (equipped_for_rock_analysis ?rover1)
      (equipped_for_soil_analysis ?rover1)
      (not(calibrated ?camera1 ?rover1))
      (on_board ?camera1 ?rover1)
      (visible_from ?objective1 ?waypoint1)
    )
    :effect (and
      (calibrated ?camera1 ?rover1)
    )
  )

  (:action take_image
    :parameters (?camera1 - camera ?mode1 - mode ?objective1 - objective ?rover1 - rover ?waypoint1 - waypoint)
    :precondition (and
      (at ?rover1 ?waypoint1)
      (at_rock_sample ?waypoint1)
      (available ?rover1)
      (calibrated ?camera1 ?rover1)
      (equipped_for_imaging ?rover1)
      (equipped_for_rock_analysis ?rover1)
      (equipped_for_soil_analysis ?rover1)
      (not(have_image ?rover1 ?objective1 ?mode1))
      (on_board ?camera1 ?rover1)
      (supports ?camera1 ?mode1)
      (visible_from ?objective1 ?waypoint1)
    )
    :effect (and
      (have_image ?rover1 ?objective1 ?mode1)
      (not(calibrated ?camera1 ?rover1))
    )
  )

  (:action communicate_image_data
    :parameters (?lander1 - lander ?mode1 - mode ?objective1 - objective ?rover1 - rover ?waypoint1 - waypoint ?waypoint2 - waypoint)
    :precondition (and
      (at ?rover1 ?waypoint2)
      (at_lander ?lander1 ?waypoint1)
      (at_rock_sample ?waypoint2)
      (at_soil_sample ?waypoint2)
      (available ?rover1)
      (channel_free ?lander1)
      (equipped_for_imaging ?rover1)
      (equipped_for_rock_analysis ?rover1)
      (equipped_for_soil_analysis ?rover1)
      (have_image ?rover1 ?objective1 ?mode1)
      (not(communicated_image_data ?objective1 ?mode1))
      (visible ?waypoint1 ?waypoint2)
      (visible ?waypoint2 ?waypoint1)
      (visible_from ?objective1 ?waypoint1)
    )
    :effect (and
      (communicated_image_data ?objective1 ?mode1)
    )
  )

  (:action sample_rock
    :parameters (?rover1 - rover ?store1 - store ?waypoint1 - waypoint)
    :precondition (and
      (at ?rover1 ?waypoint1)
      (at_rock_sample ?waypoint1)
      (available ?rover1)
      (empty ?store1)
      (equipped_for_imaging ?rover1)
      (equipped_for_rock_analysis ?rover1)
      (equipped_for_soil_analysis ?rover1)
      (not(full ?store1))
      (not(have_rock_analysis ?rover1 ?waypoint1))
      (store_of ?store1 ?rover1)
    )
    :effect (and
      (full ?store1)
      (have_rock_analysis ?rover1 ?waypoint1)
      (not(at_rock_sample ?waypoint1))
      (not(empty ?store1))
    )
  )

  (:action navigate
    :parameters (?rover1 - rover ?waypoint1 - waypoint ?waypoint2 - waypoint)
    :precondition (and
      (at ?rover1 ?waypoint2)
      (available ?rover1)
      (can_traverse ?rover1 ?waypoint1 ?waypoint2)
      (can_traverse ?rover1 ?waypoint2 ?waypoint1)
      (equipped_for_imaging ?rover1)
      (equipped_for_rock_analysis ?rover1)
      (equipped_for_soil_analysis ?rover1)
      (not(at ?rover1 ?waypoint1))
      (visible ?waypoint1 ?waypoint2)
      (visible ?waypoint2 ?waypoint1)
    )
    :effect (and
      (at ?rover1 ?waypoint1)
      (not(at ?rover1 ?waypoint2))
    )
  )

  (:action communicate_rock_data
    :parameters (?lander1 - lander ?rover1 - rover ?waypoint1 - waypoint ?waypoint2 - waypoint ?waypoint3 - waypoint)
    :precondition (and
      (at ?rover1 ?waypoint2)
      (at_lander ?lander1 ?waypoint3)
      (available ?rover1)
      (channel_free ?lander1)
      (equipped_for_imaging ?rover1)
      (equipped_for_rock_analysis ?rover1)
      (equipped_for_soil_analysis ?rover1)
      (have_rock_analysis ?rover1 ?waypoint1)
      (not(communicated_rock_data ?waypoint1))
      (visible ?waypoint2 ?waypoint3)
      (visible ?waypoint3 ?waypoint2)
    )
    :effect (and
      (communicated_rock_data ?waypoint1)
    )
  )

  (:action drop
    :parameters (?rover1 - rover ?store1 - store)
    :precondition (and
      (available ?rover1)
      (equipped_for_imaging ?rover1)
      (equipped_for_rock_analysis ?rover1)
      (equipped_for_soil_analysis ?rover1)
      (full ?store1)
      (not(empty ?store1))
      (store_of ?store1 ?rover1)
    )
    :effect (and
      (empty ?store1)
      (not(full ?store1))
    )
  )

  (:action sample_soil
    :parameters (?rover1 - rover ?store1 - store ?waypoint1 - waypoint)
    :precondition (and
      (at ?rover1 ?waypoint1)
      (at_soil_sample ?waypoint1)
      (available ?rover1)
      (empty ?store1)
      (equipped_for_imaging ?rover1)
      (equipped_for_rock_analysis ?rover1)
      (equipped_for_soil_analysis ?rover1)
      (not(full ?store1))
      (not(have_soil_analysis ?rover1 ?waypoint1))
      (store_of ?store1 ?rover1)
    )
    :effect (and
      (full ?store1)
      (have_soil_analysis ?rover1 ?waypoint1)
      (not(at_soil_sample ?waypoint1))
      (not(empty ?store1))
    )
  )

  (:action communicate_soil_data
    :parameters (?lander1 - lander ?rover1 - rover ?waypoint1 - waypoint ?waypoint2 - waypoint)
    :precondition (and
      (at ?rover1 ?waypoint2)
      (at_lander ?lander1 ?waypoint1)
      (available ?rover1)
      (channel_free ?lander1)
      (equipped_for_imaging ?rover1)
      (equipped_for_rock_analysis ?rover1)
      (equipped_for_soil_analysis ?rover1)
      (have_soil_analysis ?rover1 ?waypoint2)
      (not(communicated_soil_data ?waypoint2))
      (visible ?waypoint1 ?waypoint2)
      (visible ?waypoint2 ?waypoint1)
    )
    :effect (and
      (communicated_soil_data ?waypoint2)
    )
  )

)
