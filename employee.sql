create table emp
(
task_id number,
user_name varchar2(50) not null,
e_mail varchar2(50),
e_password varchar2(10) not null,
  constraint task_id_pk primary key(task_id),
constraint e_mail_uq unique(e_mail)
  );
  
insert into emp(task_id,user_name,e_mail,e_password)values('1','suji','suji@gmail.com','yyy');
insert into emp(task_id,user_name,e_mail,e_password)values('2','siva','siva@gmail.com','aaa');
insert into emp(task_id,user_name,e_mail,e_password)values('3','nivi','nivi@gmail.com','bbb');
insert into emp(task_id,user_name,e_mail,e_password)values('4','kavi','kavi@gmail.com','xxx');

select * from emp;
