(define (domain paco3d)
    (:types link axis)
    (:constants
        L1 - link
        L2 - link
        L3 - link
        L4 - link
        xyaxes - axis
        ZAXES - axis
    )
    (:predicates
        (in-use)
        (connected ?l1 - link ?l2 - link)
        (affects ?l1 - link ?l2 - link)
        (freeToMove ?l2 - link)
        (increasing_angle-baxter ?l2 - link ?x - axis)
        (decreasing_angle-baxter ?l2 - link ?x - axis)
        (increasing_angle-gravity ?l2 - link)
        (decreasing_angle-gravity ?l2 - link)
        (alwaysfalse)
    )
    (:functions
        (angle ?l2 - link ?x - axis)
        (speed-i)
        (speed-d)
    )
    (:action start_movement_increase_L1_L1_xyaxes
        :parameters ()
        :precondition (and
          (connected L1 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L1))
          (increasing_angle-baxter L1 xyaxes)
        )
    )
    (:action start_movement_increase_L1_L1_ZAXES
        :parameters ()
        :precondition (and
          (connected L1 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L1))
          (increasing_angle-baxter L1 ZAXES)
        )
    )
    (:action start_movement_increase_L1_L2_xyaxes
        :parameters ()
        :precondition (and
          (connected L1 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L1))
          (increasing_angle-baxter L2 xyaxes)
        )
    )
    (:action start_movement_increase_L1_L2_ZAXES
        :parameters ()
        :precondition (and
          (connected L1 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L1))
          (increasing_angle-baxter L2 ZAXES)
        )
    )
    (:action start_movement_increase_L1_L3_xyaxes
        :parameters ()
        :precondition (and
          (connected L1 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L1))
          (increasing_angle-baxter L3 xyaxes)
        )
    )
    (:action start_movement_increase_L1_L3_ZAXES
        :parameters ()
        :precondition (and
          (connected L1 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L1))
          (increasing_angle-baxter L3 ZAXES)
        )
    )
    (:action start_movement_increase_L1_L4_xyaxes
        :parameters ()
        :precondition (and
          (connected L1 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L1))
          (increasing_angle-baxter L4 xyaxes)
        )
    )
    (:action start_movement_increase_L1_L4_ZAXES
        :parameters ()
        :precondition (and
          (connected L1 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L1))
          (increasing_angle-baxter L4 ZAXES)
        )
    )
    (:action start_movement_increase_L2_L1_xyaxes
        :parameters ()
        :precondition (and
          (connected L2 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L2))
          (increasing_angle-baxter L1 xyaxes)
        )
    )
    (:action start_movement_increase_L2_L1_ZAXES
        :parameters ()
        :precondition (and
          (connected L2 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L2))
          (increasing_angle-baxter L1 ZAXES)
        )
    )
    (:action start_movement_increase_L2_L2_xyaxes
        :parameters ()
        :precondition (and
          (connected L2 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L2))
          (increasing_angle-baxter L2 xyaxes)
        )
    )
    (:action start_movement_increase_L2_L2_ZAXES
        :parameters ()
        :precondition (and
          (connected L2 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L2))
          (increasing_angle-baxter L2 ZAXES)
        )
    )
    (:action start_movement_increase_L2_L3_xyaxes
        :parameters ()
        :precondition (and
          (connected L2 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L2))
          (increasing_angle-baxter L3 xyaxes)
        )
    )
    (:action start_movement_increase_L2_L3_ZAXES
        :parameters ()
        :precondition (and
          (connected L2 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L2))
          (increasing_angle-baxter L3 ZAXES)
        )
    )
    (:action start_movement_increase_L2_L4_xyaxes
        :parameters ()
        :precondition (and
          (connected L2 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L2))
          (increasing_angle-baxter L4 xyaxes)
        )
    )
    (:action start_movement_increase_L2_L4_ZAXES
        :parameters ()
        :precondition (and
          (connected L2 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L2))
          (increasing_angle-baxter L4 ZAXES)
        )
    )
    (:action start_movement_increase_L3_L1_xyaxes
        :parameters ()
        :precondition (and
          (connected L3 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L3))
          (increasing_angle-baxter L1 xyaxes)
        )
    )
    (:action start_movement_increase_L3_L1_ZAXES
        :parameters ()
        :precondition (and
          (connected L3 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L3))
          (increasing_angle-baxter L1 ZAXES)
        )
    )
    (:action start_movement_increase_L3_L2_xyaxes
        :parameters ()
        :precondition (and
          (connected L3 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L3))
          (increasing_angle-baxter L2 xyaxes)
        )
    )
    (:action start_movement_increase_L3_L2_ZAXES
        :parameters ()
        :precondition (and
          (connected L3 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L3))
          (increasing_angle-baxter L2 ZAXES)
        )
    )
    (:action start_movement_increase_L3_L3_xyaxes
        :parameters ()
        :precondition (and
          (connected L3 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L3))
          (increasing_angle-baxter L3 xyaxes)
        )
    )
    (:action start_movement_increase_L3_L3_ZAXES
        :parameters ()
        :precondition (and
          (connected L3 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L3))
          (increasing_angle-baxter L3 ZAXES)
        )
    )
    (:action start_movement_increase_L3_L4_xyaxes
        :parameters ()
        :precondition (and
          (connected L3 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L3))
          (increasing_angle-baxter L4 xyaxes)
        )
    )
    (:action start_movement_increase_L3_L4_ZAXES
        :parameters ()
        :precondition (and
          (connected L3 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L3))
          (increasing_angle-baxter L4 ZAXES)
        )
    )
    (:action start_movement_increase_L4_L1_xyaxes
        :parameters ()
        :precondition (and
          (connected L4 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L4))
          (increasing_angle-baxter L1 xyaxes)
        )
    )
    (:action start_movement_increase_L4_L1_ZAXES
        :parameters ()
        :precondition (and
          (connected L4 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L4))
          (increasing_angle-baxter L1 ZAXES)
        )
    )
    (:action start_movement_increase_L4_L2_xyaxes
        :parameters ()
        :precondition (and
          (connected L4 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L4))
          (increasing_angle-baxter L2 xyaxes)
        )
    )
    (:action start_movement_increase_L4_L2_ZAXES
        :parameters ()
        :precondition (and
          (connected L4 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L4))
          (increasing_angle-baxter L2 ZAXES)
        )
    )
    (:action start_movement_increase_L4_L3_xyaxes
        :parameters ()
        :precondition (and
          (connected L4 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L4))
          (increasing_angle-baxter L3 xyaxes)
        )
    )
    (:action start_movement_increase_L4_L3_ZAXES
        :parameters ()
        :precondition (and
          (connected L4 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L4))
          (increasing_angle-baxter L3 ZAXES)
        )
    )
    (:action start_movement_increase_L4_L4_xyaxes
        :parameters ()
        :precondition (and
          (connected L4 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L4))
          (increasing_angle-baxter L4 xyaxes)
        )
    )
    (:action start_movement_increase_L4_L4_ZAXES
        :parameters ()
        :precondition (and
          (connected L4 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L4))
          (increasing_angle-baxter L4 ZAXES)
        )
    )
    (:action stop_movement_increase_L1_L1_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 xyaxes)
          (connected L1 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L1)
          (not (increasing_angle-baxter L1 xyaxes))
        )
    )
    (:action stop_movement_increase_L1_L1_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 ZAXES)
          (connected L1 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L1)
          (not (increasing_angle-baxter L1 ZAXES))
        )
    )
    (:action stop_movement_increase_L1_L2_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 xyaxes)
          (connected L1 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L1)
          (not (increasing_angle-baxter L2 xyaxes))
        )
    )
    (:action stop_movement_increase_L1_L2_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 ZAXES)
          (connected L1 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L1)
          (not (increasing_angle-baxter L2 ZAXES))
        )
    )
    (:action stop_movement_increase_L1_L3_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 xyaxes)
          (connected L1 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L1)
          (not (increasing_angle-baxter L3 xyaxes))
        )
    )
    (:action stop_movement_increase_L1_L3_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 ZAXES)
          (connected L1 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L1)
          (not (increasing_angle-baxter L3 ZAXES))
        )
    )
    (:action stop_movement_increase_L1_L4_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 xyaxes)
          (connected L1 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L1)
          (not (increasing_angle-baxter L4 xyaxes))
        )
    )
    (:action stop_movement_increase_L1_L4_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 ZAXES)
          (connected L1 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L1)
          (not (increasing_angle-baxter L4 ZAXES))
        )
    )
    (:action stop_movement_increase_L2_L1_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 xyaxes)
          (connected L2 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L2)
          (not (increasing_angle-baxter L1 xyaxes))
        )
    )
    (:action stop_movement_increase_L2_L1_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 ZAXES)
          (connected L2 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L2)
          (not (increasing_angle-baxter L1 ZAXES))
        )
    )
    (:action stop_movement_increase_L2_L2_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 xyaxes)
          (connected L2 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L2)
          (not (increasing_angle-baxter L2 xyaxes))
        )
    )
    (:action stop_movement_increase_L2_L2_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 ZAXES)
          (connected L2 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L2)
          (not (increasing_angle-baxter L2 ZAXES))
        )
    )
    (:action stop_movement_increase_L2_L3_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 xyaxes)
          (connected L2 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L2)
          (not (increasing_angle-baxter L3 xyaxes))
        )
    )
    (:action stop_movement_increase_L2_L3_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 ZAXES)
          (connected L2 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L2)
          (not (increasing_angle-baxter L3 ZAXES))
        )
    )
    (:action stop_movement_increase_L2_L4_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 xyaxes)
          (connected L2 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L2)
          (not (increasing_angle-baxter L4 xyaxes))
        )
    )
    (:action stop_movement_increase_L2_L4_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 ZAXES)
          (connected L2 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L2)
          (not (increasing_angle-baxter L4 ZAXES))
        )
    )
    (:action stop_movement_increase_L3_L1_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 xyaxes)
          (connected L3 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L3)
          (not (increasing_angle-baxter L1 xyaxes))
        )
    )
    (:action stop_movement_increase_L3_L1_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 ZAXES)
          (connected L3 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L3)
          (not (increasing_angle-baxter L1 ZAXES))
        )
    )
    (:action stop_movement_increase_L3_L2_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 xyaxes)
          (connected L3 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L3)
          (not (increasing_angle-baxter L2 xyaxes))
        )
    )
    (:action stop_movement_increase_L3_L2_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 ZAXES)
          (connected L3 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L3)
          (not (increasing_angle-baxter L2 ZAXES))
        )
    )
    (:action stop_movement_increase_L3_L3_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 xyaxes)
          (connected L3 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L3)
          (not (increasing_angle-baxter L3 xyaxes))
        )
    )
    (:action stop_movement_increase_L3_L3_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 ZAXES)
          (connected L3 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L3)
          (not (increasing_angle-baxter L3 ZAXES))
        )
    )
    (:action stop_movement_increase_L3_L4_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 xyaxes)
          (connected L3 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L3)
          (not (increasing_angle-baxter L4 xyaxes))
        )
    )
    (:action stop_movement_increase_L3_L4_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 ZAXES)
          (connected L3 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L3)
          (not (increasing_angle-baxter L4 ZAXES))
        )
    )
    (:action stop_movement_increase_L4_L1_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 xyaxes)
          (connected L4 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L4)
          (not (increasing_angle-baxter L1 xyaxes))
        )
    )
    (:action stop_movement_increase_L4_L1_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 ZAXES)
          (connected L4 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L4)
          (not (increasing_angle-baxter L1 ZAXES))
        )
    )
    (:action stop_movement_increase_L4_L2_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 xyaxes)
          (connected L4 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L4)
          (not (increasing_angle-baxter L2 xyaxes))
        )
    )
    (:action stop_movement_increase_L4_L2_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 ZAXES)
          (connected L4 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L4)
          (not (increasing_angle-baxter L2 ZAXES))
        )
    )
    (:action stop_movement_increase_L4_L3_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 xyaxes)
          (connected L4 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L4)
          (not (increasing_angle-baxter L3 xyaxes))
        )
    )
    (:action stop_movement_increase_L4_L3_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 ZAXES)
          (connected L4 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L4)
          (not (increasing_angle-baxter L3 ZAXES))
        )
    )
    (:action stop_movement_increase_L4_L4_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 xyaxes)
          (connected L4 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L4)
          (not (increasing_angle-baxter L4 xyaxes))
        )
    )
    (:action stop_movement_increase_L4_L4_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 ZAXES)
          (connected L4 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L4)
          (not (increasing_angle-baxter L4 ZAXES))
        )
    )
    (:action start_movement_decrease_L1_L1_xyaxes
        :parameters ()
        :precondition (and
          (connected L1 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L1))
          (decreasing_angle-baxter L1 xyaxes)
        )
    )
    (:action start_movement_decrease_L1_L1_ZAXES
        :parameters ()
        :precondition (and
          (connected L1 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L1))
          (decreasing_angle-baxter L1 ZAXES)
        )
    )
    (:action start_movement_decrease_L1_L2_xyaxes
        :parameters ()
        :precondition (and
          (connected L1 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L1))
          (decreasing_angle-baxter L2 xyaxes)
        )
    )
    (:action start_movement_decrease_L1_L2_ZAXES
        :parameters ()
        :precondition (and
          (connected L1 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L1))
          (decreasing_angle-baxter L2 ZAXES)
        )
    )
    (:action start_movement_decrease_L1_L3_xyaxes
        :parameters ()
        :precondition (and
          (connected L1 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L1))
          (decreasing_angle-baxter L3 xyaxes)
        )
    )
    (:action start_movement_decrease_L1_L3_ZAXES
        :parameters ()
        :precondition (and
          (connected L1 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L1))
          (decreasing_angle-baxter L3 ZAXES)
        )
    )
    (:action start_movement_decrease_L1_L4_xyaxes
        :parameters ()
        :precondition (and
          (connected L1 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L1))
          (decreasing_angle-baxter L4 xyaxes)
        )
    )
    (:action start_movement_decrease_L1_L4_ZAXES
        :parameters ()
        :precondition (and
          (connected L1 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L1))
          (decreasing_angle-baxter L4 ZAXES)
        )
    )
    (:action start_movement_decrease_L2_L1_xyaxes
        :parameters ()
        :precondition (and
          (connected L2 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L2))
          (decreasing_angle-baxter L1 xyaxes)
        )
    )
    (:action start_movement_decrease_L2_L1_ZAXES
        :parameters ()
        :precondition (and
          (connected L2 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L2))
          (decreasing_angle-baxter L1 ZAXES)
        )
    )
    (:action start_movement_decrease_L2_L2_xyaxes
        :parameters ()
        :precondition (and
          (connected L2 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L2))
          (decreasing_angle-baxter L2 xyaxes)
        )
    )
    (:action start_movement_decrease_L2_L2_ZAXES
        :parameters ()
        :precondition (and
          (connected L2 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L2))
          (decreasing_angle-baxter L2 ZAXES)
        )
    )
    (:action start_movement_decrease_L2_L3_xyaxes
        :parameters ()
        :precondition (and
          (connected L2 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L2))
          (decreasing_angle-baxter L3 xyaxes)
        )
    )
    (:action start_movement_decrease_L2_L3_ZAXES
        :parameters ()
        :precondition (and
          (connected L2 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L2))
          (decreasing_angle-baxter L3 ZAXES)
        )
    )
    (:action start_movement_decrease_L2_L4_xyaxes
        :parameters ()
        :precondition (and
          (connected L2 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L2))
          (decreasing_angle-baxter L4 xyaxes)
        )
    )
    (:action start_movement_decrease_L2_L4_ZAXES
        :parameters ()
        :precondition (and
          (connected L2 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L2))
          (decreasing_angle-baxter L4 ZAXES)
        )
    )
    (:action start_movement_decrease_L3_L1_xyaxes
        :parameters ()
        :precondition (and
          (connected L3 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L3))
          (decreasing_angle-baxter L1 xyaxes)
        )
    )
    (:action start_movement_decrease_L3_L1_ZAXES
        :parameters ()
        :precondition (and
          (connected L3 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L3))
          (decreasing_angle-baxter L1 ZAXES)
        )
    )
    (:action start_movement_decrease_L3_L2_xyaxes
        :parameters ()
        :precondition (and
          (connected L3 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L3))
          (decreasing_angle-baxter L2 xyaxes)
        )
    )
    (:action start_movement_decrease_L3_L2_ZAXES
        :parameters ()
        :precondition (and
          (connected L3 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L3))
          (decreasing_angle-baxter L2 ZAXES)
        )
    )
    (:action start_movement_decrease_L3_L3_xyaxes
        :parameters ()
        :precondition (and
          (connected L3 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L3))
          (decreasing_angle-baxter L3 xyaxes)
        )
    )
    (:action start_movement_decrease_L3_L3_ZAXES
        :parameters ()
        :precondition (and
          (connected L3 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L3))
          (decreasing_angle-baxter L3 ZAXES)
        )
    )
    (:action start_movement_decrease_L3_L4_xyaxes
        :parameters ()
        :precondition (and
          (connected L3 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L3))
          (decreasing_angle-baxter L4 xyaxes)
        )
    )
    (:action start_movement_decrease_L3_L4_ZAXES
        :parameters ()
        :precondition (and
          (connected L3 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L3))
          (decreasing_angle-baxter L4 ZAXES)
        )
    )
    (:action start_movement_decrease_L4_L1_xyaxes
        :parameters ()
        :precondition (and
          (connected L4 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L4))
          (decreasing_angle-baxter L1 xyaxes)
        )
    )
    (:action start_movement_decrease_L4_L1_ZAXES
        :parameters ()
        :precondition (and
          (connected L4 L1)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L1))
          (not (freeToMove L4))
          (decreasing_angle-baxter L1 ZAXES)
        )
    )
    (:action start_movement_decrease_L4_L2_xyaxes
        :parameters ()
        :precondition (and
          (connected L4 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L4))
          (decreasing_angle-baxter L2 xyaxes)
        )
    )
    (:action start_movement_decrease_L4_L2_ZAXES
        :parameters ()
        :precondition (and
          (connected L4 L2)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L2))
          (not (freeToMove L4))
          (decreasing_angle-baxter L2 ZAXES)
        )
    )
    (:action start_movement_decrease_L4_L3_xyaxes
        :parameters ()
        :precondition (and
          (connected L4 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L4))
          (decreasing_angle-baxter L3 xyaxes)
        )
    )
    (:action start_movement_decrease_L4_L3_ZAXES
        :parameters ()
        :precondition (and
          (connected L4 L3)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L3))
          (not (freeToMove L4))
          (decreasing_angle-baxter L3 ZAXES)
        )
    )
    (:action start_movement_decrease_L4_L4_xyaxes
        :parameters ()
        :precondition (and
          (connected L4 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L4))
          (decreasing_angle-baxter L4 xyaxes)
        )
    )
    (:action start_movement_decrease_L4_L4_ZAXES
        :parameters ()
        :precondition (and
          (connected L4 L4)
          (not (in-use))
        )
        :effect (and
          (in-use)
          (not (freeToMove L4))
          (not (freeToMove L4))
          (decreasing_angle-baxter L4 ZAXES)
        )
    )
    (:action stop_movement_decrease_L1_L1_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 xyaxes)
          (connected L1 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L1)
          (not (decreasing_angle-baxter L1 xyaxes))
        )
    )
    (:action stop_movement_decrease_L1_L1_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 ZAXES)
          (connected L1 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L1)
          (not (decreasing_angle-baxter L1 ZAXES))
        )
    )
    (:action stop_movement_decrease_L1_L2_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 xyaxes)
          (connected L1 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L1)
          (not (decreasing_angle-baxter L2 xyaxes))
        )
    )
    (:action stop_movement_decrease_L1_L2_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 ZAXES)
          (connected L1 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L1)
          (not (decreasing_angle-baxter L2 ZAXES))
        )
    )
    (:action stop_movement_decrease_L1_L3_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 xyaxes)
          (connected L1 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L1)
          (not (decreasing_angle-baxter L3 xyaxes))
        )
    )
    (:action stop_movement_decrease_L1_L3_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 ZAXES)
          (connected L1 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L1)
          (not (decreasing_angle-baxter L3 ZAXES))
        )
    )
    (:action stop_movement_decrease_L1_L4_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 xyaxes)
          (connected L1 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L1)
          (not (decreasing_angle-baxter L4 xyaxes))
        )
    )
    (:action stop_movement_decrease_L1_L4_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 ZAXES)
          (connected L1 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L1)
          (not (decreasing_angle-baxter L4 ZAXES))
        )
    )
    (:action stop_movement_decrease_L2_L1_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 xyaxes)
          (connected L2 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L2)
          (not (decreasing_angle-baxter L1 xyaxes))
        )
    )
    (:action stop_movement_decrease_L2_L1_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 ZAXES)
          (connected L2 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L2)
          (not (decreasing_angle-baxter L1 ZAXES))
        )
    )
    (:action stop_movement_decrease_L2_L2_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 xyaxes)
          (connected L2 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L2)
          (not (decreasing_angle-baxter L2 xyaxes))
        )
    )
    (:action stop_movement_decrease_L2_L2_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 ZAXES)
          (connected L2 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L2)
          (not (decreasing_angle-baxter L2 ZAXES))
        )
    )
    (:action stop_movement_decrease_L2_L3_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 xyaxes)
          (connected L2 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L2)
          (not (decreasing_angle-baxter L3 xyaxes))
        )
    )
    (:action stop_movement_decrease_L2_L3_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 ZAXES)
          (connected L2 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L2)
          (not (decreasing_angle-baxter L3 ZAXES))
        )
    )
    (:action stop_movement_decrease_L2_L4_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 xyaxes)
          (connected L2 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L2)
          (not (decreasing_angle-baxter L4 xyaxes))
        )
    )
    (:action stop_movement_decrease_L2_L4_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 ZAXES)
          (connected L2 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L2)
          (not (decreasing_angle-baxter L4 ZAXES))
        )
    )
    (:action stop_movement_decrease_L3_L1_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 xyaxes)
          (connected L3 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L3)
          (not (decreasing_angle-baxter L1 xyaxes))
        )
    )
    (:action stop_movement_decrease_L3_L1_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 ZAXES)
          (connected L3 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L3)
          (not (decreasing_angle-baxter L1 ZAXES))
        )
    )
    (:action stop_movement_decrease_L3_L2_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 xyaxes)
          (connected L3 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L3)
          (not (decreasing_angle-baxter L2 xyaxes))
        )
    )
    (:action stop_movement_decrease_L3_L2_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 ZAXES)
          (connected L3 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L3)
          (not (decreasing_angle-baxter L2 ZAXES))
        )
    )
    (:action stop_movement_decrease_L3_L3_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 xyaxes)
          (connected L3 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L3)
          (not (decreasing_angle-baxter L3 xyaxes))
        )
    )
    (:action stop_movement_decrease_L3_L3_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 ZAXES)
          (connected L3 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L3)
          (not (decreasing_angle-baxter L3 ZAXES))
        )
    )
    (:action stop_movement_decrease_L3_L4_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 xyaxes)
          (connected L3 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L3)
          (not (decreasing_angle-baxter L4 xyaxes))
        )
    )
    (:action stop_movement_decrease_L3_L4_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 ZAXES)
          (connected L3 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L3)
          (not (decreasing_angle-baxter L4 ZAXES))
        )
    )
    (:action stop_movement_decrease_L4_L1_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 xyaxes)
          (connected L4 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L4)
          (not (decreasing_angle-baxter L1 xyaxes))
        )
    )
    (:action stop_movement_decrease_L4_L1_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 ZAXES)
          (connected L4 L1)
        )
        :effect (and
          (not (in-use))
          (freeToMove L1)
          (freeToMove L4)
          (not (decreasing_angle-baxter L1 ZAXES))
        )
    )
    (:action stop_movement_decrease_L4_L2_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 xyaxes)
          (connected L4 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L4)
          (not (decreasing_angle-baxter L2 xyaxes))
        )
    )
    (:action stop_movement_decrease_L4_L2_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 ZAXES)
          (connected L4 L2)
        )
        :effect (and
          (not (in-use))
          (freeToMove L2)
          (freeToMove L4)
          (not (decreasing_angle-baxter L2 ZAXES))
        )
    )
    (:action stop_movement_decrease_L4_L3_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 xyaxes)
          (connected L4 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L4)
          (not (decreasing_angle-baxter L3 xyaxes))
        )
    )
    (:action stop_movement_decrease_L4_L3_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 ZAXES)
          (connected L4 L3)
        )
        :effect (and
          (not (in-use))
          (freeToMove L3)
          (freeToMove L4)
          (not (decreasing_angle-baxter L3 ZAXES))
        )
    )
    (:action stop_movement_decrease_L4_L4_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 xyaxes)
          (connected L4 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L4)
          (not (decreasing_angle-baxter L4 xyaxes))
        )
    )
    (:action stop_movement_decrease_L4_L4_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 ZAXES)
          (connected L4 L4)
        )
        :effect (and
          (not (in-use))
          (freeToMove L4)
          (freeToMove L4)
          (not (decreasing_angle-baxter L4 ZAXES))
        )
    )
    (:process move_angle_increase_L1_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 xyaxes)
        )
        :effect (and
          (increase(angle L1 xyaxes)(* #t(speed-i)))
        )
    )
    (:process move_angle_increase_L1_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 ZAXES)
        )
        :effect (and
          (increase(angle L1 ZAXES)(* #t(speed-i)))
        )
    )
    (:process move_angle_increase_L2_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 xyaxes)
        )
        :effect (and
          (increase(angle L2 xyaxes)(* #t(speed-i)))
        )
    )
    (:process move_angle_increase_L2_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 ZAXES)
        )
        :effect (and
          (increase(angle L2 ZAXES)(* #t(speed-i)))
        )
    )
    (:process move_angle_increase_L3_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 xyaxes)
        )
        :effect (and
          (increase(angle L3 xyaxes)(* #t(speed-i)))
        )
    )
    (:process move_angle_increase_L3_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 ZAXES)
        )
        :effect (and
          (increase(angle L3 ZAXES)(* #t(speed-i)))
        )
    )
    (:process move_angle_increase_L4_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 xyaxes)
        )
        :effect (and
          (increase(angle L4 xyaxes)(* #t(speed-i)))
        )
    )
    (:process move_angle_increase_L4_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 ZAXES)
        )
        :effect (and
          (increase(angle L4 ZAXES)(* #t(speed-i)))
        )
    )
    (:process move_angle_decrease_L1_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 xyaxes)
        )
        :effect (and
          (decrease(angle L1 xyaxes)(* #t(speed-d)))
        )
    )
    (:process move_angle_decrease_L1_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 ZAXES)
        )
        :effect (and
          (decrease(angle L1 ZAXES)(* #t(speed-d)))
        )
    )
    (:process move_angle_decrease_L2_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 xyaxes)
        )
        :effect (and
          (decrease(angle L2 xyaxes)(* #t(speed-d)))
        )
    )
    (:process move_angle_decrease_L2_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 ZAXES)
        )
        :effect (and
          (decrease(angle L2 ZAXES)(* #t(speed-d)))
        )
    )
    (:process move_angle_decrease_L3_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 xyaxes)
        )
        :effect (and
          (decrease(angle L3 xyaxes)(* #t(speed-d)))
        )
    )
    (:process move_angle_decrease_L3_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 ZAXES)
        )
        :effect (and
          (decrease(angle L3 ZAXES)(* #t(speed-d)))
        )
    )
    (:process move_angle_decrease_L4_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 xyaxes)
        )
        :effect (and
          (decrease(angle L4 xyaxes)(* #t(speed-d)))
        )
    )
    (:process move_angle_decrease_L4_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 ZAXES)
        )
        :effect (and
          (decrease(angle L4 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L1_L1_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 xyaxes)
          (affects L1 L1)
        )
        :effect (and
          (decrease(angle L1 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L1_L1_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 ZAXES)
          (affects L1 L1)
        )
        :effect (and
          (decrease(angle L1 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L1_L2_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 xyaxes)
          (affects L1 L2)
        )
        :effect (and
          (decrease(angle L2 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L1_L2_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 ZAXES)
          (affects L1 L2)
        )
        :effect (and
          (decrease(angle L2 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L1_L3_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 xyaxes)
          (affects L1 L3)
        )
        :effect (and
          (decrease(angle L3 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L1_L3_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 ZAXES)
          (affects L1 L3)
        )
        :effect (and
          (decrease(angle L3 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L1_L4_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 xyaxes)
          (affects L1 L4)
        )
        :effect (and
          (decrease(angle L4 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L1_L4_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L1 ZAXES)
          (affects L1 L4)
        )
        :effect (and
          (decrease(angle L4 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L2_L1_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 xyaxes)
          (affects L2 L1)
        )
        :effect (and
          (decrease(angle L1 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L2_L1_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 ZAXES)
          (affects L2 L1)
        )
        :effect (and
          (decrease(angle L1 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L2_L2_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 xyaxes)
          (affects L2 L2)
        )
        :effect (and
          (decrease(angle L2 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L2_L2_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 ZAXES)
          (affects L2 L2)
        )
        :effect (and
          (decrease(angle L2 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L2_L3_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 xyaxes)
          (affects L2 L3)
        )
        :effect (and
          (decrease(angle L3 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L2_L3_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 ZAXES)
          (affects L2 L3)
        )
        :effect (and
          (decrease(angle L3 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L2_L4_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 xyaxes)
          (affects L2 L4)
        )
        :effect (and
          (decrease(angle L4 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L2_L4_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L2 ZAXES)
          (affects L2 L4)
        )
        :effect (and
          (decrease(angle L4 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L3_L1_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 xyaxes)
          (affects L3 L1)
        )
        :effect (and
          (decrease(angle L1 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L3_L1_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 ZAXES)
          (affects L3 L1)
        )
        :effect (and
          (decrease(angle L1 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L3_L2_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 xyaxes)
          (affects L3 L2)
        )
        :effect (and
          (decrease(angle L2 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L3_L2_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 ZAXES)
          (affects L3 L2)
        )
        :effect (and
          (decrease(angle L2 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L3_L3_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 xyaxes)
          (affects L3 L3)
        )
        :effect (and
          (decrease(angle L3 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L3_L3_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 ZAXES)
          (affects L3 L3)
        )
        :effect (and
          (decrease(angle L3 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L3_L4_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 xyaxes)
          (affects L3 L4)
        )
        :effect (and
          (decrease(angle L4 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L3_L4_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L3 ZAXES)
          (affects L3 L4)
        )
        :effect (and
          (decrease(angle L4 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L4_L1_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 xyaxes)
          (affects L4 L1)
        )
        :effect (and
          (decrease(angle L1 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L4_L1_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 ZAXES)
          (affects L4 L1)
        )
        :effect (and
          (decrease(angle L1 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L4_L2_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 xyaxes)
          (affects L4 L2)
        )
        :effect (and
          (decrease(angle L2 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L4_L2_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 ZAXES)
          (affects L4 L2)
        )
        :effect (and
          (decrease(angle L2 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L4_L3_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 xyaxes)
          (affects L4 L3)
        )
        :effect (and
          (decrease(angle L3 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L4_L3_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 ZAXES)
          (affects L4 L3)
        )
        :effect (and
          (decrease(angle L3 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L4_L4_xyaxes
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 xyaxes)
          (affects L4 L4)
        )
        :effect (and
          (decrease(angle L4 xyaxes)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_decrease_L4_L4_ZAXES
        :parameters ()
        :precondition (and
          (decreasing_angle-baxter L4 ZAXES)
          (affects L4 L4)
        )
        :effect (and
          (decrease(angle L4 ZAXES)(* #t(speed-d)))
        )
    )
    (:process propagate_move_angle_increase_L1_L1_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 xyaxes)
          (affects L1 L1)
        )
        :effect (and
          (increase(angle L1 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L1_L1_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 ZAXES)
          (affects L1 L1)
        )
        :effect (and
          (increase(angle L1 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L1_L2_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 xyaxes)
          (affects L1 L2)
        )
        :effect (and
          (increase(angle L2 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L1_L2_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 ZAXES)
          (affects L1 L2)
        )
        :effect (and
          (increase(angle L2 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L1_L3_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 xyaxes)
          (affects L1 L3)
        )
        :effect (and
          (increase(angle L3 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L1_L3_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 ZAXES)
          (affects L1 L3)
        )
        :effect (and
          (increase(angle L3 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L1_L4_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 xyaxes)
          (affects L1 L4)
        )
        :effect (and
          (increase(angle L4 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L1_L4_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L1 ZAXES)
          (affects L1 L4)
        )
        :effect (and
          (increase(angle L4 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L2_L1_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 xyaxes)
          (affects L2 L1)
        )
        :effect (and
          (increase(angle L1 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L2_L1_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 ZAXES)
          (affects L2 L1)
        )
        :effect (and
          (increase(angle L1 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L2_L2_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 xyaxes)
          (affects L2 L2)
        )
        :effect (and
          (increase(angle L2 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L2_L2_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 ZAXES)
          (affects L2 L2)
        )
        :effect (and
          (increase(angle L2 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L2_L3_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 xyaxes)
          (affects L2 L3)
        )
        :effect (and
          (increase(angle L3 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L2_L3_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 ZAXES)
          (affects L2 L3)
        )
        :effect (and
          (increase(angle L3 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L2_L4_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 xyaxes)
          (affects L2 L4)
        )
        :effect (and
          (increase(angle L4 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L2_L4_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L2 ZAXES)
          (affects L2 L4)
        )
        :effect (and
          (increase(angle L4 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L3_L1_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 xyaxes)
          (affects L3 L1)
        )
        :effect (and
          (increase(angle L1 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L3_L1_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 ZAXES)
          (affects L3 L1)
        )
        :effect (and
          (increase(angle L1 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L3_L2_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 xyaxes)
          (affects L3 L2)
        )
        :effect (and
          (increase(angle L2 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L3_L2_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 ZAXES)
          (affects L3 L2)
        )
        :effect (and
          (increase(angle L2 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L3_L3_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 xyaxes)
          (affects L3 L3)
        )
        :effect (and
          (increase(angle L3 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L3_L3_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 ZAXES)
          (affects L3 L3)
        )
        :effect (and
          (increase(angle L3 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L3_L4_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 xyaxes)
          (affects L3 L4)
        )
        :effect (and
          (increase(angle L4 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L3_L4_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L3 ZAXES)
          (affects L3 L4)
        )
        :effect (and
          (increase(angle L4 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L4_L1_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 xyaxes)
          (affects L4 L1)
        )
        :effect (and
          (increase(angle L1 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L4_L1_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 ZAXES)
          (affects L4 L1)
        )
        :effect (and
          (increase(angle L1 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L4_L2_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 xyaxes)
          (affects L4 L2)
        )
        :effect (and
          (increase(angle L2 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L4_L2_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 ZAXES)
          (affects L4 L2)
        )
        :effect (and
          (increase(angle L2 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L4_L3_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 xyaxes)
          (affects L4 L3)
        )
        :effect (and
          (increase(angle L3 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L4_L3_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 ZAXES)
          (affects L4 L3)
        )
        :effect (and
          (increase(angle L3 ZAXES)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L4_L4_xyaxes
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 xyaxes)
          (affects L4 L4)
        )
        :effect (and
          (increase(angle L4 xyaxes)(* #t(speed-i)))
        )
    )
    (:process propagate_move_angle_increase_L4_L4_ZAXES
        :parameters ()
        :precondition (and
          (increasing_angle-baxter L4 ZAXES)
          (affects L4 L4)
        )
        :effect (and
          (increase(angle L4 ZAXES)(* #t(speed-i)))
        )
    )
    (:event back-to-zero_L1_xyaxes
        :parameters ()
        :precondition (and
          (>(angle L1 xyaxes) 360)
        )
        :effect (and
          (assign(angle L1 xyaxes) 0)
        )
    )
    (:event back-to-zero_L1_ZAXES
        :parameters ()
        :precondition (and
          (>(angle L1 ZAXES) 360)
        )
        :effect (and
          (assign(angle L1 ZAXES) 0)
        )
    )
    (:event back-to-zero_L2_xyaxes
        :parameters ()
        :precondition (and
          (>(angle L2 xyaxes) 360)
        )
        :effect (and
          (assign(angle L2 xyaxes) 0)
        )
    )
    (:event back-to-zero_L2_ZAXES
        :parameters ()
        :precondition (and
          (>(angle L2 ZAXES) 360)
        )
        :effect (and
          (assign(angle L2 ZAXES) 0)
        )
    )
    (:event back-to-zero_L3_xyaxes
        :parameters ()
        :precondition (and
          (>(angle L3 xyaxes) 360)
        )
        :effect (and
          (assign(angle L3 xyaxes) 0)
        )
    )
    (:event back-to-zero_L3_ZAXES
        :parameters ()
        :precondition (and
          (>(angle L3 ZAXES) 360)
        )
        :effect (and
          (assign(angle L3 ZAXES) 0)
        )
    )
    (:event back-to-zero_L4_xyaxes
        :parameters ()
        :precondition (and
          (>(angle L4 xyaxes) 360)
        )
        :effect (and
          (assign(angle L4 xyaxes) 0)
        )
    )
    (:event back-to-zero_L4_ZAXES
        :parameters ()
        :precondition (and
          (>(angle L4 ZAXES) 360)
        )
        :effect (and
          (assign(angle L4 ZAXES) 0)
        )
    )
    (:event back-to-360_L1_xyaxes
        :parameters ()
        :precondition (and
          (<(angle L1 xyaxes) 0)
        )
        :effect (and
          (assign(angle L1 xyaxes) 360)
        )
    )
    (:event back-to-360_L1_ZAXES
        :parameters ()
        :precondition (and
          (<(angle L1 ZAXES) 0)
        )
        :effect (and
          (assign(angle L1 ZAXES) 360)
        )
    )
    (:event back-to-360_L2_xyaxes
        :parameters ()
        :precondition (and
          (<(angle L2 xyaxes) 0)
        )
        :effect (and
          (assign(angle L2 xyaxes) 360)
        )
    )
    (:event back-to-360_L2_ZAXES
        :parameters ()
        :precondition (and
          (<(angle L2 ZAXES) 0)
        )
        :effect (and
          (assign(angle L2 ZAXES) 360)
        )
    )
    (:event back-to-360_L3_xyaxes
        :parameters ()
        :precondition (and
          (<(angle L3 xyaxes) 0)
        )
        :effect (and
          (assign(angle L3 xyaxes) 360)
        )
    )
    (:event back-to-360_L3_ZAXES
        :parameters ()
        :precondition (and
          (<(angle L3 ZAXES) 0)
        )
        :effect (and
          (assign(angle L3 ZAXES) 360)
        )
    )
    (:event back-to-360_L4_xyaxes
        :parameters ()
        :precondition (and
          (<(angle L4 xyaxes) 0)
        )
        :effect (and
          (assign(angle L4 xyaxes) 360)
        )
    )
    (:event back-to-360_L4_ZAXES
        :parameters ()
        :precondition (and
          (<(angle L4 ZAXES) 0)
        )
        :effect (and
          (assign(angle L4 ZAXES) 360)
        )
    )
)