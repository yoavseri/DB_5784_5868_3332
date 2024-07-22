declare
  guest_id number;
  check_in_time number; 
  guest_lang varchar2(30);
  entry_date date;
  days number(10);
  
begin
  -- Using assign_receptionist procedure
  guest_id := '&Enter_your_id';
  check_in_time := '&Enter_your_check_in_hour';
  guest_lang := '&Enter_your_language';
  assign_receptionist(guest_id, check_in_time, guest_lang);
  
  -- Using find_most_empty_floor function
  entry_date := to_date('&Enter_your_entry_date', 'YYYY-MM-DD');
  days := '&Enter_your_days';
  dbms_output.put_line(find_most_empty_floor(entry_date, days));
  
end;
