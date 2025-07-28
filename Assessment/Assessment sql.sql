create database if not exists working;
use working;


create table worker(
workar_id int primary key,
first_name varchar(50),
last_name varchar(50),
salary int,
joining_date datetime ,
department varchar(50));

insert into worker(
) values
(1, 'Monika', 'Arora', 100000, '2014-02-20 09:00:00', 'HR'),
(2, 'Niharika', 'Verma', 80000, '2014-06-11 09:00:00', 'Admin'),
(3, 'Vishal', 'Singhal', 300000, '2014-02-20 09:00:00', 'HR'),
(4, 'Amitabh', 'Singh', 500000, '2014-02-20 09:00:00', 'Admin'),
(5, 'Vivek', 'Bhati', 500000, '2014-06-11 09:00:00', 'Admin'),
(6, 'Vipul', 'Diwan', 200000, '2014-06-11 09:00:00', 'Account'),
(7, 'Satish', 'Kumar', 75000, '2014-01-20 09:00:00', 'Account'),
(8, 'Geetika', 'Chauhan', 90000, '2014-04-11 09:00:00', 'Admin');

select * from worker;


-- 1. 
select * from worker
order by first_name asc, department desc;


--- 2. 
select * from worker
where first_name in ('Vipul' , 'Satish');


--- 3. 
select * from worker
where first_name like '_____h';


---- 4. 
select * from worker
where salary between 1 And 100000;


---- 5. 
select first_name, salary, count(workar_id)
from worker
group by first_name, salary
having count(workar_id) > 1;


--- 6. 
select * from worker
order by salary desc
limit 6;


--- 7. 
select department, count(workar_id) 
from worker
group by department
having count(workar_id) < 5;


--- 8. 
select department, count(workar_id)
from worker
group by department;


--- 9. 
select first_name, last_name, salary, department
from worker
order by salary desc
limit 1;




------ secound (2)------------------------------------------------------------------------------------------------



create database if not exists school;
use school;

create table student(
std_id int primary key,
std_name varchar(50),
sex varchar(10),
percentage int,
Class int,
sec varchar(2),
stream varchar(50),
dob date );

insert into student (
) values
(1001, 'Surekha Joshi', 'Female', 82, 12, 'A', 'Science', '1998-03-08'),
(1002, 'MAAHI AGARWAL', 'Female', 90, 11, 'C', 'Commerce', '2008-11-23'),
(1003, 'Sanam Verma', 'Female', 89, 11, 'C', 'Commerce', '2006-06-29'),
(1004, 'Ronit Kumar', 'Male', 63, 11, 'C', 'Commerce', '1997-05-11'),
(1005, 'Dipesh Pulkit', 'Male', 78, 11, 'B', 'Science', '2003-09-14'), 
(1006, 'JAHANVI Puri', 'Female', 60, 11, 'B', 'Science', '2008-07-11'),
(1007, 'Sanam Kumar', 'Male', 73, 11, 'B', 'Commerce', '1998-03-08'),
(1008, 'SAHIL SARAS', 'Male', 63, 11, 'C', 'Commerce', '2008-11-07'),
(1009, 'AKSHRA AGARWAL', 'Female', 70, 11, 'C', 'Science', '1996-10-01'),
(1010, 'STUTI MISHRA', 'Female', 89, 11, 'F', 'Science', '2008-11-23'),
(1011, 'HARSH AGARWAL', 'Male', 42, 11, 'C', 'Science', '1998-03-08'),
(1012, 'NIKUNJ AGARWAL', 'Male', 49, 12, 'A', 'Science', '1998-06-23'),
(1013, 'AKRITI SAXENA', 'Female', 89, 12, 'A', 'Science', '2008-11-23'),
(1014, 'TANI RASTOGI', 'Female', 82, 12, 'A', 'Science', '2008-11-23');




----

--- 1. 
select * from student;



--- 2. 
select std_name,dob from student;


---- 3. 
select * from student
where  percentage >= 80;


--- 4. 
select std_name,stream,percentage
from student
where percentage > 80;



--- 5. 
select * from student
where percentage > 75 and stream = 'science';








