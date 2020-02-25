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
 no_of_seats number not null,
 seat_type varchar2(50) not null,
 constraint bus_num_pkk primary key(bus_num),
 constraint seat_type_ckk check(seat_type in('seater','sleeper'))
 );
 ```
 ```sql
 insert into buslist(bus_num,bus_name,no_of_seats,seat_type)values(101,'TAT',10,'seater');
 insert into buslist(bus_num,bus_name,no_of_seats,seat_type)values(102,'VTAT',10,'sleeper');
 insert into buslist(bus_num,bus_name,no_of_seats,seat_type)values(103,'TVS',10,'seater');
 insert into buslist(bus_num,bus_name,no_of_seats,seat_type)values(104,'ABB',10,'seater');
 insert into buslist(bus_num,bus_name,no_of_seats,seat_type)values(105,'AVS',10,'seater');
 insert into buslist(bus_num,bus_name,no_of_seats,seat_type)values(106,'AKV',10,'seater');
 ```
```sql
Query:
 select * from buslist;
 ```
 ```sql
| bus_num | bus_name | no_of_seats | seat_type |
|---------|----------|-------------|-----------|
| 101     | TAT      | 10          | seater    |
| 102     | VTAT     | 10          | sleeper   |
```
 
  ### feature 2:list all the busroutes
```sql
(
route_no number not null,
from_location varchar2(50) not null,
to_location varchar2(50) not null,
constraint route_no_pkk primary key(route_no)
);
 create sequence route_no_seq start with 1;
```
```sql
insert into busroutes(route_no,from_location,to_location)values(route_no_seq.nextval,'chennai','Kovilpatti');
insert into busroutes(route_no,from_location,to_location)values(route_no_seq.nextval,'chennai','Madurai');
insert into busroutes(route_no,from_location,to_location)values(route_no_seq.nextval,'chennai','Banglore');
insert into busroutes(route_no,from_location,to_location)values(route_no_seq.nextval,'Trichy','Virudhunagar');
insert into busroutes(route_no,from_location,to_location)values(route_no_seq.nextval,'Thirunelveli','Madurai');
```
query:
```sql
select * from busroutes;
```
```sql
| route_no | from_location | to_location |
|----------|---------------|-------------|
| 1        | chennai       | Kovilpatti  |
| 2        | chennai       | Madurai     |
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
 create sequence travel_id_seq start with 1 ;
```
```sql
insert into busdetails(travel_id,route_no,bus_num,travel_date,start_time,end_time,fair,available_seats)values
(travel_id_seq.nextval,1,101,to_date('14-01-2020','DD-MM-YYYY'),('9:00:00'),('5:30:00'),900,10);
insert into busdetails(travel_id,route_no,bus_num,travel_date,start_time,end_time,fair,available_seats)values
(travel_id_seq.nextval,2,102,to_date('14-01-2020','DD-MM-YYYY'),('9:20:00'),('6:30:00'),850,10);
insert into busdetails(travel_id,route_no,bus_num,travel_date,start_time,end_time,fair,available_seats)values
(travel_id_seq.nextval,3,103,to_date('14-01-2020','DD-MM-YYYY'),('9:30:00'),('7:30:00'),700,10);
insert into busdetails(travel_id,route_no,bus_num,travel_date,start_time,end_time,fair,available_seats)values
(travel_id_seq.nextval,4,104,to_date('14-01-2020','DD-MM-YYYY'),('9:50:00'),('6:30:00'),800,10);
insert into busdetails(travel_id,route_no,bus_num,travel_date,start_time,end_time,fair,available_seats)values
(travel_id_seq.nextval,5,105,to_date('14-01-2020','DD-MM-YYYY'),('9:00:00'),('6:30:00'),900,10);
insert into busdetails(travel_id,route_no,bus_num,travel_date,start_time,end_time,fair,available_seats)values
(travel_id_seq.nextval,1,106,to_date('14-01-2020','DD-MM-YYYY'),('9:40:00'),('8:30:00'),850,10);
```
query:
```sql
select * from busdetails;
drop table busdetails;
```
```sql

