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



create table collection 
(
books_id number,
book_tittle varchar2(50) not null,
price number not null,
constraint books_id_pk primary key(books_id)
);
insert into collection(books_id,book_tittle,price) values (01,'c',100);
insert into collection(books_id,book_tittle,price) values (02,'java',200);
select * from collection;

create  table stocks
(
stock_no number not null,
book_id number,
qanty number not null,
constraint bookk_id_fk foreign key(book_id)references collection(books_id),
constraint qanty_ck check(qanty>0)
);
 insert into stocks(stock_no,stock_id,qanty)values(01,101,10);
insert into stocks(stock_no,stock_id,qanty)values(02,102,5);
select * from stocks;                         

create table order_items
(
item_id number not null,
order_id number not null,
books_id number not null,
qanty number not null ,
status varchar2(50) not null,
constraint orders_id_fk foreign key(order_id)references collection(books_id),
constraint status_ck check(status in('completed','cancel'))
);
insert into order_items(item_id,order_id,books_id,qanty,status) values(1,1,01,3,'completed');
insert into order_items(item_id,order_id,books_id,qanty,status) values(2,2,01,5,'completed');
insert into order_items(item_id,order_id,books_id,qanty,status) values(3,2,02,3,'completed');
select *from order_items;
select qanty from stocks where books_id=101;
