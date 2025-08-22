create database hospitaldb;
use hospitaldb;
create table doctors (
	doctor_id int primary key auto_increment,
    name varchar(100),
    specialization varchar(100),
    contact_number varchar(10)
);
create table departments (
	department_id int primary key auto_increment,
    department_name varchar(50)
);

create table patients (
	patient_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_name varchar(100),
    name VARCHAR(100),
    gender CHAR(1),
    dob DATE,
    contact_number VARCHAR(15),
    address TEXT
);
create table appointments (
	appointment_id int primary key auto_increment,
    patient_id int,
    patient_name varchar(100),
	doctor_id INT,
    department_id INT,
    appointment_date DATE,
    appointment_time TIME,
    status VARCHAR(20),
    foreign key (patient_id) references patients(patient_id),
    foreign key (doctor_id) references doctors(doctor_id),
    foreign key (department_id) references departments(department_id)
);

CREATE TABLE MedicalRecords (
    record_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    diagnosis TEXT,
    treatment TEXT,
    record_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

CREATE TABLE Billing (
    bill_id INT PRIMARY KEY AUTO_INCREMENT,
    patient_id INT,
    appointment_id INT,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),
    billing_date DATE,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id),
    FOREIGN KEY (appointment_id) REFERENCES Appointments(appointment_id)
);

CREATE TABLE Rooms (
    room_id INT PRIMARY KEY AUTO_INCREMENT,
    room_type VARCHAR(50),
    room_status VARCHAR(20), -- e.g., Occupied, Available
    patient_id INT,
    FOREIGN KEY (patient_id) REFERENCES Patients(patient_id)
);

INSERT INTO Patients (name, gender, dob, contact_number, address) VALUES
('Rahul Sharma', 'M', '1980-03-15', '9876543210', '123, MG Road, Mumbai'),
('Priya Singh', 'F', '1992-07-21', '9123456789', '45, Park Street, Kolkata'),
('Anil Kumar', 'M', '1975-12-05', '9988776655', '89, Brigade Road, Bangalore'),
('Sunita Agarwal', 'F', '1988-01-30', '9871122334', '21, Connaught Place, Delhi'),
('Vikram Patel', 'M', '2000-06-12', '9123344556', '56, MG Road, Pune');

INSERT INTO Doctors (name, specialization, contact_number) VALUES
('Dr. Aarti Mehta', 'Cardiology', '9812345678'),
('Dr. Suresh Gupta', 'Neurology', '9823456789'),
('Dr. Neha Joshi', 'Orthopedics', '9834567890'),
('Dr. Rajesh Kumar', 'General Medicine', '9845678901'),
('Dr. Kavita Reddy', 'Pediatrics', '9856789012');

INSERT INTO Departments (department_name) VALUES
('Cardiology'),
('Neurology'),
('Orthopedics'),
('General Medicine'),
('Pediatrics');

INSERT INTO Appointments (patient_id, doctor_id, department_id, appointment_date, appointment_time, status) VALUES
(1, 1, 1, '2025-08-01', '10:00:00', 'Completed'),
(2, 2, 2, '2025-08-02', '11:30:00', 'Scheduled'),
(3, 3, 3, '2025-07-28', '14:00:00', 'Completed'),
(4, 4, 4, '2025-08-03', '09:15:00', 'Cancelled'),
(5, 5, 5, '2025-08-01', '15:45:00', 'Completed'),
(1, 4, 4, '2025-08-10', '13:00:00', 'Scheduled');

INSERT INTO MedicalRecords (patient_id, diagnosis, treatment, record_date) VALUES
(1, 'Hypertension', 'Prescribed medication and lifestyle changes', '2025-08-01'),
(3, 'Fractured arm', 'Cast and physiotherapy', '2025-07-28'),
(5, 'Flu', 'Prescribed antiviral drugs', '2025-08-01');

INSERT INTO Billing (patient_id, appointment_id, amount, payment_status, billing_date) VALUES
(1, 1, 5000.00, 'Paid', '2025-08-01'),
(3, 3, 15000.00, 'Pending', '2025-07-28'),
(5, 5, 2000.00, 'Paid', '2025-08-01'),
(1, 6, 3000.00, 'Pending', '2025-08-10');

INSERT INTO Rooms (room_type, room_status, patient_id) VALUES
('General Ward', 'Occupied', 1),
('ICU', 'Available', NULL),
('Private Room', 'Occupied', 3),
('General Ward', 'Available', NULL),
('Private Room', 'Occupied', 5);





---- 1. 
select patient_names,contact_number
from patients;



---- 2. 
select gender from patients
where gender = 'F' 
and timestampdiff(year, dob, curdate())> 50; 


---- 3. 
SELECT doctor_id, name, specialization
FROM doctors
ORDER BY name DESC;


---- 4. 
select distinct(specialization) from doctors;


---- 5. 
select * from appointments
where appointment_date between '2025-01-01' and '2025-08-01';


