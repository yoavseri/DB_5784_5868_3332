--- View Definition:
create or replace view EmployeeDetailsView as
select
    e.em_id,
    e.first_name,
    e.last_name,
    e.email,
    e.phone,
    d.departName,
    p.role,
    p.salary,
    m.accessType as managerAccessType
from
    Employee e
    join Position p on e.pos_id = p.posId and e.depart_id = p.departId
    join Department d on e.depart_id = d.departId
    left join Manager m on e.em_id = m.em_id;



--- Query for Example:
select 
    first_name, 
    last_name, 
    departName, 
    role,
    salary
from
    EmployeeDetailsView
where 
    salary > 70
order by 
    salary desc;
