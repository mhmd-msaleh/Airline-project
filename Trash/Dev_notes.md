## Triggers
- we need to create a table LOG to capture the following 
1) many ticket is deleted. 






### Booking a ticket procedure is as follows: 
1. Passengers info 
2. Selected Seat (seats are assocciated to flight numbers)
3. make payment 
4. Make a booking -> this will trigger to generate a ticket
5. Ticket needs: 
    a) wight
    b) seat_NO and flight_NO

The trigger goes as follows: 
insertion into BOOKING is done:- 
a ticket we be created

--> what if we made the trigger when a payment is recoreded to generate the ticket !!!!




