<h1><strong>Little Lemon Database Project</strong></h1>

<h2>About the Project</h2>
<p>The goal of this project is to help a resturant named Little Lemon set up a database system for data storage and analysis. First, the database will be set up using MySQL Workbench and a ER diagram. After that, SQL will be used to create queries such as a virtual table and stored procedures for reports and analysis of the data, followed by the creation of a booking system for Little Lemon using SQL queries, transactions, and stored procedures. Then we wil create a database client using python and MySQL connector to create access to the database for a python based application. Lastly, we will visualize the data with the help of Tableau to gain further insights.</p>


<h2>Setting Up the Database</h2>
<p>Using the Entity-Relationship diagram feature of MySQL, we need to create a relational database with these five aspects in mind: booking, orders, delivery status, menu, customer details, and staff information. The results are:</p>

![LittleLemonDM](https://github.com/Mbunns/Little-Lemon-DB/assets/152339523/5f60ab2b-7a92-449a-adfa-56ceb541c8d8)

<p>The foward engineering feature in MYSQL will allow us create the database from the ER diagram.</p>

<h2>SQL Queries for Reports and Analysis</h2>
<p>These SQL queries will focus around providing fuctionality for future sales reports using the Litlle Lemon database.</p>

<h3>OrdersView Virtual Table</h3>

```sql
create view OrdersView as (select OrderId, Quantity, TotalCost from orders where Quantity > 2);
```

<h3>Join Statement</h3>

```sql
select o.OrderID, o.TotalCost, 
c.CustomerID, c.FullName, 
m.Name, mi.CourseName, mi.StarterName
from orders o
join customer c on c.CustomerID = o.CustomerID
join menu m on m.MenuID = o.MenuID
join menuitems mi on mi.ItemID = m.ItemID
where o.TotalCost > 150
order by o.TotalCost;

```

<h3>Subquery</h3>

```sql
select Name from menu where MenuId=any (select MenuID from orders where Quantity>2);
```

<h3>GetMaxQuantity</h3>

```sql
create procedure GetMaxQuantity() select max(Quantity) as "Max Quantity in Order" from orders;
```

<h3>GetOrderDetail</h3>

```sql
prepare GetOrderDetail from 'select OrderID, Quantity, TotalCost from orders where CustomerID=?';
```

<h3>CancelOrder</h3>

```sql
drop procedure if exists CancelOrder;
delimiter \\
create procedure CancelOrder(Orderid int) 
begin
delete from Orders where OrderID=Orderid;
select concat("Order ", OrderID, " is cancelled") as Confirmation;
end\\
delimiter ;
```

<h2>Table Booking System</h2>
<p>This booking system will use sql queries to allow Little Lemon to perform basic task such as adding a booking, canceling a booking, and so on.</p>

<h3>CheckBooking</h3>

```sql
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
```
<h3>AddBooking</h3>

```sql
drop procedure if exists AddBooking;
delimiter \\
create procedure AddBooking(id int, customer int, tableno int, date date) 
begin
insert into bookings (BookingID, TableNumber, BookingDate, CustomerId) values (id, tableno, date, customer); 
select "New booking added" as Confirmation;
end\\
delimiter ;
```

<h3>AddValidBooking</h3>

```sql
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
```

<h3>UpdateBooking</h3>

```sql
drop procedure if exists UpdateBooking;
delimiter \\
create procedure UpdateBooking(id int, date date) 
begin
update bookings set BookingDate = date where BookingID = id;
select concat("Booking ", id, " updated") as "Confirmation";
end \\
delimiter ;

```

<h3>CancelBooking</h3>

```sql
drop procedure if exists CancelBooking;
delimiter \\
create procedure CancelBooking(id int) 
begin
delete from bookings where BookingID = id;
select concat("Booking ", id, " cancelled") as "Confirmation";
end\\
delimiter ;
```

<h2>Database Client</h2>
<p>Here we added a database client that can access the Little Lemon database to perform tasks using a python based applications. 
For this we are using MySQL connector, a client that allows us to connect to the Little Lemon database that is in a MySQL server.
Using MySQL connector, we can create a cursor in python that we then use to execute SQL queries in the form of strings.
</p>

[This database client can be viewed in the repository.](https://github.com/Mbunns/Little-Lemon-DB/blob/master/littlelemonclient.ipynb)

<h2>Data Visualization</h2>
<p>Here we have created 5 different visualizations using Tableau.</p>

<h3>Customer Sales</h3>
<p>A customer sales bar chart with filters that shows only sales that atleast $70.</p>

![alt text](https://github.com/Mbunns/Little-Lemon-DB/blob/master/tableau-images/customer-sales.jpg?raw=true)

<h3>Profit Chart</h3>
<p>A profit line chart that shows the sales trend from 2019-2022.</p>

![alt text](https://github.com/Mbunns/Little-Lemon-DB/blob/master/tableau-images/profit-chart.jpg?raw=true)


<h3>Sales Bubble Chart</h3>
<p>A sales bubble chart that shows all the names of the customers, their sales, and the profit.</p>

![alt text](https://github.com/Mbunns/Little-Lemon-DB/blob/master/tableau-images/sales-bubble-chart.jpg?raw=true)

<h3>Cuisine Sales and Profits</h3>
<p>A sales and profit bar chart that compares three different cuisines at Little Lemon.</p>

![alt text](https://github.com/Mbunns/Little-Lemon-DB/blob/master/tableau-images/cuisine-sales-profits.jpg?raw=true)


<h3>Dashboard</h3>
<p>An interactive dashboard that displays both the customer sales bar chart and the sales bubble chart.</p>

![alt text](https://github.com/Mbunns/Little-Lemon-DB/blob/master/tableau-images/dashboard.jpg?raw=true)


