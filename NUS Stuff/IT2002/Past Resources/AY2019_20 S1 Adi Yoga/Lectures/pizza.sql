
DROP TABLE IF EXISTS Likes CASCADE;
DROP TABLE IF EXISTS Sells CASCADE;
DROP TABLE IF EXISTS Contains CASCADE;
DROP TABLE IF EXISTS Customers CASCADE;
DROP TABLE IF EXISTS Restaurants CASCADE;
DROP TABLE IF EXISTS Pizzas CASCADE;

CREATE TABLE Pizzas (
	pizza VARCHAR(50),
	PRIMARY KEY (pizza)
);

CREATE TABLE Restaurants (
	rname VARCHAR(50),
	area VARCHAR(10),
	PRIMARY KEY (rname)
);


CREATE TABLE Customers (
	cname VARCHAR(50),
	area VARCHAR(10),
	PRIMARY KEY (cname)
);

CREATE TABLE Sells (
	rname VARCHAR(50),
	pizza VARCHAR(50),
	price INTEGER,
	PRIMARY KEY (rname,pizza),
	FOREIGN KEY (rname) REFERENCES Restaurants (rname),
	FOREIGN KEY (pizza) REFERENCES Pizzas (pizza)
);

CREATE TABLE Likes (
	cname VARCHAR(50),
	pizza VARCHAR(50),
	PRIMARY KEY (cname,pizza),
	FOREIGN KEY (cname) REFERENCES Customers (cname),
	FOREIGN KEY (pizza) REFERENCES Pizzas (pizza)
);

CREATE TABLE Contains (
	pizza VARCHAR(50),
	ingredient VARCHAR(50),
	PRIMARY KEY (pizza,ingredient),
	FOREIGN KEY (pizza) REFERENCES Pizzas (pizza)
);

INSERT  INTO Pizzas VALUES ('Diavola');
INSERT  INTO Pizzas VALUES ('Funghi');
INSERT  INTO Pizzas VALUES ('Hawaiian');
INSERT  INTO Pizzas VALUES ('Margherita');
INSERT  INTO Pizzas VALUES ('Marinanra');
INSERT  INTO Pizzas VALUES ('Sciliana');

INSERT  INTO Customers VALUES ('Homer','West');
INSERT  INTO Customers VALUES ('Lisa','South');
INSERT  INTO Customers VALUES ('Maggie','East');
INSERT  INTO Customers VALUES ('Moe','Central');
INSERT  INTO Customers VALUES ('Ralph','Central');
INSERT  INTO Customers VALUES ('Willie','North');

INSERT  INTO Restaurants VALUES ('Corleone Corner','North');
INSERT  INTO Restaurants VALUES ('Gambino Oven','Central');
INSERT  INTO Restaurants VALUES ('Lorenzo Tavern','Central');
INSERT  INTO Restaurants VALUES ('Mamma''s Place','South');
INSERT  INTO Restaurants VALUES ('Pizza King','East');

INSERT  INTO Sells VALUES ('Corleone Corner','Diavola',24);
INSERT  INTO Sells VALUES ('Corleone Corner','Hawaiian',25);
INSERT  INTO Sells VALUES ('Corleone Corner','Margherita',19);
INSERT  INTO Sells VALUES ('Gambino Oven','Sciliana',16);
INSERT  INTO Sells VALUES ('Lorenzo Tavern','Funghi',23);
INSERT  INTO Sells VALUES ('Mamma''s Place','Margherita',23);
INSERT  INTO Sells VALUES ('Pizza King','Diavola',17);
INSERT  INTO Sells VALUES ('Pizza King','Hawaiian',21);

INSERT  INTO Likes VALUES ('Homer','Hawaiian');
INSERT  INTO Likes VALUES ('Homer','Margherita');
INSERT  INTO Likes VALUES ('Lisa','Funghi');
INSERT  INTO Likes VALUES ('Maggie','Funghi');
INSERT  INTO Likes VALUES ('Moe','Funghi');
INSERT  INTO Likes VALUES ('Moe','Sciliana');
INSERT  INTO Likes VALUES ('Ralph','Diavola');

INSERT  INTO Contains VALUES ('Diavola','cheese');
INSERT  INTO Contains VALUES ('Diavola','chilli');
INSERT  INTO Contains VALUES ('Diavola','salami');
INSERT  INTO Contains VALUES ('Funghi','ham');
INSERT  INTO Contains VALUES ('Funghi','mushroom');
INSERT  INTO Contains VALUES ('Hawaiian','ham');
INSERT  INTO Contains VALUES ('Hawaiian','pineapple');
INSERT  INTO Contains VALUES ('Margherita','cheese');
INSERT  INTO Contains VALUES ('Margherita','tomato');
INSERT  INTO Contains VALUES ('Marinanra','seafood');
INSERT  INTO Contains VALUES ('Sciliana','anchovies');
INSERT  INTO Contains VALUES ('Sciliana','capers');
INSERT  INTO Contains VALUES ('Sciliana','cheese');

