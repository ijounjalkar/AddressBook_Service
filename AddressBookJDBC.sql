
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

//UC9

alter table addressbook_service add id INT AUTO_INCREMENT NOT NULL primary key  first;
 alter table addressbook_service change id contact_id INT;
alter table addressbook_service rename contact_table;
create table addressbook_service 
    -> (
    -> id       INT NOT NULL AUTO_INCREMENT,
    -> addName  VARCHAR(150) NOT NULL,
    -> type     VARCHAR(150),
    -> primary key (id)
    -> );
alter table addressbook_service add contacts_id INT NOT NULL after id;
alter table addressbook_service add foreign key (contacts_id) references contact_table(contact_id);

//UC10

 select type,count(contacts_id) from addressbook_service group by type;

//UC11

insert into addressbook_service (contacts_id, addName, type) values (1,'AddressBook1','family');
insert into addressbook_service (contacts_id, addName, type) values (2,'AddressBook2','friend');
insert into addressbook_service (contacts_id, addName, type) values (3,'AddressBook3','profession');
insert into addressbook_service (contacts_id, addName, type) values (1,'AddressBook2','friend');

//UC13

select contact_table.contact_id, contact_table.fname,contact_table.lname,contact_table.address, contact_table.city, contact_table.state, 
       contact_table.zip, contact_table.phone_no,contact_table.email,addressbook_service .addName, addressbook_service .type
from contact_table inner join addressbook_service on contact_table.contact_id = addressbook_service .contacts_id;

