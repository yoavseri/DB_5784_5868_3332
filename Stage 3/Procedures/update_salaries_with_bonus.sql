create or replace procedure update_salaries_with_bonus
as
  cursor low_salary_emp is
    select em_id, salary, rating
    from Employee natural join ReservationAgent
    where salary < 10000 and rating >= 8
    for update of salary;
    
  first_bonus number := 300;
  second_bonus number := 200;
  third_bonus number := 100;
  
  v_bonus number;
  
begin
  -- iterate through low salary employees
  for emp in low_salary_emp loop  
    -- determine bonus based on salary and rating
    if emp.salary < 8500 and emp.rating >= 9 then
      v_bonus := second_bonus;
    elsif emp.rating = 10 then
      v_bonus := first_bonus;
    else
      v_bonus := third_bonus;
    end if;
    
    -- update employee salary with bonus
    update employee
    set salary = salary + v_bonus
    where em_id = emp.em_id;
  end loop;
  
  --commit;
  
exception
  when others then
    dbms_output.put_line('error in update_salaries_with_bonus: ' || sqlerrm);
    rollback;
end;