| travel_id | route_no | bus_num | travel_date | start_time | end_time   | fair | available_seats |
|-----------|----------|---------|-------------|------------|------------|------|-----------------|
| 10        | 1        | 101     | 14-01-20    | 9:10:00,pm | 5:10:00,am | 800  | 20              |
| 20        | 2        | 102     | 14-01-20    | 9:30:00,pm | 6:00:00,am | 850  | 25              |
```
### Feature 4:Liat all the User_details
```sql

create table user_details
(
user_id number not null,
user_name varchar2(50) not null,
user_phn_num number(10) not null,
user_gender varchar2(50)not null,
password varchar2(8) not null,
constraint user_id_pk primary key(user_id),
constraint user_phn_num_uq unique(user_phn_num),
constraint user_gender_ck check(user_gender in('M','F')),
constraint user_phn_num_ck check(length(To_char(user_phn_num))=10)
);
create sequence user_id_seq start with 1;
```
```sql
insert into user_details(user_id,user_name,user_phn_num,user_gender)values(user_id_seq.nextval,'suji',9876543290,'F','suji1234');
insert into user_details(user_id,user_name,user_phn_num,user_gender)values(user_id_seq.nextval,'siva',8765493243,'M','siva1234');
insert into user_details(user_id,user_name,user_phn_num,user_gender)values(user_id_seq.nextval,'nivi',7896547895,'F','nivi1234');
```
query:
```sql
select * from user_details;
drop table user_details;
```
```sql

| user_id | user_name | user_phn_num | user_gender |
|---------|-----------|--------------|-------------|
| 11      | suji      | 9876543290   | F           |
| 12      | siva      | 8765493243   | M           |
```
### Feature 5:Booking
```sql
 create table booking
(
booking_id number not null,
user_id number not null,
bus_num number not null,
user_gender varchar2(50)not null,
seat_no number not null,
booked_date date not null,
created_date  timestamp default systimestamp ,
gender_preferences varchar2(50) not null,
amount number not null,
status varchar2(50) default 'BOOKED',
constraint booking_id_pk primary key(booking_id),
constraint booking_user_idd_fk foreign key(user_id)references user_details(user_id),
constraint booking_bus_num_fkk foreign key(bus_num)references buslist(bus_num),
constraint booking_gender_preferences_ck check(gender_preferences in ('yes','no')),
 constraint booking_status_ckk check(status in('BOOKED','CANCELLED')),
 constraint booking_amount_ck check(amount>0)
);
create sequence booked_id start with 1;
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
```sql
| travel_id | no_of_seats_booked | user_id | fair | j_date   | booked_date | payment | status    |
|-----------|--------------------|---------|------|----------|-------------|---------|-----------|
| 10        | 20                	| 11      | 800  | 14-01-20 | 10-12-19    | 800     | booked    |
| 20        | 1                  | 12      | 850  | 14-01-20 | 20-12-19    | 850     | cancelled |
```
### Query:
```sql
 1.To display all available seats
 select   bl.no_of_seats-sum(tb.no_of_seats_booked)  available_seats from
buslist bl,ticket_booking tb,busdetails bd where bl.bus_num=bd.bus_num and bd.travel_id=tb.travel_id and tb.travel_id=10
group by bl.no_of_seats,tb.travel_id
```
```sql
| available_seats |
|-----------------|
| 33              |
```

