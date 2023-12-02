select o.OrderID, o.TotalCost, 
	c.CustomerID, c.FullName, 
	m.Name, mi.CourseName, mi.StarterName
	from orders o
	join customer c on c.CustomerID = o.CustomerID
	join menu m on m.MenuID = o.MenuID
	join menuitems mi on mi.ItemID = m.ItemID
	where o.TotalCost > 150
	order by o.TotalCost;