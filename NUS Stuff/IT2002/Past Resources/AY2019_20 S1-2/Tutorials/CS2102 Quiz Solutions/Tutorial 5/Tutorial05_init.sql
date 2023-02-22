drop table if exists pizzas cascade;
drop table if exists customers cascade;
drop table if exists restaurants cascade;
drop table if exists contains;
drop table if exists sells;
drop table if exists likes;


create table pizzas (
pizza varchar(20) primary key
);

create table customers (
cname varchar(20) primary key,
area varchar(20)
);

create table restaurants (
rname varchar(20) primary key,
area varchar(20)
);

create table contains (
pizza varchar(20) references pizzas,
ingredient varchar(20),
primary key (pizza, ingredient)
);

create table sells (
 rname varchar(20) references restaurants,
 pizza varchar(20) references pizzas,
 price numeric(4,2),
 primary key (rname, pizza)
);
 
create table likes (
cname varchar(20) references customers,
pizza varchar(20) references pizzas,
primary key (cname, pizza)
);


insert into pizzas values 
('pepperoni'), ('magerihita'), ('hawaiian'), ('super supreme'), ('curry chicken');

insert into customers values 
('customer1', 'north'), ('customer2', 'north'),
('customer3', 'north'), ('customer4', 'north'),
('customer5', 'north'), ('customer6', 'north');

insert into restaurants values 
('restaurant1', 'East'), ('restaurant2', 'Central'),
('restaurant3', 'East'), ('restaurant4', 'Central'),
('restaurant5', 'East'), ('restaurant6', 'North');

insert into contains values
('pepperoni', 'thin crust'), ('pepperoni', 'beef pepperoni'), 
('magerihita', 'leaves'), ('magerihita', 'thick crust'), ('magerihita', 'parmesan cheese'), 
('hawaiian', 'pineapple'),
('super supreme', 'assortment'), 
('curry chicken', 'chicken'),
('curry chicken', 'curry');


insert into sells values 

('restaurant1', 'pepperoni', 15.7),
('restaurant1', 'super supreme', 21.3),
('restaurant4', 'hawaiian', 31.1),
('restaurant6', 'curry chicken', 9.2),
('restaurant6', 'magerihita', 0.26);

insert into likes values
('customer1', 'pepperoni'), ('customer1', 'magerihita'),
('customer2', 'hawaiian'),
('customer5', 'curry chicken'),
('customer6', 'curry chicken'),
('customer4', 'curry chicken');




drop table if exists students cascade;
drop table if exists presenters;


CREATE TABLE Students (  
sid      integer PRIMARY KEY, 
name     varchar(50) NOT null
);

CREATE TABLE Presenters ( 
week     integer CHECK (week > 0),
qnum     integer NOT NULL CHECK (qnum > 0),
sid      integer REFERENCES Students (sid), 
PRIMARY KEY (week, sid)
);

insert into students values
(1, 'student 1'), (2, 'student 2'), (3, 'student 3'), 
(4, 'student 4'), (5, 'student 5'), (6, 'student 6'),
(7, 'student 7'), (8, 'student 8'), (9, 'student 9'),
(10, 'student 10'), (11, 'student 11'), (12, 'student 12'),
(13, 'student 13'), (14, 'student 14'), (15, 'student 15');


insert into presenters(week, qnum, sid) values 
(1, 1, 1), (1, 2, 2), (1, 1, 3),
(2, 1, 4), (2, 1, 5), (2, 2, 6), (2, 3, 7),
(3, 1, 8),
(4, 1, 9), (4, 2, 10), (4, 3, 11), (4, 3, 1), (4, 4, 2), (4, 3, 7),
(5, 1, 12), (5, 2, 13), (5, 2, 14);


