         CLIPS (6.30 3/17/15)
CLIPS> (deftemplate EmployOnWork
(slot high education) (slot experience) (slot academic degree))

(defrule Employ as Researcher
(high education yes)
(experience ? year)
(check (> ?year 1))
(academic degree yes)
=>
(printout t "Employ as Researcher" crlf)
)

(defrule Employ as Constructor
(high education yes)
(experience ? year)
(check (> ?year 1))
(academic degree no)
=>
(printout t "Employ as Constructor" crlf)
)

(defrule Refuse in employment

(high education no)

(or
(experience ? year)
(check (< ?year 1))
)
=>
(printout t "Refuse in employment" crlf)
)
[PRNTUTIL2] Syntax Error:  Check appropriate syntax for deftemplate.

ERROR:
(deftemplate MAIN::EmployOnWork
   (slot high education
CLIPS> 
