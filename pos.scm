; Sean Aubrey
; CIS 343
; 4/8/2018

(define tax_rate 0.065)
(define total 0)
(define round_to 2)

; Moves decimal place right dec_place times so as not to lose
; data when rounding, then returns to the original decimal place
(define (round_off num dec_place)
  (let ((power (expt 10 dec_place)))
    (/ (round (* power num)) power)
  )
)


(display "\nScheme Point-of-Sale\nStart Transaction(complete order with 0):")

; Recursive function to read user input and add it to the
; total cost. Returns when 0 is entered.
(define (pos total new_price)(
	
	; Recursive exit base case value is 0
	(if (eq? new_price 0)
		(begin
			(display "\nSubtotal: $")
			(display (round_off total round_to))

			(let ((total_tax(* total tax_rate)))
				(display "\nTax: $")
				(display (round_off total_tax round_to))
				(display "\nTotal: $")
				(display (round_off (+ total total_tax) round_to))
			)
			(exit)
		)

		; Else, update and call recursively
		(begin
			(display "Total: $")
			(display (round_off (+ total new_price) round_to))
			(display "\nEnter a value: $")

			(let ((input(read))) 
				((pos (+ total new_price) input))
			)
		)
	)
))