;; a simple problem for the Explorer Robot Domain (ewr)
;; 2 rbt, 4 zones + base, 4 tasks and 3 instruments
;; constraint on at most one per robot zone (dom2)

(define (problem ewr2a)
    (:domain ewr2)

  (:objects ra rb - robot
	    base - location
    	    z1 z2 z3 z4 - zone
	    camera socle brosses pulverisateur - instrument
	    supervision buttage binage epandage - task)

  (:init (adjacent z1 z2) (adjacent z2 z1)
	 (adjacent z2 z3) (adjacent z3 z2)
	 (adjacent z3 z4) (adjacent z4 z3)
	 (adjacent z1 base) (adjacent base z1)
	 (adjacent z4 base) (adjacent base z4)
	 
	 (at ra base) (bare ra)
	 (at rb base) (bare rb)
	 
	 (available socle) (available brosses)
	 
	 (adapted camera supervision)
	 (adapted socle binage)
	 (adapted brosses buttage)
	 )

  ;; this goal requires all zones to be surveyed then processed and robot back at base
  (:goal (and (forall (?z - zone)
		      (and (achieved binage ?z)
			   (achieved buttage ?z)))
	      (at ra base)
	      (at rb base))
	 )
 
  )
	 
	 
