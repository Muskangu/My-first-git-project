use practice;
show tables;
CREATE TABLE message (
    id INT PRIMARY KEY AUTO_INCREMENT,
    message VARCHAR(255) NOT NULL,
    created_at DATETIME NOT NULL
);
CREATE TABLE employee (
	emp_name varchar(55) not null,
	emp_desg varchar(55) not null,
    emp_code int not null,
    emp_sal float not null
);

desc message;
insert into message(id, message, created_at) values(01, 'hi my name is ram', '2019-01-01 09:20:02');
insert into message(id, message, created_at) values(02, 'hi my name is sam', '2019-01-02 08:20:03');
insert into message(id, message, created_at) values(03, 'hi my name is shyam', '2019-01-05 10:20:10');
insert into message(id, message, created_at) values(04, 'hi my name is niki', '2021-03-07 12:05:20');
insert into message(id, message, created_at) values(05,'hi my name is raman', '2022-09-06 11:08:25');

select * from message;
alter table message rename to emp_details;
select * from emp_details;

desc employee;
insert into employee(emp_name, emp_desg, emp_code, emp_sal) 
values('Ram', 'Account_Manager', 05, 20000);
insert into employee(emp_name, emp_desg, emp_code, emp_sal) 
values('Sam', 'Manager', 03, 30000);
insert into employee(emp_name, emp_desg, emp_code, emp_sal) 
values('Shyam', 'Assistant', 04, 10000);
insert into employee(emp_name, emp_desg, emp_code, emp_sal) 
values('Niki', 'Consultant', 06, 15000);
insert into employee(emp_name, emp_desg, emp_code, emp_sal) 
values('Raman', 'Clerk', 01, 5000);

select * from employee;

SHOW processlist;

SET GLOBAL EVENT_SCHEDULER=ON;

SHOW processlist;


CREATE EVENT IF NOT EXISTS event_01
ON SCHEDULE AT current_timestamp()
DO
INSERT INTO EMPLOYEE(emp_name, emp_desg, emp_code, emp_sal)
VALUES('aman', 'accountant', 02, 35000);

select * from employee;

SHOW EVENTS FROM classicmodels;


CREATE EVENT IF NOT EXISTS event_02
ON SCHEDULE AT current_timestamp + interval 1 minute
ON COMPLETION preserve
DO
INSERT INTO EMPLOYEE(emp_name, emp_desg, emp_code, emp_sal)
VALUES('tiya', 'CEO', 07, 25000);

select * from employee;

CREATE EVENT IF NOT EXISTS event_03
ON SCHEDULE EVERY 1 second
starts current_timestamp 
ENDS current_timestamp + interval 20 MINUTE
ON COMPLETION preserve
DO
INSERT INTO EMPLOYEE(emp_name, emp_desg, emp_code, emp_sal)
VALUES('riya', 'CFO', 08, 40000);

select * from employee;

DROP EVENT IF EXISTS event_03;
DROP EVENT IF EXISTS event_02;

desc emp_details;

CREATE EVENT IF NOT EXISTS test_event_01
ON SCHEDULE AT CURRENT_TIMESTAMP
DO
  INSERT INTO emp_details(message,created_at)
  VALUES('Test MySQL Event 1',NOW());
  
select * from emp_details;

SHOW EVENTS FROM classicmodels;

CREATE EVENT IF NOT exists test_event_04
ON SCHEDULE AT CURRENT_TIMESTAMP + INTERVAL 1 MINUTE
ON COMPLETION PRESERVE
DO
   INSERT INTO emp_details(message,created_at)
   VALUES('Test MySQL Event 2',NOW());
   
select * from emp_details;

CREATE EVENT test_event_05
ON SCHEDULE EVERY 1 MINUTE
STARTS CURRENT_TIMESTAMP
ENDS CURRENT_TIMESTAMP + INTERVAL 1 HOUR
DO
   INSERT INTO emp_details(message,created_at)
   VALUES('Test MySQL recurring Event',NOW());
   
select * from emp_details;
show tables;
desc employee;
DROP EVENT IF EXISTS test_event_05;

CREATE INDEX test_index ON employee (emp_name);

ALTER TABLE employee
Drop INDEX test_index;
Select * from employee;

Create view test_emp AS
select emp_name, emp_desg
from employee
where emp_code = 5;

select * from test_emp;