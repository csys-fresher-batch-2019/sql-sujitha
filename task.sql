create table todolist(
  task_idnumber,
  task_name varchar2(50) notnull ,
  task_by varchar2(50),
  task_deadline_date notnull,
  task_completed_date notnull,
  task_created_date notnull,
  task_modified_date notnull;
  task_priority number;
  task_status varchar2(50)
  constrain list_id_pq primarykey(list_id),
  constrain task_by_uq unique(task_by),
  
  constrain task_priority_cq cehck(high,medium,low)
  constrain task_status_cq check(yes,no)
  );
  insert into todollist(task_id,task-name,task_by,task_deadline,task_completed,task_priority,task_status_cq,)                       
  values(1,'oracle','suji','todate('27-12-2019','DD-MM-YYYY'),todate('25-12-2019','DD-MM-YYYY'),'high','yes');
         
  insert into todollist(task_id,task-name,task_by,task_deadline,task_completed,task_priority,task_status_cq)
      
  values(2,'sql','siva','todate('29-12-2019','DD-MM-YYYY') todate('27-12-2019','DD-MM-YYYY'),'low','no');
       
  select * from todolist;
  
  
  
  
