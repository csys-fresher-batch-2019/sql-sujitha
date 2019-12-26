create table emp
(
task_id number,
user_name varchar2(50),
e_mail varchar2(50),
e_password varchar2(10)
);
insert into emp(task_id,user_name,e_mail,e_password)values('1','suji','xxx@gmail.com','yyy');
insert into emp(task_id,user_name,e_mail,e_password)values('2','siva','zzz@gmail.com','aaa');
select * from emp;
