create database orangeHrm

CREATE TABLE jobTitles (
jobTitles VARCHAR(50) NOT NULL,
jobDescription VARCHAR(50) NOT NULL,
jobSpecification VARCHAR(50) NOT NULL,
note VARCHAR(50) NOT NULL
);

alter table jobTitles drop jobSpecification;
alter table jobTitles drop note;
desc jobTitles;

select * from jobTitles;

delete from jobTitles;
insert into jobTitles (jobTitles, jobDescription)
values ('Welness advocate','Contractual rights'), ('Accountant','Economic duties'), ('Manager','Managerial tasks'), ('Senior IT', 'IT Troubleshoot'), ('Sales Consultant', 'Sales Department');

UPDATE jobTitles
SET jobDescription = 'Legal rights'
WHERE JobTitles = 'Welness advocate';

insert into jobTitles (jobTitles, jobDescription)
values ('Call Center Operator','Support for call center'),('Bank contact','Bank operator');
insert into jobTitles (jobTitles, jobDescription)
values ('Welness advocate','Contractual rights');

UPDATE jobTitles
SET jobDescription = 'Banking and money suuport'
WHERE JobTitles = 'Bank contact';

SELECT COUNT(*) FROM jobTitles;
SELECT jobDescription FROM jobTitles WHERE jobDescription='Economic duties';
SELECT jobTitles FROM jobTitles WHERE jobTitles='Welness advocate';
SELECT * FROM jobTitles WHERE jobDescription LIKE '%ght%';
SELECT * FROM jobTitles WHERE jobDescription LIKE 'B%';

select jobTitles, jobDescription, min(jobTitles) from jobTitles
GROUP BY jobTitles, jobDescription;

select * from jobTitles;

DELETE FROM jobTitles WHERE JobTitles = 'Welness advocate';

CREATE TABLE payGrades (
nameGrade VARCHAR(50) NOT NULL,
currency VARCHAR(50) NOT NULL
);

insert into payGrades (nameGrade, currency)
values ('Grade 1','EUR'),('Grade 2','USD'),('Grade 3','UAH'),('Grade 4','GBP'),('Grade 5','AUD'),('Grade 6','TRY'),('Grade 7','CAD'),('Grade 8','RON'),('Grade 9','ALL'),('Grade 10','AOR')
;
insert into payGrades (nameGrade, currency)
values ('Grade 1','EUR');
select * from payGrades;
SELECT currency, COUNT(*) FROM payGrades GROUP BY currency;

SELECT COUNT(*) FROM payGrades;
DELETE FROM payGrades WHERE nameGrade = 'Grade 1';

select * from payGrades cross join jobTitles;
select * from jobTitles inner join payGrades;
select * from payGrades left join jobTitles on payGrades.currency = jobTitles.jobDescription;
select * from payGrades left join jobTitles on payGrades.currency = jobTitles.jobDescription is not null;
select * from jobTitles right join payGrades on jobTitles.jobTitles = payGrades.currency;
select * from jobTitles right join payGrades on jobTitles.jobTitles = payGrades.currency is not null;


CREATE TABLE employmentStatus (
id int not null auto_increment,
employmentStatus VARCHAR(50) not null,
primary key (id),
constraint fk_employmentStatus_Employee foreign key (id) references Employee(id)
);

drop table employmentStatus;
select * from Employee;

insert into employmentStatus (id,employmentStatus)
values ('7','Part-time contract'),('9','Full-time contract'),('8','Freelancer'),('10','Period-time Contract'),('11','Association Contract'),('12','Legal rights ONU');
select * from employmentStatus;

SELECT employmentStatus, employmentStatus FROM employmentStatus WHERE employmentStatus = 'Full-time contract';


CREATE TABLE jobCategories (
jobCategories VARCHAR(50) NOT NULL
);

insert into jobCategories (jobCategories)
values ('Sales Workers'),('Professionals'),('Operatives'),('Managers'),('Officials'),('Technicians'),('Helpers'),('Service Workers'),('Laborers');
select * from jobCategories;
SELECT COUNT(*) FROM jobCategories;


CREATE TABLE workShifts (
name VARCHAR(50) NOT NULL,
fromHour VARCHAR(50) NOT NULL,
toHour VARCHAR(50) NOT NULL,
hoursPerDay VARCHAR(50) NOT NULL
);

alter table workShifts modify hoursPerDay INT;
alter table workShifts modify fromHour VARCHAR(50) NOT NULL;
alter table workShifts modify toHour VARCHAR(50) NOT NULL;

alter table workShifts modify hoursPerDay INT NOT NULL;
alter table workShifts modify fromHour INT NOT NULL;
alter table workShifts modify toHour INT NOT NULL;

desc workShifts;

insert into workShifts (name,fromHour,toHour,hoursPerDay)
values ("morning shift","07:00","15:00",8);

insert into workShifts (name,fromHour,toHour,hoursPerDay)
values ('day shift','14:00','21:00',8),('night shift','20:00','08:00',12),('intermediar shift','10:00','20:00',10);

select * from workShifts;
select * from workShifts where hoursPerDay between 10 and 12;
SELECT * FROM workShifts WHERE name IN ('morning shift');
SELECT * FROM workShifts WHERE fromHour IN ('07:00');

UPDATE workShifts
SET fromHour = '08:00'
WHERE name = 'morning shift';

SELECT hoursPerDay, hoursPerDay FROM workShifts WHERE hoursPerDay > '10';
SELECT hoursPerDay, hoursPerDay FROM workShifts WHERE hoursPerDay >= '10';

delete from workShifts;

CREATE TABLE Employee (
id int primary key auto_increment,
name VARCHAR(50) NOT NULL,
dateOfContract date,
jobTitles VARCHAR(50)
);

select * from Employee;
insert into Employee (name, dateOfContract, jobTitles) values ('Stefan Vancea','2020-07-29','Sales Workers '), ('Maria Zahan','2018-01-10','Laborers'), ('Florin Miler','2022-01-07','Managers'), ('Mariana Niculescu','2000-10-07','Operatives'), ('Julia Morgan','1998-02-05','Managers'), ('Giulia Maccai','2019-09-03','Professionals');
desc Employee;
alter table Employee modify column id int auto_increment first;

select * from employmentStatus;
