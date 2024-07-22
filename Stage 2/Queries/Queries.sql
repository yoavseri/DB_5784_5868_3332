-- SELECT Queries:
select 
  beds, 
  room_count / (
                select count(*)
                from Booking
               ) as frequency
from (
     select beds, count(*) as room_count
     from Room natural join Booking
     group by beds
     )
order by beds desc;


select 
  first_name, 
  last_name, 
  phone 
from 
  Booking natural join Guest
where 
  entry_date < date '2007-06-01' 
  and room_number in (112, 304, 466);


select *
from Employee
where em_id not in (
        select em_id
        from ReservationAgent
        union
        select em_id
        from Receptionist
      )
  and salary <= 14000;


select *
from Booking
where (extract(day from entry_date) = 1 and extract(month from entry_date) = 1)
   or (extract(day from entry_date) = 25 and extract(month from entry_date) = 12)
   or (extract(day from entry_date) = 14 and extract(month from entry_date) = 2)
order by entry_date;


-- DELETE Queries:
delete
from Request
where room_number = 205;


delete
from ReservationAgent
where em_id in (
    select em_id
    from ReservationAgent
    intersect
    select em_id
    from Receptionist
);


-- UPDATE Queries:
update Booking
set entry_date = date '2024-09-30'
where guest_id = (
        select guest_id
        from Guest
        where first_name = 'Trixie' and last_name = 'Punter'
      )
  and entry_date > date '2024-07-07';


update Employee
set salary = salary + 1000
where em_id in (
    select em_id
    from (
        select em_id, count(*) as guests
        from inform
        group by em_id
    )
    where guests > 3
);


