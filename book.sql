create table book(
book_id number,
book_name varchar2(100) not null,
author_name varchar2(100) not null,
price number not null,
publisher varchar2(100)not null,
version number,
categories varchar2(50) not null,
active number not null,
constraint book_id_pk primary key(book_id),
constraint price_ck check(price >= 0),
constraint book_name_uq unique(book_name,author_name,version),
constraint active_ck check(active in(0,1))
);
insert into book(book_id,book_name,author_name,price,publisher,version,categories,active)values
(1,'code tech','steve',100,'ss creation',2,'technical',1);
insert into book(book_id,book_name,author_name,price,publisher,version,categories,active)values
(2,'java','suji',500,'xx creation',1,'cs',1);
insert into book(book_id,book_name,author_name,price,publisher,version,categories,active)values
(3,'sql','suji',200,'yy creation',2,'database',1);
select * from book order by book_id ASC;

create table orders(
order_id number,
user_name varchar2(50) not null,
book1_id number,
ordered_date timestamp default systimestamp not null ,
delivered_date  timestamp default systimestamp not null,
total_amount number not null,
qty number not null,
status varchar(100),
comments varchar2(500) not null,
constraint order_id_pk primary key(order_id),
constraint book_id_fk foreign key(book1_id) references book(book_id),
constraint total_amount_ck check(total_amount>=0),
constraint qty_ck check(qty>=1),
constraint status_ck check(status in('delivered','cancel','not available','shipping')),
constraint user_name_uq unique(user_name,book1_id,ordered_date)
);
insert into orders(order_id,user_name,book1_id,total_amount,qty,status,comments)values
(1,'nivi',1,200,1,'delivered','yes');
select * from orders;
 select book_name,((select sum(qty) from orders where book1_id=b.book_id)) from book b;                          

