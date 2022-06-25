create database HR_DB;

select * from HR_DB.dbo.employees;
select * from HR_DB.dbo.job_history;
select * from HR_DB.dbo.departments;
select * from HR_DB.dbo.locations;
select * from HR_DB.dbo.countries;
select * from HR_DB.dbo.job_grades;
select * from HR_DB.dbo.jobs;
select * from HR_DB.dbo.regions;

drop table HR_DB.dbo.employees;
drop table HR_DB.dbo.job_history;
drop table HR_DB.dbo.departments;
drop table HR_DB.dbo.locations;
drop table HR_DB.dbo.countries;
drop table HR_DB.dbo.job_grades;
drop table HR_DB.dbo.jobs;
drop table HR_DB.dbo.regions;

create table HR_DB.dbo.regions 
(
	region_id dec primary key, 
	region_name varchar(25)
);

create table HR_DB.dbo.jobs
(
	job_id varchar(10) primary key,
	job_title varchar(35),
	min_salary dec,
	max_salary dec
);

create table HR_DB.dbo.job_grades
(
	grade_level varchar(2) primary key,
	lowest_sal dec,
	highest_sal dec
);

create table HR_DB.dbo.countries
(
	country_id char(2) primary key,
	country_name varchar(40),
	region_id dec,
	foreign key (region_id) references HR_DB.dbo.regions(region_id)
);

create table HR_DB.dbo.locations 
(
	location_id dec primary key,
	street_address varchar(25),
	postal_code varchar(12),
	city varchar(30),
	state_province varchar(12),
	country_id char(2),
	foreign key (country_id) references HR_DB.dbo.countries(country_id)
);

create table HR_DB.dbo.departments
(
	department_id dec primary key,
	department_name varchar(30),
	manager_id dec,
	location_id dec,
	foreign key (location_id) references locations(location_id)
);

create table HR_DB.dbo.job_history
(
	employee_id dec primary key,
	start_date date,
	end_date date,
	job_id varchar(10),
	department_id dec,
	foreign key (department_id) references departments(department_id),
	foreign key (job_id) references jobs(job_id),
	
);

create table HR_DB.dbo.employees 
(
	employee_id dec primary key,
	first_name varchar(20),
	last_name varchar(25),
	email varchar(25),
	phone_number varchar(20),
	hire_date date,
	job_id varchar(10),
	salary dec,
	commission_pct dec,
	manager_id dec,
	department_id dec,
	foreign key (department_id) references departments(department_id),
	foreign key (job_id) references jobs(job_id),
	foreign key (employee_id) references job_history(employee_id)
);





