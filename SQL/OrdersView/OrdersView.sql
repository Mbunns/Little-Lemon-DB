create view OrdersView as (select OrderId, Quantity, TotalCost from orders where Quantity > 2);