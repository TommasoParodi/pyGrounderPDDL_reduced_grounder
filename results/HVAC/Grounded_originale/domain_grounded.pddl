(define (domain hvac)
    (:types room request - object)
    (:constants
        r1 - room
        k1 - request
        k2 - request
        k3 - request
        k4 - request
        k5 - request
        k6 - request
        k7 - request
        k8 - request
        k9 - request
        k10 - request
    )
    (:predicates
        (block)
        (alwaysfalse)
        (satisfied ?r - request)
    )
    (:functions
        (air_flow ?l - room)
        (temp ?l - room)
        (temp_sa ?l - room)
        (time)
        (time_requested ?l - room ?r - request)
        (temp_requested ?l - room ?r - request)
        (comfort)
    )
    (:action satisfier_r1_k1
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k1)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k1)(comfort)))
          (=(time)(time_requested r1 k1))
        )
        :effect (and
          (satisfied k1)
        )
    )
    (:action satisfier_r1_k2
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k2)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k2)(comfort)))
          (=(time)(time_requested r1 k2))
        )
        :effect (and
          (satisfied k2)
        )
    )
    (:action satisfier_r1_k3
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k3)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k3)(comfort)))
          (=(time)(time_requested r1 k3))
        )
        :effect (and
          (satisfied k3)
        )
    )
    (:action satisfier_r1_k4
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k4)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k4)(comfort)))
          (=(time)(time_requested r1 k4))
        )
        :effect (and
          (satisfied k4)
        )
    )
    (:action satisfier_r1_k5
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k5)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k5)(comfort)))
          (=(time)(time_requested r1 k5))
        )
        :effect (and
          (satisfied k5)
        )
    )
    (:action satisfier_r1_k6
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k6)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k6)(comfort)))
          (=(time)(time_requested r1 k6))
        )
        :effect (and
          (satisfied k6)
        )
    )
    (:action satisfier_r1_k7
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k7)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k7)(comfort)))
          (=(time)(time_requested r1 k7))
        )
        :effect (and
          (satisfied k7)
        )
    )
    (:action satisfier_r1_k8
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k8)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k8)(comfort)))
          (=(time)(time_requested r1 k8))
        )
        :effect (and
          (satisfied k8)
        )
    )
    (:action satisfier_r1_k9
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k9)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k9)(comfort)))
          (=(time)(time_requested r1 k9))
        )
        :effect (and
          (satisfied k9)
        )
    )
    (:action satisfier_r1_k10
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp r1)(+(temp_requested r1 k10)(comfort)))
          (>=(temp r1)(-(temp_requested r1 k10)(comfort)))
          (=(time)(time_requested r1 k10))
        )
        :effect (and
          (satisfied k10)
        )
    )
    (:action increase_air_flow_r1
        :parameters ()
        :precondition (and
          (not (block))
          (<=(air_flow r1) 3)
        )
        :effect (and
          (increase(air_flow r1) 1)
        )
    )
    (:action decrease_air_flow_r1
        :parameters ()
        :precondition (and
          (not (block))
          (>=(air_flow r1) 1)
        )
        :effect (and
          (decrease(air_flow r1) 1)
        )
    )
    (:action increase_temp_r1
        :parameters ()
        :precondition (and
          (not (block))
          (<=(temp_sa r1) 29)
        )
        :effect (and
          (increase(temp_sa r1) 1)
        )
    )
    (:action decrease_temp_r1
        :parameters ()
        :precondition (and
          (not (block))
          (>=(temp_sa r1) 11)
        )
        :effect (and
          (decrease(temp_sa r1) 1)
        )
    )
    (:process time_passing
        :parameters ()
        :precondition (and
          (not (alwaysfalse))
        )
        :effect (and
          (increase(time)(* #t 1))
        )
    )
    (:process thermal_change_r1
        :parameters ()
        :precondition (and
          (not (alwaysfalse))
        )
        :effect (and
          (increase(temp r1)(* #t(*(air_flow r1)(-(temp_sa r1)(temp r1)))))
        )
    )
    (:event temperature_constraint_r1
        :parameters ()
        :precondition (and
          (not (block))
          (not( and(<=(temp r1) 30)(>=(temp r1) 10)))
        )
        :effect (and
          (block)
        )
    )
)