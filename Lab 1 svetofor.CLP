(deftemplate svetofor
    (slot color)
)

(deffacts svetoforfacts 
    (crazy no)
    (svetofor 
        (color green)
    )
)

(defrule Go
    (crazy no)
    (svetofor 
        (color green)
    )
=> 
    (printout t "Go" crlf)
)


(defrule stop
    (or
        (crazy yes)
        (svetofor (color red))
    )
=> 
    (printout t "Stop" crlf)    
)
