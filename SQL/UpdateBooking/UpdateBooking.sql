drop procedure if exists UpdateBooking;
delimiter \\
create procedure UpdateBooking(id int, date date) 
begin
update bookings set BookingDate = date where BookingID = id;
select concat("Booking ", id, " updated") as "Confirmation";
end \\
delimiter ;