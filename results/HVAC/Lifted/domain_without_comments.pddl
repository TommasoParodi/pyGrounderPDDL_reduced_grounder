(define (domain hvac)
   (:requirements :fluents :durative-actions :adl :typing :time)
   (:types
      room request -object
   )
   (:predicates
      (block)
      (alwaysfalse)
      (satisfied ?r -request)
   )
   (:functions
      (air_flow ?l -room) 
      (temp ?l -room) 
      (temp_sa ?l -room) 
      (time) 
      (time_requested ?l -room ?r -request) 
      (temp_requested ?l -room ?r -request) 
      (comfort) 
   )

   (:action satisfier
      :parameters (?l -room ?r -request)
      :precondition (and 
         (not (block))
         (<= (temp ?l) (+ (temp_requested ?l ?r) (comfort))) 
         (>= (temp ?l) (- (temp_requested ?l ?r) (comfort))) 
         (= (time) (time_requested ?l ?r)))
      :effect (and (satisfied ?r))
   )


   
   (:process time_passing
      :parameters ()
      :precondition (and (not (alwaysfalse)))
      :effect (and(increase (time) (* #t 1)))
   )

   
   
   (:process thermal_change
      :parameters (?l -room)
      :precondition (and(not(alwaysfalse)))
      :effect (and (increase
            (temp ?l)
            (* #t (* (air_flow ?l) (- (temp_sa ?l) (temp ?l))))))
   )

   
   (:action increase_air_flow
      :parameters (?l -room)
      :precondition (and 
         (not (block))
         (<= (air_flow ?l) 3))
      :effect (and(increase (air_flow ?l) 1))
   )

   (:action decrease_air_flow
      :parameters (?l -room)
      :precondition (and 
         (not (block))
         (>= (air_flow ?l) 1))
      :effect (and(decrease (air_flow ?l) 1))
   )

   (:action increase_temp
      :parameters (?l -room)
      :precondition (and 
         (not (block))
         (<= (temp_sa ?l) 29))
      :effect (and(increase (temp_sa ?l) 1))
   )

   (:action decrease_temp
      :parameters (?l -room)
      :precondition (and 
         (not (block))
         (>= (temp_sa ?l) 11))
      :effect (and(decrease (temp_sa ?l) 1))
   )

   (:event temperature_constraint
     :parameters (?l - room)
     :precondition (and (not (block)) (not (and (<= (temp ?l) 30) (>= (temp ?l) 10))))
     :effect (and (block))
   )

)