```sql
    2.To display all available seats along with travel_id and no:
            select   tb.travel_id,bl.no_of_seats,bl.no_of_seats-sum(tb.no_of_seats_booked)  available_seats from
buslist bl,ticket_booking tb,busdetails bd where bl.bus_num=bd.bus_num and bd.travel_id=tb.travel_id --and tb.travel_id=10
group by bl.no_of_seats,tb.travel_id
```
```sql
| travel_id | no_of_seats | available_seats |
|-----------|-------------|-----------------|
| 10        | 40          | 33              |
| 20        | 50          | 49              |
| 30        | 60          | 59              |
```
```sql
   3.To update available of seats by using travel id:
            update busdetails bd1 set bd1.available_seats =(select  bl.no_of_seats-sum(tb.no_of_seats_booked)  available_seats from
buslist bl,ticket_booking tb,busdetails bd where bl.bus_num=bd.bus_num and bd.travel_id=tb.travel_id and tb.travel_id=30
group by bl.no_of_seats,tb.travel_id )where bd1.travel_id=30;
```
```sql
| travel_id | route_no | bus_num | travel_date | start_time  | end_time   | fair | available_seats |
|-----------|----------|---------|-------------|-------------|------------|------|-----------------|
| 30        | 3        | 103     | 14-01-20    | 10:10:00,pm | 5:30:00,am | 750  | 59              |
```
```sql
   4. TO display all user details to give travelid :
             select bl.bus_num,bl.bus_name,bl.no_of_seats,bl.seat_type,bd.fair,ud.user_name,
sum(tb.no_of_seats_booked)booked_seats,tb.j_date,tb.booked_date
from buslist bl,busdetails bd,ticket_booking tb,busroutes br,
user_details ud where bl.bus_num=bd.bus_num and bd.travel_id=tb.travel_id 
and br.route_no=bd.route_no and ud.user_id=tb.user_id and tb.travel_id=10 group by 
bl.bus_num,bl.bus_name,bl.no_of_seats,bl.seat_type,bd.fair,ud.user_name,tb.j_date,tb.booked_date;
```
```sql
| bus_num | bus_name | no_of_seats | seat_type | fair | user_name | booked_seats | j_date   | booked_date |
|---------|----------|-------------|-----------|------|-----------|--------------|----------|-------------|
| 101     | TAT      | 40          | seater    | 800  | suji      | 2            | 14-01-20 | 10-12-19    |
| 101     | TAT      | 40          | seater    | 800  | nivi      | 5            | 14-01-20 | 15-12-19    |
```
```sql
   5.To display bus_name by using to_location:
              select bus_name from buslist where bus_num=(select bus_num from busdetails where route_no =
(select route_no from busroutes where to_location='Kovilpatti'));
```
```sql
| bus_name |
|----------|
| TAT      |
```
```sql
   6.To give the total payment from booking seats:
          select sum(payment) from ticket_booking where status='booked';
```
```sql
| Payment |
|---------|
| 6300    |
```
```sql
   7.To display the females count:
           select count (*) from user_details where user_gender='F';
```
```sql
| count |
|-------|
| 2     |
```
```sql
   8. To display the total no seats booked:
             select booked_date,count(no_of_seats_booked)as total_seats from ticket_booking where  status='booked' group by no_of_seats_booked,booked_date; 
```
```sql
| booked_date | total_seat |
|-------------|------------|
| 10-12-19    | 2          |
| 15-12-19    | 1          |
| 15-12-19    | 1          |
```
```sql
   9.To update the status: 
            update ticket_booking set status='booked'where travel_id=(select travel_id from busdetails where bus_num=
(select bus_num from buslist where bus_name='VTAT'));
select status  from ticket_booking where travel_id=20;
```
```sql
   10.To display the busname and fair by using joins:
            select buslist.bus_name, busdetails.fair from buslist inner join busdetails on buslist.bus_num = busdetails.bus_num;
```
```sql
  11.to display the bus details:
           select buslist.bus_name,buslist.no_of_seats, busdetails.fair,busdetails.available_seats from buslist  left join busdetails on buslist.bus_num = busdetails.bus_num;
```
```sql
12.To display the fair details:
select fair from busdetails order by fair desc;
```

 .

   





