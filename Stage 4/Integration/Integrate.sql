------------- Step 1 -------------
--- a:
alter table Employee
add city varchar2(35) default 'Unknown';

alter table Employee
add address varchar2(35) default 'Unknown';

alter table Employee
add phone varchar2(35) default 'Unknown';

alter table Employee
add email varchar2(45) default 'Unknown';

alter table Employee
add gender varchar2(35) default 'Unknown';

alter table Employee
add join_date date default date '1970-01-01';

alter table Employee
add pos_id number(9) default 0;

alter table Employee
add depart_id number(5) default 0;



--- b:
alter table Employee
add temp int default 0;

update Employee
set temp = rownum;

alter table Employee2
add temp int default 0;

update Employee2
set temp = rownum;



--- c:
update Employee
set 
    city = (
        select Employee2.city 
        from Employee2 
        where Employee2.temp = mod(Employee.temp - 1, (select count(*) from Employee2)) + 1
    ),
    address = (
        select Employee2.address
        from Employee2 
        where Employee2.temp = mod(Employee.temp - 1, (select count(*) from Employee2)) + 1
    ),
    phone = (
        select Employee2.phone
        from Employee2 
        where Employee2.temp = mod(Employee.temp - 1, (select count(*) from Employee2)) + 1
    ),
    email = (
        select Employee2.email
        from Employee2 
        where Employee2.temp = mod(Employee.temp - 1, (select count(*) from Employee2)) + 1
    ),
    gender = (
        select Employee2.gender 
        from Employee2 
        where Employee2.temp = mod(Employee.temp - 1, (select count(*) from Employee2)) + 1
    ),
    join_date = (
        select Employee2.joindate
        from Employee2 
        where Employee2.temp = mod(Employee.temp - 1, (select count(*) from Employee2)) + 1
    ),
    pos_id = (
        select Employee2.posid 
        from Employee2 
        where Employee2.temp = mod(Employee.temp - 1, (select count(*) from Employee2)) + 1
    ),
    depart_id = (
        select Employee2.departid
        from Employee2 
        where Employee2.temp = mod(Employee.temp - 1, (select count(*) from Employee2)) + 1
    );

      
    
--- d:
alter table Employee
add constraint fk_pos_depart_id_employee
foreign key (pos_id, depart_id) references Position (posid, departid) on delete cascade; 

 
            
--- e:         
alter table Employee
add temp_id int default null;



--- f:
update Employee
set 
    temp_id = (
        select Employee2.id 
        from Employee2 
        where Employee2.temp = Employee.temp
    );



--- g:
alter table Employee
drop column temp;

alter table Employee2
drop column temp;



--- h:
alter table EmployeeShift
drop constraint fk_employeeshift;

alter table LeaveRequest
drop constraint fk_leaverequest;

alter table Training
drop constraint fk_tranning;

alter table EmployeeTraining
drop constraint fk_employee2tranning;

alter table Manager
drop constraint fk_manager2;



--- i:
alter table Employeetraining
drop constraint fk_employee2tranning2;


alter table EmployeeShift
drop constraint pk_employeeshift;

alter table LeaveRequest
drop constraint pk_leaverequest;

alter table Training
drop constraint pk_tranning;

alter table EmployeeTraining
drop constraint pk_employee2tranning;

alter table Manager
drop constraint pk_manager;



--- j:
alter table EmployeeShift
add em_id int default 0;

alter table LeaveRequest
add em_id int default 0;

alter table Training
add em_id int default 0;

alter table EmployeeTraining
add em_id int default 0;

alter table Manager
add em_id int default 0;



--- k:
update EmployeeShift
set 
    em_id = (
        select Employee.em_id 
        from Employee 
        where EmployeeShift.empid = Employee.temp_id
    );

update LeaveRequest
set 
    em_id = (
        select Employee.em_id 
        from Employee 
        where LeaveRequest.empid = Employee.temp_id
    );

update Training
set 
    em_id = (
        select Employee.em_id 
        from Employee 
        where Training.trainerid = Employee.temp_id
    );

update EmployeeTraining
set 
    em_id = (
        select Employee.em_id 
        from Employee 
        where EmployeeTraining.trainedid = Employee.temp_id
    );

update Manager
set 
    em_id = (
        select Employee.em_id 
        from Employee 
        where Manager.id = Employee.temp_id
    );



--- l:
alter table Training
drop constraint uq_training;


alter table EmployeeShift
drop column empid;

alter table LeaveRequest
drop column empid;

alter table Training
drop column trainerid;

alter table EmployeeTraining
drop column trainedid;

alter table Manager
drop column id;



--- m:
alter table EmployeeShift
add constraint PK_EMPLOYEESHIFT
primary key (em_id, starttime);

alter table LeaveRequest
add constraint PK_LEAVEREQUEST
primary key (requestid);

alter table Training
add constraint PK_TRANNING
primary key (trainingid);

alter table EmployeeTraining
add constraint PK_EMPLOYEE2TRANNING
primary key (em_id, trainingid);

alter table Manager
add constraint pk_manager
primary key (em_id);

--------------

alter table EmployeeTraining
add constraint FK_EMPLOYEE2TRANNING2
foreign key (trainingid) references Training (trainingid) on delete cascade;


alter table EmployeeShift
add constraint FK_EMPLOYEESHIFT
foreign key (em_id) references Employee (em_id) on delete cascade;

alter table LeaveRequest
add constraint FK_LEAVEREQUEST
foreign key (em_id) references Employee (em_id) on delete cascade;

alter table Training
add constraint FK_TRANNING
foreign key (em_id) references Employee (em_id) on delete cascade;

alter table EmployeeTraining
add constraint FK_EMPLOYEE2TRANNING
foreign key (em_id) references Employee (em_id) on delete cascade;

alter table Manager
add constraint FK_MANAGER2
foreign key (em_id) references Employee (em_id) on delete cascade;



--- n:
drop table Employee2;



--- o:
update Position
set role = 'Receptionist'
where exists (
    select *
    from Employee e
    natural join Receptionist r
    where e.pos_id = Position.posid 
    and e.depart_id = Position.departid
);

update Position
set role = 'Reservation Agent'
where exists (
    select *
    from Employee e
    natural join ReservationAgent ra
    where e.pos_id = Position.posid 
    and e.depart_id = Position.departid
);




------------- Step 2 -------------
--- a:
alter table Receptionist
drop column shift;

--- b:
alter table Employee
drop column salary;
