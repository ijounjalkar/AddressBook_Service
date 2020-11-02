
show databases;

//UC1

create database addressbook_service;
show databases;
use addressbook_service;
select database();

//UC2

create table addressbook_service
    -> (
    -> fname varchar(100) NOT NULL,
    -> lname   varchar(100) NOT NULL,
    -> address varchar(200) NOT NULL,
    -> city varchar(50) NOT NULL,
    -> zip  numeric(6) NOT NULL,
    -> phone_no numeric(10) NOT NULL,
    -> email nvarchar(200) NOT NULL,
    -> primary key (fname, lname)
    -> );


//UC3

describe addressbook_service;
alter table addressbook_service
    -> add state varchar(60) NOT NULL
    -> after city;
desc addressbook_service;

//UC4

insert into addressbook_service (fname, lname, address, city, state, zip, phone_no, email)
    -> values
    -> ('Isha', 'Jounjalkar', 'Narendra Nagar', 'Nagpur','Maharastra', 440015, 7457120752, 'jjjkdj@gmail.com'),
    -> ('Leena', 'Sarode', 'Panvel', 'Mumbai', 'Maharastra', 400019, 9859629542, 'hjhgy@gmail.com'),
    -> ('Tushar', 'Patil', 'Shivaji Nagar', 'Kolhapur', 'Maharastra', 410554, 9522698569, 'hjhvsgks.gmail.com');
 select * from addressbook_service;

//UC4

update addressbook_service
    -> set phone_no = 9878595363 where fname = 'Leena';
select * from addressbook_service;
update addressbook_service
    -> set lname = 'jounjalkar' where fname = 'Isha';
select * from addressbook_service;

//UC5

 delete from addressbook_service where fname = 'Tushar';
 select * from addressbook_service;

//UC6

 select * from addressbook_service where city = 'Mumbai' or state = 'Maharastra';

//UC7

select city, state, count(*)
    -> from addressbook_service group by city, state;

//UC8

select * from addressbook_service where city = 'Nagpur' order by fname, lname;

//UC9 &11

alter table addressbook_service
   -> add type varchar(10) NOT NULL
   -> after lname;
 update addressbook_service
    -> set type = 'Family' where fname = 'Isha';
 update addressbook_service
    -> set type = 'Friends' where fname = 'Leena';

//UC10

select type,count(fname) from addressBook group by type;


