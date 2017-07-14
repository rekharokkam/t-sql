/*
	Trigger - Database Object - That does some Update when an INSERT, UPDATE, DELETE are performed on a table
*/

drop sequence OrderSqe

drop trigger WhoWhen
drop trigger WhoWhenUpdate

drop table Orders

Create table Orders
(
	OrderId int PRIMARY KEY,
	Name varchar (20) not null,
	Qty int not null,
	Created_by int,
	Created_date smalldatetime,
	Modified_by int,
	Modified_date smalldatetime
)

Create SEQUENCE OrderSqe
	START WITH 100 -- Starting Number
	INCREMENT by 2
GO

CREATE TRIGGER WhoWhenInsert ON Orders  
AFTER INSERT AS  
BEGIN
	UPDATE Orders set Created_by = 2001, Created_date = GETDATE()
	from Orders o
	join inserted i on i.OrderId = o.OrderId
END

CREATE TRIGGER WhoWhenUpdate ON Orders  
AFTER UPDATE AS  
BEGIN
	UPDATE Orders set Modified_by = 2002, Modified_date = GETDATE()
	from Orders o
	join inserted i on i.OrderId = o.OrderId
END

INSERT Orders (OrderID, Name, Qty)  
    VALUES (NEXT VALUE FOR OrderSqe, 'Tire', 2) ,
    (NEXT VALUE FOR OrderSqe, 'Seat', 1) ,
    (NEXT VALUE FOR OrderSqe, 'Brake', 1) ;  

select * from Orders

Update Orders set Name = 'Junky'  where OrderId = 100

select * from Orders