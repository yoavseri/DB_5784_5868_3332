create or replace procedure assign_receptionist(
  g_id number, 
  check_in_time number, 
  guest_lang varchar2
)
as
  check_shift varchar2(10);
  assigned_receptionist number;
  
begin
  -- determine shift based on check-in time
  if check_in_time >= 7 and check_in_time <= 15 then
    check_shift := 'Morning';
  elsif check_in_time >= 16 and check_in_time <= 23 then
    check_shift := 'Evening';
  else
    check_shift := 'Night';
  end if;
  
  begin
    -- try to find receptionist with matching language and shift
    select em_id 
    into assigned_receptionist
    from Receptionist
    where lang = guest_lang
          and shift = check_shift 
          and rownum = 1;
          
  exception
    when no_data_found then
      -- if not found, assign random receptionist with matching language
      select em_id
      into assigned_receptionist
      from (
        select em_id
        from Receptionist
        where lang = guest_lang
        order by dbms_random.value
      )
      where rownum = 1;
      
      -- update assigned receptionist's shift
      update Receptionist
      set shift = check_shift
      where em_id = assigned_receptionist;
      
      dbms_output.put_line('receptionist ' || assigned_receptionist || 
                           ' moved to ' || check_shift || ' shift.');
  end;
  
  -- raise error if no receptionist found
  if assigned_receptionist is null then
    raise_application_error(-20001, 'no receptionist available for the specified language.');
  end if;
  
  -- assign receptionist to guest
  update Booking
  set em_id = assigned_receptionist
  where guest_id = g_id;
  
  dbms_output.put_line('guest ' || g_id || ' assigned to receptionist ' || assigned_receptionist || '.');
  
exception
  when others then
    dbms_output.put_line('an error occurred: ' || sqlerrm);
end;
