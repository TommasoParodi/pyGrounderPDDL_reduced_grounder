(define (domain generator_linear_mt)
    (:types generator tank)
    (:constants
        gen_1 - generator
        tank_1 - tank
        tank_2 - tank
        tank_3 - tank
        tank_4 - tank
        tank_5 - tank
        tank_6 - tank
        tank_7 - tank
        tank_8 - tank
        tank_9 - tank
        tank_10 - tank
    )
    (:predicates
        (online ?g - generator)
        (not_online ?g - generator)
        (available ?t - tank)
        (not_available ?t - tank)
        (generator-ran ?g - generator)
        (using ?t - tank)
        (block)
        (block_refuel ?g - generator ?t - tank)
        (block_generator ?g - generator)
        (closed)
    )
    (:functions
        (fuelLevel ?g - generator)
        (capacity ?g - generator)
        (generator_running ?g - generator)
        (refuel_running ?g - generator ?t - tank)
        (generator_duration)
        (refuel_duration)
    )
    (:action turn_on_gen_1
        :parameters ()
        :precondition (and
          (not_online gen_1)
          (<(generator_running gen_1)(generator_duration))
        )
        :effect (and
          (online gen_1)
          (not (not_online gen_1))
          (assign(generator_running gen_1) 0)
        )
    )
    (:action start_refueling_gen_1_tank_1
        :parameters ()
        :precondition (and
          (available tank_1)
        )
        :effect (and
          (not (available tank_1))
          (using tank_1)
        )
    )
    (:action start_refueling_gen_1_tank_2
        :parameters ()
        :precondition (and
          (available tank_2)
        )
        :effect (and
          (not (available tank_2))
          (using tank_2)
        )
    )
    (:action start_refueling_gen_1_tank_3
        :parameters ()
        :precondition (and
          (available tank_3)
        )
        :effect (and
          (not (available tank_3))
          (using tank_3)
        )
    )
    (:action start_refueling_gen_1_tank_4
        :parameters ()
        :precondition (and
          (available tank_4)
        )
        :effect (and
          (not (available tank_4))
          (using tank_4)
        )
    )
    (:action start_refueling_gen_1_tank_5
        :parameters ()
        :precondition (and
          (available tank_5)
        )
        :effect (and
          (not (available tank_5))
          (using tank_5)
        )
    )
    (:action start_refueling_gen_1_tank_6
        :parameters ()
        :precondition (and
          (available tank_6)
        )
        :effect (and
          (not (available tank_6))
          (using tank_6)
        )
    )
    (:action start_refueling_gen_1_tank_7
        :parameters ()
        :precondition (and
          (available tank_7)
        )
        :effect (and
          (not (available tank_7))
          (using tank_7)
        )
    )
    (:action start_refueling_gen_1_tank_8
        :parameters ()
        :precondition (and
          (available tank_8)
        )
        :effect (and
          (not (available tank_8))
          (using tank_8)
        )
    )
    (:action start_refueling_gen_1_tank_9
        :parameters ()
        :precondition (and
          (available tank_9)
        )
        :effect (and
          (not (available tank_9))
          (using tank_9)
        )
    )
    (:action start_refueling_gen_1_tank_10
        :parameters ()
        :precondition (and
          (available tank_10)
        )
        :effect (and
          (not (available tank_10))
          (using tank_10)
        )
    )
    (:process generate_power_gen_1
        :parameters ()
        :precondition (and
          (online gen_1)
          (>(fuelLevel gen_1) 0.0)
          (not (block_generator gen_1))
        )
        :effect (and
          (decrease(fuelLevel gen_1)(* #t 1.0))
          (increase(generator_running gen_1)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_1
        :parameters ()
        :precondition (and
          (using tank_1)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_1)(refuel_duration))
          (not (block_refuel gen_1 tank_1))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_1)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_2
        :parameters ()
        :precondition (and
          (using tank_2)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_2)(refuel_duration))
          (not (block_refuel gen_1 tank_2))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_2)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_3
        :parameters ()
        :precondition (and
          (using tank_3)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_3)(refuel_duration))
          (not (block_refuel gen_1 tank_3))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_3)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_4
        :parameters ()
        :precondition (and
          (using tank_4)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_4)(refuel_duration))
          (not (block_refuel gen_1 tank_4))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_4)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_5
        :parameters ()
        :precondition (and
          (using tank_5)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_5)(refuel_duration))
          (not (block_refuel gen_1 tank_5))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_5)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_6
        :parameters ()
        :precondition (and
          (using tank_6)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_6)(refuel_duration))
          (not (block_refuel gen_1 tank_6))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_6)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_7
        :parameters ()
        :precondition (and
          (using tank_7)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_7)(refuel_duration))
          (not (block_refuel gen_1 tank_7))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_7)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_8
        :parameters ()
        :precondition (and
          (using tank_8)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_8)(refuel_duration))
          (not (block_refuel gen_1 tank_8))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_8)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_9
        :parameters ()
        :precondition (and
          (using tank_9)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_9)(refuel_duration))
          (not (block_refuel gen_1 tank_9))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_9)(* #t 1.0))
        )
    )
    (:process refuel_generator_gen_1_tank_10
        :parameters ()
        :precondition (and
          (using tank_10)
          (<(fuelLevel gen_1)(capacity gen_1))
          (<(refuel_running gen_1 tank_10)(refuel_duration))
          (not (block_refuel gen_1 tank_10))
        )
        :effect (and
          (increase(fuelLevel gen_1)(* #t 2.0))
          (increase(refuel_running gen_1 tank_10)(* #t 1.0))
        )
    )
    (:event min_generator_fuel_gen_1
        :parameters ()
        :precondition (and
          (not( >=(fuelLevel gen_1) 0.0))
          (not (block))
        )
        :effect (and
          (block)
        )
    )
    (:event max_generator_fuel_gen_1
        :parameters ()
        :precondition (and
          (not( <=(fuelLevel gen_1)(capacity gen_1)))
          (not (block))
        )
        :effect (and
          (block)
        )
    )
    (:event refuel_duration_block_gen_1_tank_1
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_1)(refuel_duration)))
          (not (block_refuel gen_1 tank_1))
        )
        :effect (and
          (block_refuel gen_1 tank_1)
        )
    )
    (:event refuel_duration_block_gen_1_tank_2
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_2)(refuel_duration)))
          (not (block_refuel gen_1 tank_2))
        )
        :effect (and
          (block_refuel gen_1 tank_2)
        )
    )
    (:event refuel_duration_block_gen_1_tank_3
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_3)(refuel_duration)))
          (not (block_refuel gen_1 tank_3))
        )
        :effect (and
          (block_refuel gen_1 tank_3)
        )
    )
    (:event refuel_duration_block_gen_1_tank_4
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_4)(refuel_duration)))
          (not (block_refuel gen_1 tank_4))
        )
        :effect (and
          (block_refuel gen_1 tank_4)
        )
    )
    (:event refuel_duration_block_gen_1_tank_5
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_5)(refuel_duration)))
          (not (block_refuel gen_1 tank_5))
        )
        :effect (and
          (block_refuel gen_1 tank_5)
        )
    )
    (:event refuel_duration_block_gen_1_tank_6
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_6)(refuel_duration)))
          (not (block_refuel gen_1 tank_6))
        )
        :effect (and
          (block_refuel gen_1 tank_6)
        )
    )
    (:event refuel_duration_block_gen_1_tank_7
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_7)(refuel_duration)))
          (not (block_refuel gen_1 tank_7))
        )
        :effect (and
          (block_refuel gen_1 tank_7)
        )
    )
    (:event refuel_duration_block_gen_1_tank_8
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_8)(refuel_duration)))
          (not (block_refuel gen_1 tank_8))
        )
        :effect (and
          (block_refuel gen_1 tank_8)
        )
    )
    (:event refuel_duration_block_gen_1_tank_9
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_9)(refuel_duration)))
          (not (block_refuel gen_1 tank_9))
        )
        :effect (and
          (block_refuel gen_1 tank_9)
        )
    )
    (:event refuel_duration_block_gen_1_tank_10
        :parameters ()
        :precondition (and
          (not( <=(refuel_running gen_1 tank_10)(refuel_duration)))
          (not (block_refuel gen_1 tank_10))
        )
        :effect (and
          (block_refuel gen_1 tank_10)
        )
    )
    (:event generator_duration_block_gen_1
        :parameters ()
        :precondition (and
          (not( <=(generator_running gen_1)(generator_duration)))
          (not (block_generator gen_1))
        )
        :effect (and
          (block_generator gen_1)
        )
    )
)