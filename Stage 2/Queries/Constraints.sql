-- Queries to add constrains:
alter table Inform 
drop constraint fk_em_id_inform;

alter table Inform 
add constraint fk_em_id_inform
foreign key (em_id) references ReservationAgent (em_id) on delete cascade;


alter table Employee
add constraint salary_check check (salary between 5000 and 30000);


alter table Receptionist
modify lang default 'English';


