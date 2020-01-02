# Bus ticket booking

*http://busapp.in

## Features
* user should be able to view all buses

### Feature 1:List all buses
```sql
 
 create table buslist
 (
 bus_num number,
 bus_name varchar2(50) not null,
 constraint bus_num_pk primary key(bus_num)
 );
 ```
 ```sql
 insert into buslist(bus_num,bus_name)values(101,'TAT');
 insert into buslist(bus_num,bus_name)values(102,'VTAT');
 insert into buslist(bus_num,bus_name)values(103,'AVK');
 insert into buslist(bus_num,bus_name)values(104,'SRM');
 insert into buslist(bus_num,bus_name)values(105,'SRS');
```
```sql
Query:
 select * from buslist;
 ```
 
  ### feature 2:list all the busroutes
```sql
create table busroutes
(
route_no number not null,
from_location varchar2(50) not null,
to_location varchar2(50) not null,
j_date date not null,
bus_num number not null,
constraint bus_num_fk foreign key(bus_num)references buslist(bus_num),
constraint route_no_pk primary key(route_no)
);
```
```sql

insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(1,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),101);
insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(2,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),102);
insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(3,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),103);
insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(4,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),104);
insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(5,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),105);
```
query:
```sql
select * from busroutes;
```
 ### Feature 3: List all the Busdetails
 ```sql
 create table busdetails
(
travel_id number not null,
route_no number not null,
bus_num number not null,
travel_date date not null,
start_time varchar2(50) not null,
end_time varchar2(50) not null,
fair number not null,
available_seats number not null,
constraint travel_id_pk primary key(travel_id),
constraint route_no_fk foreign key(route_no) references busroutes(route_no),
constraint bus_num_fk foreign key(bus_num)references buslist(bus_num),
constraint fair_ck check(fair>0),
constraint available_seats_ck check(available_seats>0)
);
```
```sql
insert into busdetails(travel_id,route_no,bus_num,travel_date,start_time,end_time,fair,available_seats)values
(10,1,101,to_date('14-01-2020','DD-MM-YYYY'),('9:10:00,pm'),('5:10:00,am'),800,20);
insert into busdetails(travel_id,route_no,bus_num,travel_date,start_time,end_time,fair,available_seats)values
(20,2,102,to_date('14-01-2020','DD-MM-YYYY'),('9:30:00,pm'),('6:00:00,am'),850,25);
insert into busdetails(travel_id,route_no,bus_num,travel_date,start_time,end_time,fair,available_seats)values
(30,3,103,to_date('14-01-2020','DD-MM-YYYY'),('10:10:00,pm'),('5:30:00,am'),750,30);
```
query:
```sql
select * from busdetails;
drop table busdetails;
```
### Feature 4:Liat all the User_details
```sql

create table user_details
(
user_id number not null,
user_name varchar2(50) not null,
user_phn_num number(10) not null,
user_gender varchar2(50)not null,
constraint user_id_pk primary key(user_id),
constraint user_phn_num_uq unique(user_phn_num),
constraint user_gender_ck check(user_gender in('M','F')),
constraint user_phn_num_ck check(length(To_char(user_phn_num))=10)
);
```
```sql
insert into user_details(user_id,user_name,user_phn_num,user_gender)values(11,'suji',9876543290,'F');
insert into user_details(user_id,user_name,user_phn_num,user_gender)values(12,'siva',8765493243,'M');
insert into user_details(user_id,user_name,user_phn_num,user_gender)values(13,'nivi',7896547895,'F');
```
query:
```sql
select * from user_details;
drop table user_details;
```
### Feature 5:Ticket booking
```sql

 create table ticket_booking
 (
 travel_id number not null,
 no_of_seats_booked number not null,
 user_id number not null,
 fair number not null,
 j_date date not null,
 booked_date date not null,
 payment number not null,
 status varchar2(50) not null,
 constraint travel_id_fk foreign key(travel_id)references busdetails(travel_id),
 constraint booked_date_ckk check(j_date>=booked_date),
 constraint status_ckk check(status in('booked','cancelled')),
 constraint payment_ck check(payment>0)
  );
  ```
  ```sql
 insert into ticket_booking(travel_id,no_of_seats_booked,user_id,fair,j_date,booked_date,payment,status)values
 (10,1,11,800,to_date('14_01_2020','DD-MM-YYYY'),to_date('10/12/2019','DD/MM/YYYY'),800,'booked');
 insert into ticket_booking(travel_id,no_of_seats_booked,user_id,fair,j_date,booked_date,payment,status)values
 (20,1,12,850,to_date('14-01-2020','DD-MM-YYYY'),to_date('20/12/2019','DD/MM/YYYY'),850,'cancelled');
 insert into ticket_booking(travel_id,no_of_seats_booked,user_id,fair,j_date,booked_date,payment,status)values
 (30,1,13,750,to_date('14-01-2020','DD-MM-YYYY'),to_date('15/12/2019','DD/MM/YYYY'),700,'booked');
 ```
 query:
 ```sql
  
 select * from ticket_booking;
 drop table ticket_booking;
 commit;
```





