drop procedure if exists CheckBooking;
delimiter \\
create procedure CheckBooking(date date, tableno int) 
begin
declare booked int;
set booked = (
		select count(*) from bookings 
		where BookingDate = date and TableNumber = tableno);
if booked > 0 then
	select concat("Table ", tableno, " is already booked") as "Booking Status";
	else
	select concat("Table ", tableno, " is not booked") as "Booking Status";
end if;
end\\
delimiter ;