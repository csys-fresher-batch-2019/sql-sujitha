BUSLIST

 create table buslist
 (
 bus_num number,
 bus_name varchar2(50) not null,
 constraint bus_num_pk primary key(bus_num)
 );
 insert into buslist(bus_num,bus_name)values(101,'TAT');
 insert into buslist(bus_num,bus_name)values(102,'VTAT');
 insert into buslist(bus_num,bus_name)values(103,'AVK');
 insert into buslist(bus_num,bus_name)values(104,'SRM');
 insert into buslist(bus_num,bus_name)values(105,'SRS');
 select * from buslist;
 drop table buslist;
 
 create table busroutes
(
route_no number not null,
from_location varchar2(50) not null,
to_location varchar2(50) not null,
j_date date not null,
bus_num number not null,
);
insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(1,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),101,);
insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(2,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),102);
insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(3,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),103);
insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(4,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),104);
insert into busroutes(route_no,from_location,to_location,j_date,bus_num)values(5,'chennai','kovilpatti',to_date('12/12/2019','DD/MM/YYYY'),105);
select * from busroutes;



create table busdetails
(
bus_no number not null,
start_time varchar2(30) not null,
end_time varchar2(30) not null,
no_of_seats number not null,
available_seats number not null,
seat_type varchar2(50) not null,
fair number not null,
constraint start_time_uq unique(start_time,end_time),
constraint fair_uq unique(fair),
constraint seat_type_ck check(seat_type in('seater','sleeper'))
);
insert into busdetails(bus_no,start_time,end_time,no_of_seats,available_seats,seat_type,fair)values
(101,('9:10:00'),('5:10:00'),40,20,'seater',800);
insert into busdetails(bus_no,start_time,end_time,no_of_seats,available_seats,seat_type,fair)values
(102,('8:15:00'),('5:00:00'),45,25,'sleeper',850);
insert into busdetails(bus_no,start_time,end_time,no_of_seats,available_seats,seat_type,fair)values
(103,('9:30:00'),('5:45:00'),50,28,'seater',750);
insert into busdetails(bus_no,start_time,end_time,no_of_seats,available_seats,seat_type,fair)values
(104,('10:30:00'),('6:30:00'),60,15,'sleeper',1000);
insert into busdetails(bus_no,start_time,end_time,no_of_seats,available_seats,seat_type,fair)values
(105,('8:10:00'),('5:20:00'),52,10,'sleeper',1200);
select * from busdetails;
drop table busdetails;



