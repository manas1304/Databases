select * from person;


------------ Alter Query : Modify Table ----------

-- How to add or remove a column

alter table person
add column age int default 0;

alter table person 
drop column age;

alter table person
rename column name to fname;


-- to alter the name of the table directly ----
alter table person_table_practice
rename to person;

--- altering the dtype of the column

alter table person
alter column fname
set data type varchar(50);

alter table person
alter column age
set default 1;

select * from person;

select table person 
alter column fname
set default 'unkown';


----------------- Check Constraint ---------------
select * from person;

alter table person 
add column mob varchar(15)
check (length (mob) >= 10);

insert into person(mob)
values(1890);

-- to remove the constraint ---
alter table person
drop constraint person_mob_check;

-- naming the constraint

alter table person
add constraint mob_no_less_than_10
check (length(mob) >= 10);




