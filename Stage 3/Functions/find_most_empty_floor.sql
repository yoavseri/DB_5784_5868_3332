create or replace function find_most_empty_floor(p_group_entry_date date, p_days number) return number
as
  v_most_empty_floor number := null;
  v_max_rooms number := 0;
  v_current_floor number;
  v_room_count number;
  type t_room_list is table of number;
  v_available_rooms t_room_list;
  
begin
  -- Try block
  begin
    -- get available rooms
    select room_number
    bulk collect into v_available_rooms
    from Room b1
    where b1.room_number not in (
      select b2.room_number
      from Booking b2
      where (b2.entry_date <= p_group_entry_date + p_days - 1 
             and b2.entry_date + b2.days - 1 >= p_group_entry_date)
    );
    
    -- find floor with most available rooms
    for i in 1..v_available_rooms.count loop
      v_current_floor := find_floor(v_available_rooms(i));
      
      -- count rooms on current floor
      v_room_count := 0;
      for j in 1..v_available_rooms.count loop
        if find_floor(v_available_rooms(j)) = v_current_floor then
          v_room_count := v_room_count + 1;
        end if;
      end loop;
      
      -- update most empty floor if necessary
      if v_room_count > v_max_rooms then
        v_max_rooms := v_room_count;
        v_most_empty_floor := v_current_floor;
      end if;
    end loop;
      
    -- Throw an exception if v_most_empty_floor is null
    if v_most_empty_floor is null then
      raise_application_error(-20001, 'No empty floor found');
    end if;
    
    return v_most_empty_floor;
    
  -- Catch block
  exception
    when no_data_found then
      dbms_output.put_line('No data found');
      return null;
    when others then
      dbms_output.put_line('Error in find_most_empty_floor: ' || sqlerrm);
      return null;
  end;
end;
