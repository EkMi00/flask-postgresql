//projection
select distinct eNumber,fNumber from assigned

//selection
select * from employee where salary < 100000

select * from employee where salary > 100000 and name <> 'Gates'

//union,intersection,and difference
create table plane1(
maker varchar(10),
mNumber varchar(10))

insert into plane1 values ('Airbus','A310')
insert into plane1 values ('Airbus','A320')
insert into plane1 values ('Airbus','A330')
insert into plane1 values ('Boeing','B747')
insert into plane1 values ('Boeing','B757')

create table plane2(
maker varchar(10),
mNumber varchar(10))

insert into plane2 values ('Airbus','A330')
insert into plane2 values ('Airbus','A340')
insert into plane2 values ('Boeing','B727')
insert into plane2 values ('Boeing','B747')
insert into plane2 values ('MD','DC10')
insert into plane2 values ('MD','DC9')

select * from plane1
union
select * from plane2

select * from plane1
intersect
select * from plane2

select * from plane1
except
select * from plane2

//cartesian product
select * from canFly,plane

//join
select * from canFly c, plane p
where c.mNumber=p.mNumber

//renaming
select name, salary as wages, eNumber from employee

//example 1
select name,mNumber
from employee,canFly
where employee.eNumber=canFly.eNumber

//example 2
select eNumber
from canFly,plane
where canFly.mNumber=plane.mNumber and maker='Airbus'

//emample 3
select eNumber
from canFly,plane
where canFly.mNumber=plane.mNumber and (maker='Airbus' or maker='MD')

//example 4
select eNumber
from canFly,plane
where canFly.mNumber=plane.mNumber and maker='Airbus'
intersect
select eNumber
from canFly,plane
where canFly.mNumber=plane.mNumber and maker='MD'

//example 5 aggregation
select employee.name 
from canFly c1, canFly c2,employee
where c1.eNumber=employee.eNumber and c2.eNumber=employee.eNumber and c1.mNumber <> c2.mNumber

select employee.name
from canFly,employee
where employee.eNumber=canFly.eNumber
group by employee.eNumber,employee.name
having count(*)>=2

//example 6 division

SELECT DISTINCT c1.eNumber
FROMcanFly c1
WHERE NOT EXISTS(
	SELECT *
	FROM plane p
	WHERE p.maker='MD' AND NOT EXISTS(
		 SELECT * 
		FROM canFly c2
		 WHERE c1.eNumber=c2.eNumber 
			AND p.mNumber=c2.mNumber))


select DISTINCT c1.eNumber
from canFly c1
where not exists(
select *
from plane p
where p.maker='MD' and not exists (
select * from canFly c2
where c1.eNumber=c2.eNumber and p.mNumber=c2.mNumber))\







