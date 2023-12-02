drop procedure if exists CancelBooking;
delimiter \\
create procedure CancelBooking(id int) 
begin
delete from bookings where BookingID = id;
select concat("Booking ", id, " cancelled") as "Confirmation";
end\\
delimiter ;