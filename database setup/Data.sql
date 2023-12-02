use littlelemondb;


INSERT INTO menuitems (ItemID, CourseName, StarterName, DesertName, DrinkName)
VALUES
(1, 'Greek salad','Olives','Greek Yogurt', 'Athens White Wine'),
(2, 'Kabasa','Falafel','Ice Cream', 'Anarka White Wine'),
(3, 'Greek salad','Hummus','Cheesecake', 'Athens White Wine'),
(4, 'Kabasa','Flatbread','Greek Yogurt', 'Anarka White Wine'),
(5, 'Carbonara','Olives','Ice Cream', 'Roma Red Wine'),
(6, 'Beansoup','Tomato Bream', 'Cheesecake', 'Corfu Red Wine'),
(7, 'Cabonara','Tomato Bread','Affogato', 'Italian Coffe'),
(8, 'Bean Soup','Olives','Ice Cream', 'Roma Red Wine'),
(9, 'Meatballs','Fries','Cheescake', 'Corfu Red Win'),
(10, 'Shwarma','Flatbread','Turkish Yogurt', 'Turkish Coffee'),
(11, 'Bruschetta','Olives','Ice Cream', 'Athens White Wine'),
(12, 'Potato Salad','Hummus','Turkish Yogurt', 'Turkish Coffee'),
(13, 'Potato Salad','Olives','Cheesecake', 'Roma Red Wine');


INSERT INTO menu (MenuID,ItemID,Name,Cuisine)
VALUES
(1, 1, 'Moussaka', 'Greek'),
(2, 7, 'Papoutsakia', 'Greek'),
(3, 10, 'Pastitsio', 'Greek'),
(4, 3, 'Pizza', 'Italian'),
(5, 9, 'Spagehtti', 'Italian'),
(6, 12, 'Risotto', 'Italian'),
(7, 5,'Manti', 'Turkish'),
(8, 11, 'Lahmacun', 'Turkish'),
(9, 13, 'Menemen', 'Turkish');



INSERT INTO customer (CustomerID, FullName, ContactNumber, Email)
VALUES
(1, 'Anna Iversen', '555-553', 'Anna@email.com'),
(2, 'Joakim Iversen', '550-552', 'Joakim@email.com'),
(3, 'Vanessa McCarthy', '550-553','Vanessa@email.com'),
(4, 'Marcos Romero', '550-3344', 'Marcos@email.com'),
(5, 'Hiroki Yamane', '555-7776', 'Hiroki@email.com'),
(6, 'Diana Pinto', '555-0033', 'Diana@email.com');



INSERT INTO bookings (BookingID, TableNumber, BookingDate, CustomerID, StaffID)
VALUES
(1, 5, '2022-10-10', 1, 01),
(2, 3, '2022-11-12', 2, 05),
(3, 2, '2022-10-11', 3, 02),
(4, 2, '2022-10-13', 1, 06),
(5, 1, '2022-10-15', 5, 01),
(6, 1, '2022-10-14', 6, 02);


INSERT INTO orders (OrderID, OrderDate, Quantity, TotalCost, DeliveryID, CustomerID, MenuID)
VALUES
(1, '2022-09-10', 1, 50, 1, 1, 2),
(2, '2022-10-11', 2, 150, 2, 3, 3),
(3, '2022-10-12', 2, 100, 3, 5, 6),
(4, '2022-10-13', 3, 200, 4, 4, 9),
(5, '2022-11-01', 5, 175, 5, 6, 8);


INSERT INTO delivery_status (DeliveryID, DeliveryDate, DeliveryStatus)
VALUES
(1, '2022-09-10', 'ARRIVED'),
(2, '2022-10-11', 'ARRIVED'),
(3, '2022-10-12', 'ARRIVED'),
(4, '2022-10-13', 'IN ROUTE'),
(5, '2022-10-01', 'IN ROUTE');

INSERT INTO staff (StaffID, Name, Role, Salary)
VALUES
(01,'Mario Gollini','Manager','$70,000'),
(02,'Adrian Gollini','Assistant Manager','$65,000'),
(03,'Giorgos Dioudis','Head Chef','$50,000'),
(04,'Fatma Kaya','Assistant Chef','$45,000'),
(05,'Elena Salvai','Head Waiter','$40,000'),
(06,'John Millar','Receptionist','$35,000');