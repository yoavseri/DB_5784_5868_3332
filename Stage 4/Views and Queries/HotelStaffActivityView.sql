--- View Defenition:
create or replace view HotelStaffActivityView as
select
    e.em_id,
    e.first_name as employee_first_name,
    e.last_name as employee_last_name,
    case
        when ra.em_id is not null then 'Reservation Agent'
        when r.em_id is not null then 'Receptionist'
    end as employee_type,
    count(distinct b.guest_id) as total_bookings_handled,
    count(distinct i.guest_id) as total_guests_informed
from
    Employee e
    inner join (
        select em_id, 'Reservation Agent' as type from ReservationAgent
        union
        select em_id, 'Receptionist' as type from Receptionist
    ) staff on e.em_id = staff.em_id
    left join ReservationAgent ra on e.em_id = ra.em_id
    left join Receptionist r on e.em_id = r.em_id
    left join Booking b on e.em_id = b.em_id
    left join Inform i on e.em_id = i.em_id
group by
    e.em_id, e.first_name, e.last_name, 
    case
        when ra.em_id is not null then 'Reservation Agent'
        when r.em_id is not null then 'Receptionist'
    end
order by
    total_bookings_handled desc, total_guests_informed desc;
    
    
    
--- Query for Example:
select
    employee_type,
    count(*) as staff_count,
    avg(total_bookings_handled) as avg_bookings_per_employee,
    avg(total_guests_informed) as avg_guests_informed_per_employee,
    sum(total_bookings_handled) as total_bookings,
    sum(total_guests_informed) as total_guests_informed
from 
    HotelStaffActivityView
group by 
    employee_type
order by 
    avg_bookings_per_employee desc;


