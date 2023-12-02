drop procedure if exists AddBooking;
delimiter \\
create procedure AddBooking(id int, customer int, tableno int, date date) 
begin
insert into bookings (BookingID, TableNumber, BookingDate, CustomerId) values (id, tableno, date, customer); 
select "New booking added" as Confirmation;
end\\
delimiter ;