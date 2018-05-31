         CLIPS (6.30 3/17/15)
CLIPS> (Deftemplate EvaluationOfApartmentForSale
(Slot NumberOwners
(type NUMBER)
(default ?DERIVE))

(slot Square
(type NUMBER)
(default ?DERIVE))

(slot DistanceToSubway
(type NUMBER)
(default ?DERIVE))

(slot ParkingPlace
(type SYMBOL)
(default ?DERIVE))
)

Defrule BadFlat
(ApartmentState (Square ?Square))
(ApartmentState (Distance ToSubway ?DistanceToSubway))
(and
(or
(test (< ?Square 30 m))
(test (>= ?Distance ToSubway 2km))
(ApartmentState (ParkingPlaceNo))
)
(GoodState)
)
=>
(assert (BadFlat))
)

(defrule GoodFlat
(ApartmentState (Square ?Square))
(ApartmentState (Distance ToSubway))
(and
(test (>= ?Square 30 m))
(test(<DistanceToSubway 2km))
(ApartmentState (ParkingPlace YES))
(GoodState)
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
