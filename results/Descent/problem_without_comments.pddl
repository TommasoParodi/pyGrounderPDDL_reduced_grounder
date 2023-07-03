(define (problem descent_prob)
	(:domain descent)
	(:init
		(= (d_final) 100)
		(= (d_margin) 10)
		(= (v_margin) 10)
		(= (v) 0)
		(= (d) 0)
		(= (g) 9.8)
		(= (M) 10000)
		(= (M_min) 5000)
		(= (q) 50)
		(= (ISP) 311)
		
		(stop)

		
		
	)
	(:goal (and (landed) (not (block))))
	(:metric minimize(total-time))
)
	
