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
  constrain task_created_date_cq check(task_created_date<sysdate),
  constrain task_modified_date_cq check(task_created_date<task_modified date)
  constrain task_priority_cq cehck(high,medium,low)
  constrain task_status_cq check(yes,no)
  );
  insert into todollist(task_id,task-name,task_by,task_deadline,task_completed,task_priority,task_status_cq,task_created_date,
                        task_modified date)
  values(1,'oracle','suji','todate('27-12-2019','DD-MM-YYYY'),todate('25-12-2019','DD-MM-YYYY'),'high','yes',
         todate('10-05-2019','DD-MM-YYYY'),todate('26-12-2019','DD-MM-YYYY'));
  insert into todollist(task_id,task-name,task_by,task_deadline,task_completed,task_priority,task_status_cq,task-created-date,
        task_modified-date)
  values(2,'sql','siva','todate('29-12-2019','DD-MM-YYYY') todate('27-12-2019','DD-MM-YYYY'),'low','no'
        todate('11-06-2019','DD-MM-YYYY'),todate('28-12-2019','DD-MM-YYYY'));
  select * from todolist;
  
  
  
  
