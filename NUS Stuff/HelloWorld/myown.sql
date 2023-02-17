CREATE TABLE IF NOT EXISTS meals(meal_name VARCHAR(20));
CREATE TABLE IF NOT EXISTS drinks(drink_name VARCHAR(20));
CREATE TABLE IF NOT EXISTS dessert(
    dessert_name VARCHAR(20),
    flavor VARCHAR(20)
);

DROP TABLE dessert;
DROP TABLE meals;
DROP TABLE drinks;

DELETE FROM dessert;
DELETE FROM meals;
DELETE FROM drinks;

INSERT INTO drinks VALUES('Orange Juice'), ('Tea'), ('Cofee');
INSERT INTO meals VALUES('Omelet'), ('Tea'), ('Sausage');
INSERT INTO dessert VALUES('Ice-cream', 'Chocolate');
INSERT INTO dessert VALUES('Cake', 'Strawberry');
INSERT INTO dessert VALUES('Fruit', 'Grapes');

SELECT *
FROM drinks;
SELECT *
FROM meals;
SELECT *
FROM dessert;

SELECT *
FROM meals, drinks, dessert
WHERE meals.meal_name = drinks.drink_name;


CREATE TABLE [dbo].[PizzaCompany]
(
  [CompanyId] [int] IDENTITY(1,1) PRIMARY KEY CLUSTERED,
  [CompanyName] [varchar](50) ,
  [CompanyCity] [varchar](30)  
)
SET IDENTITY_INSERT [dbo].[PizzaCompany] ON;
INSERT INTO [dbo].[PizzaCompany] ([CompanyId], [CompanyName], [CompanyCity]) VALUES(1,'Dominos','Los Angeles') ;
INSERT INTO [dbo].[PizzaCompany] ([CompanyId], [CompanyName], [CompanyCity]) VALUES(2,'Pizza Hut','San Francisco') ;
INSERT INTO [dbo].[PizzaCompany] ([CompanyId], [CompanyName], [CompanyCity]) VALUES(3,'Papa johns','San Diego') ;
INSERT INTO [dbo].[PizzaCompany] ([CompanyId], [CompanyName], [CompanyCity]) VALUES(4,'Ah Pizz','Fremont') ;
INSERT INTO [dbo].[PizzaCompany] ([CompanyId], [CompanyName], [CompanyCity]) VALUES(5,'Nino Pizza','Las Vegas') ;
INSERT INTO [dbo].[PizzaCompany] ([CompanyId], [CompanyName], [CompanyCity]) VALUES(6,'Pizzeria','Boston') ;
INSERT INTO [dbo].[PizzaCompany] ([CompanyId], [CompanyName], [CompanyCity]) VALUES(7,'chuck e cheese','Chicago') ;
 
SELECT * FROM PizzaCompany;

CREATE TABLE [dbo].[Foods]
(
[ItemId] INT  PRIMARY KEY CLUSTERED , 
 [ItemName]  Varchar(50), 
 [UnitsSold] int,
 CompanyID int,
 FOREIGN KEY(CompanyID) REFERENCES PizzaCompany(CompanyID)
 )
INSERT INTO [dbo].[Foods] ([ItemId], [ItemName], [UnitsSold], [CompanyId]) VALUES(1,'Large Pizza',5,2)
INSERT INTO [dbo].[Foods] ([ItemId], [ItemName], [UnitsSold], [CompanyId]) VALUES(2,'Garlic Knots',6,3)
INSERT INTO [dbo].[Foods] ([ItemId], [ItemName], [UnitsSold], [CompanyId]) VALUES(3,'Large Pizza',3,3)
INSERT INTO [dbo].[Foods] ([ItemId], [ItemName], [UnitsSold], [CompanyId]) VALUES(4,'Medium Pizza',8,4)
INSERT INTO [dbo].[Foods] ([ItemId], [ItemName], [UnitsSold], [CompanyId]) VALUES(5,'Breadsticks',7,1)
INSERT INTO [dbo].[Foods] ([ItemId], [ItemName], [UnitsSold], [CompanyId]) VALUES(6,'Medium Pizza',11,1)
INSERT INTO [dbo].[Foods] ([ItemId], [ItemName], [UnitsSold], [CompanyId]) VALUES(7,'Small Pizza',9,6)
INSERT INTO [dbo].[Foods] ([ItemId], [ItemName], [UnitsSold], [CompanyId]) VALUES(8,'Small Pizza',6,7)
 
SELECT * FROM Foods;