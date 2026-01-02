------------- Many to Many Relationships ------------------

create table students (
s_id serial primary key,
name varchar(100) not null
);

INSERT INTO Students (name) VALUES
('Raju'),
('Sham'),
('Alex');


select * from students;

create table courses(
c_id serial primary key,
name varchar(100) not null,
fee numeric not null
);

INSERT INTO courses (name, fee)
VALUES
('Mathematics', 500.00),
('Physics', 600.00),
('Chemistry', 700.00);


select * from courses;

create table enrollment(
enroll_id serial primary key,
s_id int not null,
c_id int not null,

foreign key (s_id) references students(s_id),
foreign key (c_id) references courses (c_id)
);

alter table enrollment
add column enrollment_date DATE NOT NULL;

INSERT INTO enrollment (s_id, c_id, enrollment_date)
VALUES
(1, 1, '2024-01-01'), -- Raju enrolled in Mathematics
(1, 2, '2024-01-15'), -- Raju enrolled in Physics
(2, 1, '2024-02-01'), -- Sham enrolled in Mathematics
(2, 3, '2024-02-15'), -- Sham enrolled in Chemistry
(3, 3, '2024-03-25'); -- Alex enrolled in Chemistry


select * from enrollment;


--- Joining the 3 tables ----

select s.name, c.name, c.fee, e.enrollment_date from 
enrollment e
join students s on e.s_id = s.s_id
join courses c on c.c_id = e.c_id;




