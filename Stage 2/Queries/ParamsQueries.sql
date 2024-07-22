-- Queries with Parameters:
select 
  entry_date, 
  first_name, 
  last_name, 
  phone
from 
  Booking natural join Guest 
where 
  entry_date between
    date &<name="from date" hint="Enter start date" type=string>
    and
    date &<name="to date" hint="Enter end date" type=string>


select 
  guest_id, 
  first_name,
  entry_date, 
  room_number, 
  days
from 
  Booking natural join Guest
where 
  guest_id = &<name=id hint="Enter your ID">
  and entry_date > date '2024-01-01';


select 
  first_name, 
  last_name, 
  phone
from 
  Guest
where 
  guest_id in (
    select guest_id
    from Room natural join Request
    where room_number = &<name=room hint="Enter a room number">
  );


select room_number
from Room
where beds = &<name=beds list="2,4,5" hint="Enter the room type you wish yourself" type=integer>;
