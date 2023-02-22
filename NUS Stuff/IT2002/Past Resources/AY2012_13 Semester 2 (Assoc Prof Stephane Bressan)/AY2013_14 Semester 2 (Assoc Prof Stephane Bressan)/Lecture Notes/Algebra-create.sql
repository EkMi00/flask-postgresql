
create table employee(
name varchar(10) PRIMARY KEY,
salary int,
eNumber int)

insert into employee values ('Clark',150000,1006)
insert into employee values ('Gates',5000000,1005)
insert into employee values ('Jones',50000,1001)
insert into employee values ('Peter',45000,1002)
insert into employee values ('Phillips',25000,1004)
insert into employee values ('Rowe',35000,1003)
insert into employee values ('Warnock',500000,1007)


create table plane(
maker varchar(10),
mNumber varchar(10))

insert into plane values ('Airbus','A310')
insert into plane values ('Airbus','A320')
insert into plane values ('Airbus','A330')
insert into plane values ('Airbus','A340')
insert into plane values ('Boeing','B727')
insert into plane values ('Boeing','B747')
insert into plane values ('Boeing','B757')
insert into plane values ('MD','DC10')
insert into plane values ('MD','DC9')


create table canFly(
eNumber int,
mNumber varchar(10))

insert into canFly values (1001,'B727')
insert into canFly values (1001,'B747')
insert into canFly values (1001,'DC10')
insert into canFly values (1002,'A320')
insert into canFly values (1002,'A340')
insert into canFly values (1002,'B757')
insert into canFly values (1002,'DC9')
insert into canFly values (1003,'A310')
insert into canFly values (1003,'DC9')
insert into canFly values (1003,'DC10')


create table assigned(
eNumber int,
dat varchar(10),
fNumber int)

insert into assigned values(1001,'Nov-1',100)
insert into assigned values(1001,'Oct-31',100)
insert into assigned values(1002,'Nov-1',100)
insert into assigned values(1002,'Oct-31',100)
insert into assigned values(1003,'Oct-31',100)
insert into assigned values(1003,'Oct-31',337)
insert into assigned values(1004,'Oct-31',337)
insert into assigned values(1005,'Oct-31',337)
insert into assigned values(1006,'Nov-1',991)
insert into assigned values(1006,'Oct-31',337)


select * from assigned
select * from canFly
select * from plane
select * from employee
