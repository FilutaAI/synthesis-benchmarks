(define (domain thoughtful-typed)
(:requirements :strips :typing :negative-preconditions)
  (:types
    card - object
    colnum - object
    num - object
    suittype - object
  )

  (:predicates
    (ace ?c - card)
    (bottomcol ?c - card)
    (bottomtalon ?c - card)
    (canstack ?c1 - card ?c2 - card)
    (clear ?c - card)
    (colspace ?n - colnum)
    (colsuccessor ?n1 - colnum ?n0 - colnum)
    (faceup ?c - card)
    (home ?c - card)
    (instack ?c - card)
    (king ?c - card)
    (on ?c1 - card ?c2 - card)
    (ontalon ?c1 - card ?c2 - card)
    (successor ?n1 - num ?n0 - num)
    (suit ?c - card ?s - suittype)
    (talonplayable ?c - card)
    (toptalon ?c - card)
    (value ?c - card ?v - num)
  )
  (:action turn-deck
    :parameters (?card1 - card ?card2 - card)
    :precondition (and
      (not(talonplayable ?card1))
      (ontalon ?card1 ?card2)
      (talonplayable ?card2)
    )
    :effect (and
      (not(talonplayable ?card2))
      (talonplayable ?card1)
    )
  )

  (:action move-col-to-col
    :parameters (?card1 - card ?card2 - card ?card3 - card)
    :precondition (and
      (canstack ?card2 ?card3)
      (clear ?card3)
      (faceup ?card2)
      (faceup ?card3)
      (not(clear ?card1))
      (not(on ?card2 ?card3))
      (on ?card2 ?card1)
    )
    :effect (and
      (clear ?card1)
      (faceup ?card1)
      (not(clear ?card3))
      (not(on ?card2 ?card1))
      (on ?card2 ?card3)
    )
  )

  (:action col-to-home
    :parameters (?card1 - card ?card2 - card ?card3 - card ?num1 - num ?num2 - num ?suittype1 - suittype)
    :precondition (and
      (clear ?card3)
      (faceup ?card3)
      (home ?card2)
      (not(clear ?card1))
      (not(home ?card3))
      (on ?card3 ?card1)
      (successor ?num2 ?num1)
      (suit ?card2 ?suittype1)
      (suit ?card3 ?suittype1)
      (value ?card2 ?num1)
      (value ?card3 ?num2)
    )
    :effect (and
      (clear ?card1)
      (faceup ?card1)
      (home ?card3)
      (not(clear ?card3))
      (not(faceup ?card3))
      (not(home ?card2))
      (not(on ?card3 ?card1))
      (on ?card3 ?card2)
    )
  )

  (:action tal-to-col
    :parameters (?card1 - card ?card2 - card ?card3 - card ?card4 - card)
    :precondition (and
      (canstack ?card4 ?card3)
      (clear ?card3)
      (faceup ?card3)
      (not(clear ?card4))
      (not(faceup ?card4))
      (not(on ?card4 ?card3))
      (not(ontalon ?card1 ?card2))
      (not(talonplayable ?card2))
      (ontalon ?card1 ?card4)
      (ontalon ?card4 ?card2)
      (talonplayable ?card4)
    )
    :effect (and
      (clear ?card4)
      (faceup ?card4)
      (not(clear ?card3))
      (not(ontalon ?card1 ?card4))
      (not(ontalon ?card4 ?card2))
      (not(talonplayable ?card4))
      (on ?card4 ?card3)
      (ontalon ?card1 ?card2)
      (talonplayable ?card2)
    )
  )

  (:action move-col-to-col-b
    :parameters (?card1 - card ?card2 - card ?colnum1 - colnum ?colnum2 - colnum)
    :precondition (and
      (bottomcol ?card1)
      (canstack ?card1 ?card2)
      (clear ?card2)
      (colspace ?colnum2)
      (colsuccessor ?colnum1 ?colnum2)
      (faceup ?card1)
      (faceup ?card2)
      (not(colspace ?colnum1))
      (not(on ?card1 ?card2))
    )
    :effect (and
      (colspace ?colnum1)
      (not(bottomcol ?card1))
      (not(clear ?card2))
      (not(colspace ?colnum2))
      (on ?card1 ?card2)
    )
  )

  (:action tal-to-home
    :parameters (?card1 - card ?card2 - card ?card3 - card ?card4 - card ?num1 - num ?num2 - num ?suittype1 - suittype)
    :precondition (and
      (home ?card2)
      (not(home ?card4))
      (not(ontalon ?card1 ?card3))
      (not(talonplayable ?card3))
      (ontalon ?card1 ?card4)
      (ontalon ?card4 ?card3)
      (successor ?num2 ?num1)
      (suit ?card2 ?suittype1)
      (suit ?card4 ?suittype1)
      (talonplayable ?card4)
      (value ?card2 ?num1)
      (value ?card4 ?num2)
    )
    :effect (and
      (home ?card4)
      (not(home ?card2))
      (not(ontalon ?card1 ?card4))
      (not(ontalon ?card4 ?card3))
      (not(talonplayable ?card4))
      (ontalon ?card1 ?card3)
      (talonplayable ?card3)
    )
  )

  (:action move-col-to-col-c
    :parameters (?card1 - card ?card2 - card ?colnum1 - colnum ?colnum2 - colnum)
    :precondition (and
      (colspace ?colnum2)
      (colsuccessor ?colnum2 ?colnum1)
      (faceup ?card1)
      (king ?card1)
      (not(bottomcol ?card1))
      (not(clear ?card2))
      (not(colspace ?colnum1))
      (not(faceup ?card2))
      (on ?card1 ?card2)
    )
    :effect (and
      (bottomcol ?card1)
      (clear ?card2)
      (colspace ?colnum1)
      (faceup ?card2)
      (not(colspace ?colnum2))
      (not(on ?card1 ?card2))
    )
  )

  (:action col-to-home-b
    :parameters (?card1 - card ?card2 - card ?colnum1 - colnum ?colnum2 - colnum ?num1 - num ?num2 - num ?suittype1 - suittype)
    :precondition (and
      (bottomcol ?card2)
      (clear ?card2)
      (colspace ?colnum2)
      (colsuccessor ?colnum1 ?colnum2)
      (faceup ?card2)
      (home ?card1)
      (not(colspace ?colnum1))
      (not(home ?card2))
      (successor ?num1 ?num2)
      (suit ?card1 ?suittype1)
      (suit ?card2 ?suittype1)
      (value ?card1 ?num2)
      (value ?card2 ?num1)
    )
    :effect (and
      (colspace ?colnum1)
      (home ?card2)
      (not(bottomcol ?card2))
      (not(clear ?card2))
      (not(colspace ?colnum2))
      (not(faceup ?card2))
      (not(home ?card1))
    )
  )

  (:action tal-to-home-c
    :parameters (?card1 - card ?card2 - card ?card3 - card ?num1 - num ?num2 - num ?suittype1 - suittype)
    :precondition (and
      (home ?card1)
      (not(home ?card3))
      (not(talonplayable ?card2))
      (not(toptalon ?card2))
      (ontalon ?card3 ?card2)
      (successor ?num1 ?num2)
      (suit ?card1 ?suittype1)
      (suit ?card3 ?suittype1)
      (talonplayable ?card3)
      (toptalon ?card3)
      (value ?card1 ?num2)
      (value ?card3 ?num1)
    )
    :effect (and
      (home ?card3)
      (not(home ?card1))
      (not(ontalon ?card3 ?card2))
      (not(talonplayable ?card3))
      (not(toptalon ?card3))
      (talonplayable ?card2)
      (toptalon ?card2)
    )
  )

  (:action turn-deck-a
    :parameters (?card1 - card ?card2 - card)
    :precondition (and
      (bottomtalon ?card1)
      (not(talonplayable ?card1))
      (talonplayable ?card2)
      (toptalon ?card2)
    )
    :effect (and
      (not(talonplayable ?card2))
      (talonplayable ?card1)
    )
  )

  (:action tal-to-col-f
    :parameters (?card1 - card ?card2 - card ?colnum1 - colnum ?colnum2 - colnum)
    :precondition (and
      (bottomtalon ?card2)
      (colspace ?colnum2)
      (colsuccessor ?colnum2 ?colnum1)
      (king ?card2)
      (not(bottomcol ?card2))
      (not(bottomtalon ?card1))
      (not(clear ?card2))
      (not(colspace ?colnum1))
      (not(faceup ?card2))
      (not(talonplayable ?card1))
      (ontalon ?card1 ?card2)
      (talonplayable ?card2)
    )
    :effect (and
      (bottomcol ?card2)
      (bottomtalon ?card1)
      (clear ?card2)
      (colspace ?colnum1)
      (faceup ?card2)
      (not(bottomtalon ?card2))
      (not(colspace ?colnum2))
      (not(ontalon ?card1 ?card2))
      (not(talonplayable ?card2))
      (talonplayable ?card1)
    )
  )

  (:action tal-to-col-e
    :parameters (?card1 - card ?card2 - card ?card3 - card ?colnum1 - colnum ?colnum2 - colnum)
    :precondition (and
      (colspace ?colnum2)
      (colsuccessor ?colnum2 ?colnum1)
      (king ?card3)
      (not(bottomcol ?card3))
      (not(clear ?card3))
      (not(colspace ?colnum1))
      (not(faceup ?card3))
      (not(ontalon ?card1 ?card2))
      (not(talonplayable ?card2))
      (ontalon ?card1 ?card3)
      (ontalon ?card3 ?card2)
      (talonplayable ?card3)
    )
    :effect (and
      (bottomcol ?card3)
      (clear ?card3)
      (colspace ?colnum1)
      (faceup ?card3)
      (not(colspace ?colnum2))
      (not(ontalon ?card1 ?card3))
      (not(ontalon ?card3 ?card2))
      (not(talonplayable ?card3))
      (ontalon ?card1 ?card2)
      (talonplayable ?card2)
    )
  )

  (:action tal-to-home-b
    :parameters (?card1 - card ?card2 - card ?card3 - card ?num1 - num ?num2 - num ?suittype1 - suittype)
    :precondition (and
      (bottomtalon ?card3)
      (home ?card1)
      (not(bottomtalon ?card2))
      (not(home ?card3))
      (not(talonplayable ?card2))
      (ontalon ?card2 ?card3)
      (successor ?num1 ?num2)
      (suit ?card1 ?suittype1)
      (suit ?card3 ?suittype1)
      (talonplayable ?card3)
      (value ?card1 ?num2)
      (value ?card3 ?num1)
    )
    :effect (and
      (bottomtalon ?card2)
      (home ?card3)
      (not(bottomtalon ?card3))
      (not(home ?card1))
      (not(ontalon ?card2 ?card3))
      (not(talonplayable ?card3))
      (talonplayable ?card2)
    )
  )

  (:action tal-to-home-d
    :parameters (?card1 - card ?card2 - card ?num1 - num ?num2 - num ?suittype1 - suittype)
    :precondition (and
      (bottomtalon ?card2)
      (home ?card1)
      (not(home ?card2))
      (successor ?num1 ?num2)
      (suit ?card1 ?suittype1)
      (suit ?card2 ?suittype1)
      (talonplayable ?card2)
      (toptalon ?card2)
      (value ?card1 ?num2)
      (value ?card2 ?num1)
    )
    :effect (and
      (home ?card2)
      (not(bottomtalon ?card2))
      (not(home ?card1))
      (not(talonplayable ?card2))
      (not(toptalon ?card2))
    )
  )

  (:action tal-to-col-c
    :parameters (?card1 - card ?card2 - card ?card3 - card)
    :precondition (and
      (canstack ?card3 ?card1)
      (clear ?card1)
      (faceup ?card1)
      (not(clear ?card3))
      (not(faceup ?card3))
      (not(on ?card3 ?card1))
      (not(talonplayable ?card2))
      (not(toptalon ?card2))
      (ontalon ?card3 ?card2)
      (talonplayable ?card3)
      (toptalon ?card3)
    )
    :effect (and
      (clear ?card3)
      (faceup ?card3)
      (not(clear ?card1))
      (not(ontalon ?card3 ?card2))
      (not(talonplayable ?card3))
      (not(toptalon ?card3))
      (on ?card3 ?card1)
      (talonplayable ?card2)
      (toptalon ?card2)
    )
  )

  (:action tal-to-col-g
    :parameters (?card1 - card ?card2 - card ?colnum1 - colnum ?colnum2 - colnum)
    :precondition (and
      (canstack ?card1 ?card2)
      (colspace ?colnum2)
      (colsuccessor ?colnum2 ?colnum1)
      (king ?card2)
      (not(bottomcol ?card2))
      (not(clear ?card2))
      (not(colspace ?colnum1))
      (not(faceup ?card2))
      (not(talonplayable ?card1))
      (not(toptalon ?card1))
      (ontalon ?card2 ?card1)
      (talonplayable ?card2)
      (toptalon ?card2)
    )
    :effect (and
      (bottomcol ?card2)
      (clear ?card2)
      (colspace ?colnum1)
      (faceup ?card2)
      (not(colspace ?colnum2))
      (not(ontalon ?card2 ?card1))
      (not(talonplayable ?card2))
      (not(toptalon ?card2))
      (talonplayable ?card1)
      (toptalon ?card1)
    )
  )

  (:action tal-to-col-b
    :parameters (?card1 - card ?card2 - card ?card3 - card)
    :precondition (and
      (bottomtalon ?card3)
      (canstack ?card3 ?card1)
      (clear ?card1)
      (faceup ?card1)
      (not(bottomtalon ?card2))
      (not(clear ?card3))
      (not(faceup ?card3))
      (not(on ?card3 ?card1))
      (not(talonplayable ?card2))
      (ontalon ?card2 ?card3)
      (talonplayable ?card3)
    )
    :effect (and
      (bottomtalon ?card2)
      (clear ?card3)
      (faceup ?card3)
      (not(bottomtalon ?card3))
      (not(clear ?card1))
      (not(ontalon ?card2 ?card3))
      (not(talonplayable ?card3))
      (on ?card3 ?card1)
      (talonplayable ?card2)
    )
  )

  (:action home-to-col
    :parameters (?card1 - card ?card2 - card ?card3 - card ?num1 - num ?num2 - num ?suittype1 - suittype)
    :precondition (and
      (canstack ?card3 ?card2)
      (clear ?card2)
      (faceup ?card2)
      (home ?card3)
      (not(clear ?card3))
      (not(faceup ?card3))
      (not(home ?card1))
      (not(on ?card3 ?card2))
      (successor ?num1 ?num2)
      (suit ?card1 ?suittype1)
      (suit ?card3 ?suittype1)
      (value ?card1 ?num2)
      (value ?card3 ?num1)
    )
    :effect (and
      (clear ?card3)
      (faceup ?card3)
      (home ?card1)
      (not(clear ?card2))
      (not(home ?card3))
      (on ?card3 ?card2)
    )
  )

  (:action tal-to-col-d
    :parameters (?card1 - card ?card2 - card)
    :precondition (and
      (bottomtalon ?card2)
      (canstack ?card2 ?card1)
      (clear ?card1)
      (faceup ?card1)
      (not(clear ?card2))
      (not(faceup ?card2))
      (not(on ?card2 ?card1))
      (talonplayable ?card2)
      (toptalon ?card2)
    )
    :effect (and
      (clear ?card2)
      (faceup ?card2)
      (not(bottomtalon ?card2))
      (not(clear ?card1))
      (not(talonplayable ?card2))
      (not(toptalon ?card2))
      (on ?card2 ?card1)
    )
  )

)
