create table customers (

cust_id serial primary key,
cust_name varchar(100) not null

);

select * from customers;

create table orders (

ord_id serial primary key,
ord_date date not null,
price numeric not null,
cust_id integer not null,
foreign key (cust_id) references customers(cust_id)

);

select * from orders;

INSERT INTO customers (cust_name)

VALUES 

    ('Raju'), ('Sham'), ('Paul'), ('Alex');



INSERT INTO orders (ord_date, cust_id, price)

VALUES 

    ('2024-01-01', 1, 250.00),  

    ('2024-01-15', 1, 300.00),  

    ('2024-02-01', 2, 150.00),

    ('2024-03-01', 3, 450.00),

    ('2024-04-04', 2, 550.00); 


-------------------Joins and it's types  ------------------

-- Join operation is used to combine rows from two or more tables based on a related column between them.

-- Types of Join

-- 1. Cross Join -- Every row from one table is combined with every row of another table

select * from customers cross join orders;

-- 2. Inner Join -- Return only the columns where there is a match between the specified columns
------------------- in both the left(or first) and right(or second) tables.


select * from customers c 
inner join orders o
on c.cust_id = o.cust_id;

------ Inner Join with Group by ---------
select c.cust_name, count(o.ord_id) from customers c
inner join orders o
on c.cust_id = o.cust_id
group by cust_name;



-- 3. Left Join -- Returns all rows from the left(or first) table and matching rows from the right(or right) table.

select * from customers c
left join orders o
on c.cust_id = o.cust_id;


-- 4. Right Join -- Returns all rows from the right(or first) table and matching rows from the left(or second) table.


select * from customers c
right join orders o
on c.cust_id = o.cust_id;