------ 6.  
SELECT *
FROM patients
WHERE TIMESTAMPDIFF(YEAR, dob, CURDATE()) IN (25,30,40);


------ 7. 
select patient_id,patient_names
from patients
where patient_names like 'A%';



------ 8. 
SELECT *
FROM appointments
WHERE status IS NULL;


------ 9. 
select b.patient_id,
        b.bill_id,
        b.amount,
        me.treatment
       from billing b
join medicalrecords me
on b.patient_id = me.patient_id
order by b.amount desc limit 5;



------ 10. 
select a.*,
      p.patient_names,
      d.name
      from appointments a
join patients p on a.patient_id = p.patient_id
join doctors d on a.doctor_id = d.doctor_id;



------ 11. 
select d.name,
     d.specialization,
     me.treatment
     from doctors d,medicalrecords me
     where specialization = 'cardiology';
     
     

 ------ 12. 
 select d.doctor_id,d.name as doctor_name, count(a.appointment_id) as count_appointment
 from doctors d
inner join appointments a on d.doctor_id = a.doctor_id 
 group by d.doctor_id,d.name;




------ 13. 
select p.patient_id,p.patient_names,p.address,sum(b.amount) as totla_paid
from patients p
inner join billing b on p.patient_id = b.patient_id 
group by p.patient_id,p.patient_names,p.address;



------- 14. 
select d.doctor_id,d.name,d.specialization,count(appointment_id) as total_appointment
from doctors d 
inner join appointments a on d.doctor_id = a.doctor_id 
group by d.doctor_id,d.name,d.specialization
having count(appointment_id) > 5;


select * from appointments;


------- 15. 
select p.patient_id,p.patient_names,a.status
from patients p
left join appointments a on p.patient_id = a.patient_id;




------- 16. 
select d.doctor_id,d.name,d.specialization,a.appointment_id,p.patient_names
from doctors d 
left join appointments a on d.doctor_id = a.doctor_id 
left join patients p on p.patient_id = a.patient_id;




------ 17. 
select me.patient_id,me.diagnosis,me.treatment,round(avg(b.amount),2) as avg_cost
from medicalrecords me
join billing b on me.patient_id = b.patient_id 
group by me.patient_id,me.diagnosis,me.treatment;



select * from appointments;


------ 18. 
select p.patient_names as patient_name,
       d.name as doctor_name,
        b.amount as total_cost
  from patients p, billing b, doctors d;
  
  
  
 
 ------ 19. 
 select me.diagnosis,me.treatment,b.amount as trans_cost,
 case
  when b.amount < 3000 then "low"
  when b.amount <=10000 then "medium"
  else  "high"
  end as cost_category
  from medicalrecords me,billing b;
  
  
  
 
 ------ 20. 
 select p.patient_id, p.patient_names,
       d.doctor_id,d.name,d.specialization
       from patients p
       join appointments a on p.patient_id = a.patient_id 
       join doctors d on d.doctor_id = a.doctor_id
       where specialization = 'Neurology';
       
       
  
 ----- 21. 
 select p.patient_id,p.patient_names,b.payment_status,
       avg(timestampdiff(year, p.dob,curdate())) as avg_age
       from billing b 
       join patients p on p.patient_id = b.patient_id
       group by p.patient_id,p.patient_names,b.payment_status
       having payment_status = 'paid';
       


 
 ------- 22. 
select doctor_id,name,patient_names,patient_id 
from doctors , patients 
where doctor_id in (select count(distinct(patient_id))  from  patients
group by doctor_id,name,patient_names,patient_id
having count(distinct(patient_id)) > 1);




------ 23. 
select p.patient_id,p.patient_names,b.amount,b.payment_status,
dense_rank() over (partition by patient_names order by amount desc) as denrank_amount
from patients p 
join billing b on p.patient_id = b.patient_id 
where payment_status = 'paid';




-------- 24. 
with totalbill as (
select patient_id,
sum(amount) as total_amount
from billing 
group by patient_id
)
select * from totalbill
where total_amount > 50000;




------ 25. 
delimiter //
create procedure monthly_revenue(in y int, in m int)
begin
select y as year, m as month,
sum(case when payment_status ='paid' then amount else 0 end) as revenue_paid,
sum(amount) as total_billed
from billing
where year(billing_date) = y and month(billing_date) = m;
end//
delimiter ;

call monthly_revenue(2025, 8);
call monthly_revenue(2025, 7);




------ 26. 
select contact_number from doctors
union
select contact_number from patients;




------ 27. 
select status,count(distinct(appointment_id)) as count_appoint
from appointments 
group by status;




------ 28.
create view currenty_month_base_appointments as 
select a.appointment_id,a.appointment_date,a.appointment_time,
p.patient_names,d.name as doctor_name
from appointments a 
join patients p on a.patient_id = p.patient_id
join doctors d on a.doctor_id = d.doctor_id
where year(a.appointment_date) = year(curdate())
and month(a.appointment_date) = month(curdate());




