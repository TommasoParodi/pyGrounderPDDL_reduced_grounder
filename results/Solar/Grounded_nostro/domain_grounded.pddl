(define (domain generator2)
    (:types generalBattery battery)
    (:constants
        GB - generalBattery
        b1 - battery
        b2 - battery
        b3 - battery
    )
    (:predicates
        (alwaysfalse)
        (gboff ?gb - generalBattery)
        (gbon ?gb - generalBattery)
        (off ?b - battery)
        (on ?b - battery)
        (night)
        (sunexposure)
        (solarsupport)
        (datatosend)
        (datasent)
        (roversafe)
    )
    (:functions
        (roverenergy)
        (SoC ?b - battery)
        (time)
        (sunexposure_time)
    )
    (:action switchGenBatteryOn_GB
        :parameters ()
        :precondition (and
          (gboff GB)
        )
        :effect (and
          (gbon GB)
          (not (gboff GB))
          (roversafe)
          (increase(roverenergy) 100)
        )
    )
    (:action start_useBattery_b1
        :parameters ()
        :precondition (and
          (off b1)
        )
        :effect (and
          (increase(roverenergy) 10)
          (on b1)
          (not (off b1))
        )
    )
    (:action start_useBattery_b2
        :parameters ()
        :precondition (and
          (off b2)
        )
        :effect (and
          (increase(roverenergy) 10)
          (on b2)
          (not (off b2))
        )
    )
    (:action start_useBattery_b3
        :parameters ()
        :precondition (and
          (off b3)
        )
        :effect (and
          (increase(roverenergy) 10)
          (on b3)
          (not (off b3))
        )
    )
    (:action sendData
        :parameters ()
        :precondition (and
          (datatosend)
          (roversafe)
          (>=(roverenergy) 500)
        )
        :effect (and
          (datasent)
          (not (datatosend))
        )
    )
    (:process useBattery_b1
        :parameters ()
        :precondition (and
          (on b1)
          (roversafe)
          (>(SoC b1) 0)
        )
        :effect (and
          (decrease(SoC b1)(* #t 1))
        )
    )
    (:process useBattery_b2
        :parameters ()
        :precondition (and
          (on b2)
          (roversafe)
          (>(SoC b2) 0)
        )
        :effect (and
          (decrease(SoC b2)(* #t 1))
        )
    )
    (:process useBattery_b3
        :parameters ()
        :precondition (and
          (on b3)
          (roversafe)
          (>(SoC b3) 0)
        )
        :effect (and
          (decrease(SoC b3)(* #t 1))
        )
    )
    (:process passingTime
        :parameters ()
        :precondition (and
          (not (alwaysfalse))
        )
        :effect (and
          (increase(time)(* #t 1))
        )
    )
    (:event end_useBattery_b1
        :parameters ()
        :precondition (and
          (on b1)
          (or(roversafe)(not( >(SoC b1) 0)))
        )
        :effect (and
          (not (on b1))
        )
    )
    (:event end_useBattery_b2
        :parameters ()
        :precondition (and
          (on b2)
          (or(roversafe)(not( >(SoC b2) 0)))
        )
        :effect (and
          (not (on b2))
        )
    )
    (:event end_useBattery_b3
        :parameters ()
        :precondition (and
          (on b3)
          (or(roversafe)(not( >(SoC b3) 0)))
        )
        :effect (and
          (not (on b3))
        )
    )
    (:event sunshine
        :parameters ()
        :precondition (and
          (night)
          (sunexposure)
        )
        :effect (and
          (not (night))
          (increase(roverenergy) 400)
        )
    )
    (:event sunexposure_event
        :parameters ()
        :precondition (and
          (>=(time)(sunexposure_time))
          (not (sunexposure))
        )
        :effect (and
          (sunexposure)
        )
    )
)