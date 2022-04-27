create database shopping_mart;
show create database shopping_mart;     
use shopping_mart;

create table merchant (merchant_id int not null, name varchar(55), city varchar(55), primary key (merchant_id));
insert into merchant values( 1, 'Ram', 'Delhi');
insert into merchant values(2, 'Sam', 'Mumbai');
insert into merchant values( 3, 'Niki', 'Noida');
insert into merchant values(4, 'Roy', 'Bangkok');
insert into merchant values( 5, 'Joy', 'Agra');
insert into merchant values(6, 'Bigbazzar', 'Kolkata');

show tables;
desc table merchant;

create table customers (customer_id int not null, customer_name varchar(55), city varchar(55), merchant_id int not null,
primary key (customer_id),
foreign key (merchant_id) references merchant (merchant_id));

insert into customers values( 1, 'ratan', 'delhi', 1);
insert into customers values(2, 'raman', 'mumbai', 2);
insert into customers values(3, 'saman', 'kolkata',3);
insert into customers values(4, 'manan', 'noida', 4);
insert into customers values(5, 'mansi', 'agra', 4);

show tables;
describe table customers;
select * from customers;

create table orders (order_no int not null,
 purchase_amt float not null,  
 order_date date not null, 
 customer_id int not null,
 merchant_id int not null, 
 primary key (order_no), 
 foreign key (merchant_id) references merchant (merchant_id),
 foreign key (customer_id) references customers (customer_id));

insert into orders values( 1, 50, '2019-01-23', 1, 1);
insert into orders values( 2, 100, '2015-03-28', 1, 2);
insert into orders values( 3, 200, '2014-04-20', 2, 3);
insert into orders values( 4, 300, '2017-10-29', 3, 4);
insert into orders values( 5, 500, '2021-12-12', 3, 4);

alter table orders
modify order_date date;
truncate table orders;

 select * from orders;
 select * from customers;
 select * from merchant;
 
 use shopping_mart;
 
 select c.customer_id , c.customer_name, o.order_no
 from customers c
 inner join orders o
  on o.customer_id = c.customer_id;
  
  select order_no from orders where purchase_amt<500;
 select count(*) city from customers;
 
 select count(order_no), m.name, o.order_date
 from merchant m
 inner join orders o
on o.merchant_id = m.merchant_id;

 select * from orders;
 select * from merchant;
 
 select m.name , o.order_no, o.customer_id
 from orders o
inner join merchant m
on m.merchant_id = o.merchant_id;
 
 create table result1 as         
 select m.name , o.order_no, o.customer_id
 from orders o
inner join merchant m
on m.merchant_id = o.merchant_id;

select * from result1;

select c.customer_name, count(r.order_no), r.name
from result1 r 
inner join customers c
on c.customer_id = r.customer_id
group by r.name, c.customer_name;

select * from customers;
select * from merchant;
select * from orders;