------ 29. 
delimiter //
create trigger trg_paid_insert
before insert on billing
for each row
begin
if nwe.amount > 0 and (nwe.payment_status is null or nwe.payment_status <> 'paid') then
set new.payment_status = 'paid';
end if;
end // 
delimiter ;




#------ 30.
select record_id,patient_id,diagnosis,record_date,
row_number() over (partition by patient_id order by record_date) as row_num
from medicalrecords;



#----- 31
select patient_id,
upper(patient_names) as name_upper,
left(patient_name, 3) as first3
from  patients;


 
 
 ---- 32. 
select me.record_id, me.patient_id, me.patient_id,
datediff(b.billing_date, a.appointment_date) as days_gap
from medicalrecords me
join appointments a on a.patient_id = me.patient_id
left join billing b on b.patient_id = me.patient_id;





------ 33. 
select  appointment_id, patient_id, doctor_id, appointment_date,
   coalesce(status, 'not updated') as status
   from appointments;
 
 
 
 
 ------- 34. 
  select p.patient_names,d.name,a.appointment_id,a.status
  from appointments a
  join patients p on p.patient_id = a.patient_id 
  join doctors d on d.doctor_id = a.doctor_id
  where status = 'completed';
  
  
  
  
 ------- 35. 
 select p.patient_names, d.name as doctor_name, de.department_name,b.amount as cost
 from patients p,doctors d,departments de, billing b ;



------- 36. 
select patient_names, contact_number, count(*) as dup_count
from patients 
group by patient_names, contact_number
having count(*) > 1;





-------- 37. 
delete me
from medicalrecords me
left join appointments a on a.appointment_id = me.appointment_id
where a.appointment_id is null ;





--------- 38. 
update appointments a 
join billing b on b.appointment_id = a.appointment_id
set a.status = 'completed'
where b.payment_status = 'paid';




set sql_safe_updates = 0;

------- 39. 
update billing
set amount = null
where amount < 0;




------- 40. 
show columns from appointments like 'status';




--------- 41. 
start transaction;
update appointments 
set status = 'completed'
where appointment_id = 6;
savepoint succeed;

commit;






-------- 42. 
show index from appointments;






-------- 43. 
select digest_text,
count_star as exec_count,
round(sum_timer_wait/1e12, 6) as total_sec,
round(avg_timer_wait/1e12, 6)as avg_sec
from performance_schema.events_statements_summary_by digest
where digest_text like '%medicalrecords%'
order by avg_timer_wait desc
limit 10;





--------- 44. 
-- patients(patient_id,gender,dob,contact_number,address)
-- doctors(doctor_id, name, specialization, experience_years, contact_number)
-- departments(department_id, department_name)
-- appointments(appointment_id,patient_id,department_id, appointment_date,appointmatetime,status)
-- medicalrecords(record_id,appointment_id,patient_id,diagnosis,treatment,treatment_cost,record_date)
-- billing(bill_id,appointment_id,patient_id,amount,payment_status,billing_date)




------ 45.. When might you combine the billing and treatment tables into one? 
-- combine only if every treatment always generates exactly one bill with the same lifecycle(1:1, same primary key,
-- always together).otherwise keep sparate ( supports partial payments,multiple bills per visit, or adjustments).







--------- 46. 
with avg_cost as(
select patient_id,avg(amount) as avg_amount
from billing
group by patient_id
)
select distinct p.patient_id,
           p.patient_names,
           b.amount
           from billing b
           join avg_cost a on a.avg_amount = b.amount
           join patients p on p.patient_id = b.patient_id
           where b.amount > a.avg_amount;
           
           
           
           
        
--------- 47. 
select d.doctor_id, d.name
from doctors d
where not exists(
select 1
from appointments a
where a.doctor_id = d.doctor_id
and a.appointment_date >= (curdate() - interval 6 month)
);







------- 48. 
select diagnosis, count(*) as cnt
from medicalrecords
group by diagnosis
order by cnt desc
limit 3;





-------- 49. 
select d.doctor_id,d.name as doctor_id,sum(b.amount) as total_cost
from billing b
join appointments a on a.appointment_id = b.appointment_id
join doctors d on d.doctor_id = a.doctor_id
group by d.doctor_id,d.name

union all

select null as doctor_id, 'grand total' as doctor_name,sum(b.amount)
from billing b;







------ 50. 
with appoint as(
select doctor_id,count(*) as app_count
from appointments
group by doctor_id
)
select d.name as doctor_name, d.specialization,
case
when coalesce(appoint.app_count,0) > 10 then 'busy'
when coalesce(appoint.app_count,0) between 5 and 10 then 'Available'
else 'free'
end as remark,
coalesce(appoint.app_count,0) as appt_count
from doctors d
left join appoint on appoint.doctor_id = d.doctor_id
order by appt_count desc, d.name;
       
           







------ 

select * from appointments;
select * from billing;
select * from departments;
select * from doctors;
select * from medicalrecords;
select * from patients;
select * from rooms;
use hospitaldb;







    