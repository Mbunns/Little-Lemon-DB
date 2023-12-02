drop procedure if exists AddValidBooking;
delimiter \\
create procedure AddValidBooking(date date, tableno int) 
begin

declare booked int;
set booked = (
		select count(*) from bookings 
		where BookingDate = date and TableNumber = tableno);

start transaction;

insert into bookings(BookingDate, TableNumber) values (date, tableno);

if booked > 0 then
	select concat("Table ", tableno, " is already booked - booking cancelled") as "Booking Status";
	rollback;
	else
	select concat("Table ", tableno, " is not booked - booking added") as "Booking Status";
	commit;	
end if;
end\\
delimiter ;
