        (deftemplate ApartmentState
    (slot NumberOwners
        (type NUMBER)
        (default ?DERIVE)
    )

    (slot Square
        (type NUMBER)
        (default ?DERIVE)
    )

    (slot DistanceToSubway
        (type NUMBER)
        (default ?DERIVE)
    )

    (slot ParkingPlace
        (type SYMBOL)
        (default ?DERIVE)
    )
)


;факты для квартиры
(deffacts ApartmentStateFacts
    (ApartmentState
        (NumberOwners 1)        
        (Square 31)
        (DistanceToSubway 1)
        (ParkingPlace YES)
    )
)

; если квартира плохая
(defrule BadFlat
    (ApartmentState 
        (Square ?Square)
    )
    (ApartmentState 
        (DistanceToSubway ?DistanceToSubway)
    )
    (ApartmentState
        (ParkingPlace ?ParkingPlace)
    )
    
    (and
        (test (< ?Square 30))
        (test (>= ?DistanceToSubway 2))
        (ApartmentState (ParkingPlace NO))               
    )
=>
    (assert (BadFlat))
)

; если квартира хорошая
(defrule GoodFlat
    (ApartmentState (Square ?Square))
    (ApartmentState (DistanceToSubway ?DistanceToSubway))
    (and
        (test (>= ?Square 30))
        (test(< ?DistanceToSubway 2))
        (ApartmentState (ParkingPlace YES))        
    )
=>
    (assert (GoodFlat))
)


(defrule PrintBuy
    (GoodFlat)
=>
    (printout t "Buy this apartment" crlf)
)

(defrule PrintYouCanBuyIt
    (BadFlat)
=>
    (printout t "You can buy it, but it's bad idea" crlf)
)

)
=>
(assert (GoodFlat))
)

(defrule PrintBuy
(GoodFlat)
=>
(printout t "Buy this apartment" crlf)
)

(defrule PrintYouCanBuyIt
(Badflat)
=>
(printout t "You can buy it, but it's bad idea" crlf)
)

(defrule NoDon'tBuyIt
(BadState)
=>
(printout t "No, don't buy it!" crlf)
)

[EXPRNPSR3] Missing function declaration for Deftemplate.
CLIPS> 
