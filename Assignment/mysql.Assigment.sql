create database if not exists MarketCo;
use MarketCo;


#_ 1...... 
 
create table Contact(
contact_id int primary key,
company_id int not null unique,
first_name varchar(45),
last_name varchar(45),
street varchar(45),
city varchar(45),
state varchar(2),
zip varchar(10),
ismain boolean,
Email varchar(45),
phone varchar(12));

INSERT INTO Contact (
) VALUES
(1, 10, 'Dianne', 'Connor', '123 Elm St', 'Philadelphia', 'PA', '19106', TRUE, 'dianne.connor@toll.com', '215-555-1111'),
(2, 20, 'Robert', 'Brown', '234 Oak St', 'Philadelphia', 'PA', '19107', TRUE, 'robert.brown@uo.com', '215-555-2222'),
(3, 30, 'Jack', 'Lee', '150 Oak St', 'Ahemdabad', 'GJ', '19108', TRUE, 'jack.lee@gmail.com', '215-255-1211'),
(4, 40, 'Vishal', 'Fulwari', '250 Elm St', 'Barmer', 'RJ', '19109', FALSE, 'vishalfulwari@gmail.com', '218-552-9182'),
(5, 50, 'Rajesh', 'Josh', '153 Oak St', 'Deesa', 'GJ', '19200', TRUE, 'rajeshjosh@gmail.com', '287-001-9663'),
(6, 60, 'Devika', 'Lekh', '148 Elm St', 'Patna', 'PA', '19201', FALSE, 'devikalekh@gmail.com', '245-182-6563'),
(7, 70, 'Prena', 'Riks', '152 Oak St', 'Surat', 'GJ', '19202', FALSE, 'prenariks@gmail.com', '652-255-3692');

select * from contact;

#_ 2...... 
 
create table Employee(
Employee_id int primary key,
first_name varchar(45),
last_name varchar(45),
salary decimal(10,2),
Hire_date date,
job_title varchar(25),
Email varchar(45),
phone varchar(12)
);

insert into employee(
) values
(101, 'Jack', 'Lee', 55000.00, '2022-05-01', 'Sales Rep', 'jack.lee@company.com', '215-555-3333'),
(102, 'Lesley', 'Bland', 60000.00, '2021-03-15', 'Manager', 'lesley.bland@company.com', '215-555-4444'),
(103, 'Densh' , 'John', 54000.00, '2024-04-21', 'Hr' , 'densh.john@gmail.com' , '255-988-4532'),
(104, 'Komal' , 'Kok' , 48000.00 , '2025-08-14', 'Accountant' , 'komal.kok@gmail.com', '455-966-553'),
(105, 'Palk' , 'Varma' , 72000.00, '2025-06-25' , 'Desiginer' , 'palkvarma@gmail.com', '544-911-9865'),
(106, 'Devak' , 'pol' , 81000.00, '2023-07-28', 'manager' , 'devak.pol@gmail.com' , '455-012-6882');

select * from employee;


#_ 3....... 

create table Contact_Employee(
contactEmployee_id int primary key,
contact_id int ,
employee_id int,
contact_date date,
Description varchar(100),
foreign key(contact_id) references contact(contact_id),
foreign key(Employee_id) references Employee(Employee_id)
);

insert into contact_Employee(
) values
(1001, 1, 101, '2023-08-10', 'Discussed partnership'),
(1002, 2, 102, '2023-09-12', 'Scheduled product demo'),
(1003, 3, 103, '2024-04-15', 'Discussed partnership'),
(1004, 4, 104, '2025-01-21', 'scheduled product demo'),
(1005, 5, 105, '2022-05-11', 'scheduled product demo'),
(1006, 6, 106, '2024-11-25', 'Discuseed partnership');

select * from contact_Employee;

----- . 
create table Company(
Company_id int,
Company_name varchar(45),
street varchar(45),
city varchar(45),
state varchar(2),
zip varchar(10),
foreign key(company_id) references Contact(Company_id));

insert into Company(
) values
(10, 'Toll Brothers', '100 Main St', 'Philadelphia', 'PA', 19106),
(20, 'Urban Outfitters, Inc.', '200 Market St', 'Philadelphia', 'PA', 19107),
(30, 'TCS', '101 main st', 'Ahemdabad', 'GJ', 19108),
(40, 'Reliance industr', '201 market st', 'Barmer', 'RJ', 19109),
(50, 'HDFC bank' , '205 market st' , 'Deesa' , 'GJ', 19200),
(60, 'ICICI bank', '105 main sat' , 'Jaipur', 'RJ', 19201),
(70, 'TATA stile' , '108 main st', 'Jamngar', 'GJ', 19202);

select * from company;

set sql_safe_updates=0;

#_ 4....... 

UPDATE Employee
SET phone = '215-555-8800'
WHERE first_name = 'Lesley' AND last_name = 'Bland';

#_5...... 

update company
set company_name = "Urban Outfitters"
where company_name = 'Urban Outfitters, Inc.';

#_6........ 

DELETE FROM Contact_Employee
WHERE contactEmployee_id = 1001;


#_7...... 
select 
e.first_name,
e.last_name
from contact_Employee ce
inner join employee e
on ce.employee_id = e.employee_id
inner join contact c 
on ce.contact_id = c.contact_id
inner join company co 
on c.company_id = co.company_id
where co.company_name = 'Toll Brothers';




#_8.... What is the significance of “%” and “_” operators in the LIKE statement?

#_.ans....  
    ---    "%"   :  the % is used to match any number of characters in a string.   
    ---    "-"   :  it can be used to match a single character at a specific position in a string
    ---   LIKE   :   in sql, the like statement is used to search for a specified pattern in a column. 
    

#_9.... Explain normalization in the context of databases.

  #_ans....
	     -- Normalization in databases is the process of organizing data to minimize data redundancy and dependency. It involves dividing large tables into smaller ones while linking them through relationships. The goal is to ensure that each piece of data is stored in one place and one place only, making it easier to maintain and update.

    
    
#_10..... What does a join in MYSQL mean?
  
  #_ans.....  a join in mysql  is used to combine rows from two or more tables based on a related column bwtween them. the result is a set of rows that contain columns from both tables.
  
  


#_11..... 19. what do you understand about DDL,DCL, and DML in MYSQL?

   #_ans..... 
     ----- DDL (Data Definition Language)
		   --    used to define the structure of a database, including creating, altering, and dropping tables. 
           
	------ DCL (Data Control Language)
           --   used to control access to a database, including granting and revoking permission.
           
    ------ DML ( Data Manipulation Language)
           --  used to manipulate data in a database, including inserting, updating, and deleting data.
           
           
  
#_12....... what is the role of the MYSQL JOIN clause in a query. and what are some common types of joins?

	#_ans.... 
            -- The MYSQL JoIN clause is used to combine row from two or more tables based on a related column between them.
            -- common 4 types of joins include
            
         ----- 1. INNER JOIN :   Returns records that have matching values in both tables
         
         ----- 2. LEFT JOIN :    Returns all recorders from the left table and the matched records from the right table,if there are not matches,the result will contain NULL values. 
         
         ----- 3. RIGHT JOIN :   Returns all recorders from the right table and the matched records from the left table. 
         
         ----- 4. FULL JOIN  :   Returns all records from both tables, with NULL values in the columns where there are not matches. 
              


