create table todolist(
  list_id number,
  list_name varchar(20) notnull ,
  task_by varchar(20),
  task_deadline date notnull,
  task_completed date notnull,
  constrain list_id_pq primarykey(list_id),
  constrain task_by_uq unique(task_by),
  );
  insert into todollist(list_id,list-name,task_by,task_deadline,task_completed)values(1,'oracle','suji','todate('27-12-2019',dd-mm-yyyy),
  todate('25-12-2019'),(''dd-mm-yyyy);
  insert into todollist(list_id,list-name,task_by,task_deadline,task_completed)values(2,'jdj','siva','todate('28-12-2019',dd-mm-yyyy),
  todate('26-12-2019'),(''dd-mm-yyyy);
   insert into todollist(list_id,list-name,task_by,task_deadline,task_completed)values(3,'sql','na','todate('29-12-2019',dd-mm-yyyy),
  todate('27-12-2019'),(''dd-mm-yyyy);
  select * from todolist;
  
  
  
  
